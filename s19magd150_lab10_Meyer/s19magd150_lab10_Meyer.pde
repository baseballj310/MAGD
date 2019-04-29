float angle, camSpeed, 
  x, y, z, scale,
  lookAtX, lookAtY, lookAtZ, 
  upX, upY, upZ, viewDist,
  extents = 250;
  PShape C, S;
  PImage texture;

void setup(){
  size(640,420,P3D);
  background(64);
  noStroke();
   angle = 0;
  camSpeed = 5.0;
  x = width / 2.0;
  y = height / 2.0;
  z = viewDist = (height / 2.0) / tan(PI * 60.0 / 360.0);
  lookAtX = x;
  lookAtY = y;
  lookAtZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
  scale = min(width,height)/5.0;
  texture = loadImage("bubbles.tif");
  C = loadShape("cylinder.obj");
  C.scale(150,100,150);
  C.setTexture(texture);
  S = loadShape("sphere.obj");
  S.scale(150,150,250);
  S.setTexture(texture);
}
void draw() {
  background(32);
  pointLight(127, 255, 127, width, 0, -extents);
  ambientLight(127, 127, 255, width, 0, extents);
  directionalLight(127, 127, 127, 0, 0, -1);
  perspective(PI / 3.0, float(width) / float(height), z / 2000.0, z * 2000.0);
  camera(x, y, z, 
    lookAtX, lookAtY, lookAtZ, 
    upX, upY, upZ);
    keys();
    drawObjects();
}
void drawObjects() {
  // Draw the sphere.
  pushMatrix();
  translate(320, 420, -height / 1.5);
  rotateX(angle);
  rotateY(angle);
  shape(S, 0,0,250,250);
  popMatrix();

  // Draw the box.
  pushMatrix();
  translate(480, 100, -height / 1.5);
  rotateY(angle);
  scale(scale);
  beginShape();
  texture(texture);
  vertex(-1,-1,1);
  vertex(1,-1,1);
  texture(texture);
  vertex(1,1,1);
  vertex(-1,1,1);
  endShape(CLOSE);
  beginShape();
  texture(texture);
  vertex(1,-1,1);
  vertex(1,-1,-1);
  texture(texture);
  vertex(1,1,-1);
  vertex(1,1,1);
  endShape(CLOSE);
  beginShape();
  texture(texture);
  vertex(1,-1,-1);
  vertex(-1,-1,-1);
  texture(texture);
  vertex(-1,1,-1);
  vertex(1,1,-1);
  endShape(CLOSE);
  beginShape();
  texture(texture);
  vertex(-1,-1,-1);
  vertex(-1,-1,1);
  texture(texture);
  vertex(-1,1,1);
  vertex(-1,1,-1);
  endShape(CLOSE);
  beginShape();
  texture(texture);
  vertex(-1,1,1);
  vertex(1,1,1);
  texture(texture);
  vertex(1,1,-1);
  vertex(-1,1,-1);
  endShape(CLOSE);
  beginShape();
  texture(texture);
  vertex(-1,-1,-1);
  vertex(1,-1,-1);
  texture(texture);
  vertex(1,-1,1);
  vertex(-1,-1,1);
  endShape(CLOSE);
  popMatrix();
  // Draw the cylinder
  pushMatrix();
  translate(160,-150,-height / 1.5);
  rotateY(angle);
  shape(C,0,250);
  popMatrix();
  angle += 0.01;
}

void keys() {
  if (keyPressed) {
    if (y > 0 && (keyCode == UP)) {
      y -= camSpeed;
      lookAtY = y;
    }
    if (x > -extents && (keyCode == LEFT)) {
      x -= camSpeed;
      lookAtX = x;
    }
    if (y < height - 10 && (keyCode == DOWN)) {
      y += camSpeed;
      lookAtY = y;
    }
    if (x < extents+250 && (keyCode == RIGHT)) {
      x += camSpeed;
      lookAtX = x;
    }
  }
}
