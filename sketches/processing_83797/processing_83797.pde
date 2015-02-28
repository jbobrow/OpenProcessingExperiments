
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/83724*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//FINAL PROJECT DATA VISUALIZATION 
//UFO
//National UFO Reporting Center Report Index by Shape of Craft 

PFont font;
String[] Reports = {
  "unspecified", 
  "unknown", 
  "changing", 
  "chevron", 
  "cigar", 
  "circle", 
  "cone", 
  "fireball", 
  "cross", 
  "cylinder", 
  "oval", 
  "diamond", 
  "disk", 
  "formation", 
  "egg",
};

int[] People  = {
  2810, 
  5570, 
  1890, 
  900, 
  2080, 
  6980, 
  320, 
  5120, 
  220, 
  1210, 
  3630, 
  1140, 
  5580, 
  2230, 
  770,
};

int SelectedBar = 4;


PImage bg;
int y;
void setup() {
  bg=loadImage("ufo.jpg");

  size(1024, 768);
//  frameRate(8);

  noStroke(); 

  fill(0, 100, 153, 204);
  smooth();
//  noLoop();
}
//////////////////////////////////////////////////////////////////////// DRAW LOOP
void draw() {
  background(bg);

  stroke(255, 255, 255);
  
  fill(122,123,222);
  circles(950, 95); 
  fill(127, 147, 3);
  circles(850, 125);
  fill(111,111,111);
  circles(750, 155);
  
  titleText();
  
  displayGraph();
  
  fill(255,231,123);
  text(Reports[SelectedBar], 400, 300);
//  fill(255); //unecessary because fill is already white
  text(People[SelectedBar], 750, 300);
  fill(222,123,123);
  textSize(22);
  text("Reports:", 400, 240);
  text("People:", 750, 240);
}
//////////////////////////////////////////////////////////////////////// Circles function

void circles(int a, int b) { 

  ellipse(a, b, 120, 20); 
  ellipse(a, b, 60, 60);
}
void titleText() {
  textSize(55);
  fill(150, 222, 255);
  text("National UFO Reporting Center", 30, 75); 
  fill(0, 255, 255);
  text("Report Index", 200, 130);
  fill(255, 255, 255, 50);
  text("By Shape of Craft", 200, 180);
}
//////////////////////////////////////////////////////////////////////// DRAW Graph
void displayGraph() {
  int x=0;

  for (int i=0;i<15;i++) {

   /* if (mousePressed==false) {

      fill(255);
      text(("Reports:"), 650, 250);
      text(Reports[i], 800, 250);
      text(("People:"), 650, 300);
      text(People[i], 800, 300);

      fill(255, 110, 120);
    }
    else {
      fill(255, 182, 193);
    }
*/
    float h = map(People[i], 220, 6980, 0, 450);
    //rect(x+50, (height-(h)-80), 30, (h+150));
    drawBar(x, height-h-80, h, i);
    x+=40;
  }
}

void drawBar(float x, float y, float h, int currentBar) {
  x+=80;
//  if ((mouseX>x && mouseX<=x+30) && (mouseY > something && mouseY < something)) {
  if (mouseX>x && mouseX<=x+30) {
    SelectedBar=currentBar;
    //if over the bar, change the fill color
    fill(100,20, 50);
  } else {
    //default fill color
    fill(244, 150, 223,222);
  }
  rect(x, y, 30, h);
}


