
//import processing.pdf.*;
//Brought to you by Kavita through tricks picked up from Daniel Shiffman

//  A headline
String [] headlines = {
  "Early bird gets the worm", 
  "Second mouse gets the cheese", 
  "Third times the charm",
  "Cyan Magenta Yellow Key",
  "Jackson Five",
  "R.O.Y.G.B.V.",
  "Se7en",
}
;
float x;   //  horizontal location of headline
PFont melior;
int index = 0;

int num = 1;
int s=20;
color[] c = new color[num];
int [] a = new int [num];
int [] b = new int [num];

void setup() {
  size (200, 200);
  smooth();
  x = width; //intialize headline to right of screen
  //beginRaw(PDF, "raw.pdf");
    for (int i = 0; i < num; i++) {
    a [i]= int(random(width));
    b [i]= int(random(height));
    c [i]= color(random(256), random(100), random(200));
  }
}

void draw () {
  //textMode(SHAPE);
  background (245, 240, 240, 10);
  fill(0);
  stroke(255, 0, 0);
  strokeWeight(1);
  frameRate(10);
  for (int i = 0; i < num; i++) {
    b[i]++;
    if (b[i]> (height + s)) {
      b[i] = -s;
    }
    texts(a[i], b[i], c[i]);
  }
}
void texts (int a, int b, color col) {


  melior = loadFont ("melior.vlw");

  textFont(melior, 20); //PFont, text size
  textAlign(LEFT);
  int xx = 10;
  //for (int i = 0; i < (headlines.length); i++) {
  //ea char is individual
  text(headlines[index], x, height/2+ random(10,20));
  x = x - 25;
  xx += 5;
  //}
  float w = textWidth(headlines[index]);

  if (x < -w) {
    x = width;
    index = int(random(headlines.length));
  }
  //    endRaw();
}


