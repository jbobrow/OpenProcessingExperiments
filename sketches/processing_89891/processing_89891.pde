
void setup(){
  size(300,300);
  smooth();
  noFill();
  font=loadFont("Bauhaus93-48.vlw");
  textFont(font);
  strokeCap(SQUARE);
}

PFont font;


void draw(){
  background(250,150);
  int sss = second();
  int mm = minute();
  int hh = hour();
  fill(88,82,17,127);
  // The nf() function spaces the numbers nicely
  String t = nf(hh,2) + ":" + nf(mm,2) + ":" + nf(sss,2);
  text(t, 50, 39);
  
//  float angle=0;
  noFill();
  float s = map(second(),0,60,0,TWO_PI)-HALF_PI;
  float m = map(minute(),0,60,0,TWO_PI)-HALF_PI;
  float h = map(hour(),0,24,0,TWO_PI)-HALF_PI;
  float ss=0-HALF_PI;
  strokeWeight(10);
  stroke(180,0,0,150);
  arc(150,150,200,200,ss,s);
  strokeWeight(15);
  stroke(0,180,0,150);
  arc(150,150,170,170,ss,m);
  strokeWeight(20);
  stroke(0,0,180,150);
  arc(150,150,120,120,ss,h);
  
}
