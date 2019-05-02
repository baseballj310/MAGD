Barrel myBarrel;
int mpressed = 0, mpressedState = 0;
int kpressed = 0, kpressedState = 0;
float posY= 300;
float velocityY = 0.0; 
float gravity = 1.5;
boolean onGround = false;
float jumpSize = -30;
int x = 0;

void setup(){
  size(500,500);
  myBarrel = new Barrel ();
}

void draw(){
  background(155);
  drawMan();//draws man to jump barrel
  update();//allows drawn man to jump
  drawGround();//draws line representing ground
  if (kpressedState == 1){
  myBarrel.sendBarrel();//draws and sends barrel rolling along ground
  }

}
void drawGround(){
  line(x, height-25, width, height-25);
}
void drawMan(){
  fill(200,75,0);
  rect(400, posY+50, 25, 25);
  rect(385, posY+75, 50, 85);
  beginShape();
  vertex(385, posY+75);
  vertex(385, posY+100);
  vertex(375, posY+125);
  vertex(360, posY+125);
  endShape(CLOSE);
    beginShape();
  vertex(435, posY+75);
  vertex(435, posY+100);
  vertex(445, posY+125);
  vertex(460, posY+125);
  endShape(CLOSE);
  rect(385, posY+160, 15, 65);
  rect(420, posY+160, 15, 65);
}
void keyPressed(){
  kpressed = kpressed + 1;
  kpressedState = (kpressed % 2);
}
void update(){
  velocityY = gravity + velocityY;
  posY = velocityY + posY;
  if (posY >= (height/2)){
    posY = (height/2) - gravity;
    onGround = true;
  } else {
    onGround = false;
  }
  drawMan();
}

void mousePressed(){
  if (onGround){
    jump();
  }
}

void jump(){
  velocityY = jumpSize;
}

class Barrel{
int xpos;


Barrel(){
  xpos = 0;
}

void sendBarrel(){
  fill(180, 150, 000);
  ellipse(xpos, 450, 50, 50);
  if (xpos<=550){
  xpos = xpos + 5;
  if (xpos == 550){
    xpos = 0;
  }
  }
}
}
