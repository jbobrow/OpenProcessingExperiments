
// define our shape variable
PShape logo;
PFont font;
float angle;
float jitter;
boolean rotSwitch=false;
 
// set up our app borders
void setup() {
// set the size of our app
size(270,270);
 
// find our shape
logo = loadShape("spin.svg");
font = createFont("Arial",12);
// anti-alias that shit!
smooth();
 
//noLoop();
frameRate(25);
 
shapeMode(CENTER);
}
 
// draw our shape
void draw() {
// set a background
background(255,255,255);
 
// during even-numbered seconds (0, 2, 4, 6...)
if (second() % 1 == 0) {
jitter = 2.5;
}
if(rotSwitch){
  angle = angle + jitter;
}
// start our animation loop
pushMatrix();
float c = cos(angle);
 
// reposition the object in the center of the screen
translate(width/2, height/2);
rotate(angle*TWO_PI/360);
shape(logo, 0, 0, 250, 250);
popMatrix();
 
 
stroke(0);
fill(0);
textFont(font,12);
text("aaaaah",0,0);
}
 
void mousePressed(){
  rotSwitch = !rotSwitch;
}


