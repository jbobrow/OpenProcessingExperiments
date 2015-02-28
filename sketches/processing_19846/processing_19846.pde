
PFont font;
float angle=0;
float x;

void setup (){
  size(250,250);
  background(0,90);
  smooth();
  font = loadFont ("ErasITC-Light-48.vlw");
  textFont(font);
}

void draw(){
  x+=1.0;
  angle = angle + 0.3;
  frameRate(7.0);
  translate(125,125);
  rotate(angle);
  fill(131,250,255,25);
    textSize(30);
  text("L5B1R6",20,10);
   rotate(angle+4.0);
  text("L6B1R6",20,10);
  frameRate(9.0);
  fill(220, 20);
  rotate(angle+2.0);
  text("L5B1R6", 20,10);
 }



