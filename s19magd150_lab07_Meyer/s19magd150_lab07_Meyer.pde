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
