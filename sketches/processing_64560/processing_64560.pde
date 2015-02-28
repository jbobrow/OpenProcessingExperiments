
// With thanks to Brendan Dawes, Wikipedia and Wolfram Alpha, I've put together a quick sketch
// that will draw a Lissajous Curve for you, based on two float inputs: wx and wy
// References:
//   Dawes' talk at TEDx Manchester got me started: http://www.brendandawes.com/project/tedx-manchester/
//   Wikipedia page on the Lissajous Curve: http://en.wikipedia.org/wiki/Lissajous_curve
//   Wolfram Alpha's breakdown finally got me to crack the formulas
//     http://mathworld.wolfram.com/LissajousCurve.html
//     http://www.wolframalpha.com/input/?i=lissajous+curve
//
// Matt Bernhardt

float wx = random(10); // horizontal angular frequency
float wy = random(10); // vertical angular frequency

float xpos, ypos; // plotted point
float px, py; // previous points
float a = 1; // constants
float b = 1; 
int frame = 0;

float dx = PI/2; // horizontal angular phase
float ax = 1; // horizontal amplitude
float dy = 0; // vertical angular phase
float ay = 1; // vertical amplitude

void setup() {
  size(640,480);
  fill(64, 64, 64, 64);
  background(255);
  smooth();
}

void draw() {
  if(mousePressed){
    background(255);
    wx = random(10);
    wy = random(10);
    frame = 0;
  }
  fill(255,2);
  noStroke();
  rect(0,0,width,height);
  
  xpos = width/3 * ax*sin(wx*radians(frame)+dx) + width/2;
  ypos = height/3 * ay*sin(wy*radians(frame)+dy) + height/2;

  float tempFrameR = 128*sin(radians(frame))+128;
  float tempFrameG = 128*sin(radians(frame+120))+128;
  float tempFrameB = 128*sin(radians(frame+240))+128;
  stroke(tempFrameR, tempFrameG, tempFrameB);
 
  strokeWeight(2);
  if(frame>0) { line(px, py, xpos, ypos); }

  px = xpos;
  py = ypos;  
  frame++;
  
}

void keyPressed() {
  saveFrame("lissajous_curve_x"+wx+"_y"+wy+".png");
  exit(); // stops the program
}

