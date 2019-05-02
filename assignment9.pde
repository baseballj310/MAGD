import processing.video.*;
import processing.sound.*;
PImage frame;
Capture mirror;
SoundFile chime;
boolean playing = false;


void setup(){
  size (700, 700); 
  frame = loadImage("mirror_PNG17336.png");
  mirror = new Capture(this, 640,480);
  mirror.start();
  chime = new SoundFile(this, "magic-chime-01.wav");

}

  void mousePressed(){
  mirror.read();
  chime.amp(.7);
  chime.play();
  }

 void draw() {
   
   image(frame, 0, 0, width/2, height); //creates mirror on left half of screen
   tint (200, 10);
   image(mirror, 50, 175, 250, 450);//capture live image and display over the mirror
   image(frame,350,0,width/2,height);//second mirror created to "reflect" first
   image(mirror,450,175,250,450);//image is a "reflection"
 }
