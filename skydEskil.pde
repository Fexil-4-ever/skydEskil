//skydEskil v0.9
//ProShooter.exe
import processing.sound.*;
boolean down;
SoundFile gun;
SoundFile damage;

Screen screenController;
Game myGame;
Bullet mine;
void setup(){
   size(800,800);
   myGame = new Game();
   screenController = new Splashscreen();
   cursor(CROSS);
   imageMode(CENTER);
   
   gun = new SoundFile(this, "SniperSound.mp3");
   damage = new SoundFile(this, "Damage.mp3");
}

void draw(){
  if (mousePressed && down){
    gun.stop();
    down = false;
    gun.play();
  }
  else if (!mousePressed){
    down = true;
  }
  
  screenController.update();
  screenController.render();
  if (mine != null){
    mine.update();
    mine.render();
  }
}

void mousePressed(){
  mine = new Bullet(new PVector(myGame.currLevel.playerOne.pos.x,
  myGame.currLevel.playerOne.pos.y), getDirection(new PVector(width/2, height/2), new PVector (mouseX, mouseY)) );
}

void keyReleased(){
if (keyCode == SHIFT)
          myGame.currLevel.playerOne.run = false;
}