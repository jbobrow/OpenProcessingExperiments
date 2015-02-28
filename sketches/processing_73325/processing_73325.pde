
float percent = 0;
float barWidth = 0;
PFont deca;
//int s = second();
//int initSec = 0;
//int dif = s;
//int s = millis();
float mils = 0;
float dif = 0;

void setup(){
  size(300,300);
  deca = loadFont("MalayalamMN-48.vlw");
  textFont(deca, 16);
}

void draw(){
  background(0);
  mils = millis()/1000.0 - dif;
  barWidth = 40*mils;

  if (barWidth > 200){
    barWidth = 200;
  }
  
  percent = barWidth/2;
  text("Loading " + int(percent) + "%",50,120);
  noFill();
  stroke(255);
  rect(50,125,200,20);
  
  fill(255);
  rect(50,125,barWidth,20);
}

void mousePressed(){
  if (barWidth > 199){
    barWidth = 0;
    dif = mils + dif;
  }
}

