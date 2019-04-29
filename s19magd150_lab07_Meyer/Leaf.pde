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
