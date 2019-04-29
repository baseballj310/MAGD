import processing.pdf.*;
boolean recordScreen;
String fileName;
String[] lines;
String sourceFile = "movieposter.txt";
PFont garamond;
PFont timesNewRoman;
float y=0;
float x=1;
int count;
int mpressed = 0;
int mpressedState = 0;
void setup() {
  size(500,640);
  background(0);
  lines = loadStrings(sourceFile);
  garamond = loadFont("Garamond-16.vlw");//loads garamond font from file
  textAlign(CENTER, TOP);
  textFont(garamond);
  textSize(40);
  noStroke();
  count = lines.length;
  timesNewRoman = createFont(PFont.list()[352],48,true);//create font from standard list
  fileName = "Lab08";
}

void draw() {
  fill(250,0,0);
  rect(10,10,width-20, height-20);
  fill(0,350,0);
  ellipse(150,440,100,100);
  ellipse(350,440,100,100);
  fill(220,83,0);
  triangle(200,500,300,500,250,600);
  fill(0);
  quad(125,325,220,420,200,440,105,345);
  quad(375,325,280,420,300,440,395,345);
  if (mpressedState ==1){
  fill(0);
  for (int i=0;i<count;i++){//reads .txt file and prints string array
  textFont(garamond);
  textSize(40);
  text(lines[0],250,50);
  textFont(timesNewRoman);
  text(lines[1],250,100);
  }
  }
    if (recordScreen) { //begins pdf recording
    beginRecord(PDF, fileName + ".pdf");
  }
  if (recordScreen) { //ends pdf recording
    endRecord();
    recordScreen = false;
  }
}


String loadString(String filePath, String delimiter) {
  String[] lines = loadStrings(filePath);
  StringBuilder sbuilder = new StringBuilder();
  for (int i = 0, size = lines.length; i < size; ++i) {
    sbuilder.append(lines[i]);
    sbuilder.append(delimiter);
  }
  return sbuilder.toString();
}

void mousePressed(){//user input to begin and end recording of pdf
  if (mouseButton == RIGHT) {
    recordScreen = true;
  }
  else { //displays movie poster heading
  mpressed = mpressed + 1;
  mpressedState = (mpressed % 2);
  }
}
