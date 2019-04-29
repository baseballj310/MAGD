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
