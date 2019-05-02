Leaf[] leaves = new Leaf[5];
float Y;
PVector position;
void setup() {
  size(500,500);
  for (int i = 0; i < leaves.length; i++) { // create leaves in main tab
    leaves[i] = new Leaf();
  }
}

void draw () {
  background(0,0,800);
  if (mouseX<250) //moves sun
  Y = 250 - mouseX;
  else
  Y = 0 + (mouseX-250);
  position = new PVector(mouseX, Y);
  fill(0,100,0);
  rect(0,450, 500, 50);//create ground
  fill(139,69,19);
  beginShape(); //create trunk
  vertex(230,300);
  vertex(270,300);
  vertex(270,450);
  vertex(230,450);
  endShape(CLOSE);
  fill(0,255,0);
  triangle(250,50,350,300,150,300);//create top of tree
  fill(255,255,0);
  ellipse(position.x, position.y, 50,50); //create sun
  for (int i = 0; i<leaves.length; i++) {
  leaves[i].display();
  }

}

class Leaf{
  
  PVector center, screen, scale;
  float theta;
  
  void display() { //create leaves
    
  center = new PVector(random(width), random(200, 400));  
  scale = new PVector(width*.2, height*.125);
  theta = map(mouseX, 0, width, 0, TWO_PI);
  scale.y = map(mouseY, 0, height, height*.025, width*.3);
    
  pushStyle();
  noStroke();
  fill(0, 250, 0);
  pushMatrix();
  translate(center.x, center.y);
  rotate(theta);//rotate leaves along mouseX
  scale(scale.x, scale.y);
  triangle(1, 0, -1, 1, -1, -1);
  screen = new PVector(screenX(1, 0), screenY(1, 0));
  popMatrix();
  popStyle();
  }
}
