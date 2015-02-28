
int[] age = new int[16];
float[] shortMem = new float[16];
float[] longMem = new float[16];
int hoverAge = 0;
float hoverScore = 0;

PFont font;

void setup() {
  size(1000, 700);
  background(255);
  smooth();
  font = loadFont("BerlinSansFB-Reg-48.vlw");
  loadData();
}

void draw() {
  background(255);
  fill(0);
  textFont(font, 24);
  drawFace();
  drawGraph();
  text("Age: " + hoverAge, 730, 200);
  text("Score: " + hoverScore, 730, 230);
  int y = int(mouseY);
  int x = int(mouseX);
}

void drawFace() {  
  int rightEye = 225;
  int leftEye = 475;
  
  fill(238, 209, 207);
  ellipse(60, 350, 100, 100);
  ellipse(640, 350, 100, 100);
  ellipse(350, 350, 600, 600);
  ellipse(350, 375, 60, 20);
  
  fill(255);
  ellipse(rightEye, 350, 100, 100);
  ellipse(leftEye, 350, 100, 100);
  
  fill(0, 175, 0);
  ellipse(rightEye, 350, 50, 50);
  ellipse(leftEye, 350, 50, 50);
  
  fill(0);
  ellipse(rightEye, 350, 20, 20);
  ellipse(leftEye, 350, 20, 20);
  
  noFill();
  stroke(0, 0, 0);
  bezier(rightEye, 425, rightEye, 550, leftEye, 550, leftEye, 425);
}

void loadData() {
  String[] row = loadStrings("data.csv");
  int counter = 0;
  
  println(row[1]);
  
  for (int i = 1; i < row.length; i++) {
    String[] splitThing = split(row[i], ",");
    age[i] = int(splitThing[0]);
    shortMem[i] = float(splitThing[1]);
    longMem[i] = float(splitThing[2]);
    println(i + "\t" + shortMem[i]);
    println(i + "\t" + longMem[i]);
    counter++;
  }
}

void drawGraph() {
  int x = 135;
  int y = 155;
  int w = 14;
  float h = 0;
  int tempAge;
  float tempShort;
  float tempLong;
  
  //Run though all short term memory entries
  for (int i = 1; i<shortMem.length; i++) {
    //If the current age is less than 50
    if (age[i] < 50) {
      fill(255, 0, 0);
    }
    else {
      fill(0, 0, 255);
    }
        
    //If mouse position is within boundary of the current age bar
    if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h)
    {
      //Set hover highlight
      fill(0);
      hoverAge = age[i];
      hoverScore = shortMem[i];
    }
    
    h = shortMem[i] * 150;
    rect(x, y, w, h);
    x+=w;
  }
  
  for (int i = 1; i<longMem.length; i++) {
    if (age[i] < 50) {
      fill(255, 0, 0);
    }
    else {
      fill(0, 0, 255);
    }
    h = longMem[i] * 150;
    if (mouseX > x + 215 && mouseX < x + w + 215 && mouseY > y && mouseY < y + h){
      fill(255);
      hoverAge = age[i];
      hoverScore = longMem[i];
    }
    rect(x + 215, y, w, h);
    x-=w;
  }
  fill(0);
  textFont(font, 16); 
  text("Short Term Memory", 205, 150);
  text("Long Term Memory", 353, 150);
}


