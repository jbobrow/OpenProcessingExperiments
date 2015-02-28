
float y;
float xw;
float s;

void setup (){
  size(1100,200);
  smooth();
  rectMode(CENTER);
  background(0);
  noLoop();
}


void draw(){
  for (int x=50; x<=1000; x+=100){
    stool(x,y,xw,s);
    y=random(80,250);
    xw=random(10,100);
    s=.25;
  }
}


void stool (float x,float y, float xw, float s){
  pushMatrix();
  translate(x,100);
  scale(s);
  stroke(255);
  strokeWeight(1.5);
  fill(0);
  rect(x+35,y-65,60+(xw-5),10);
  rect(x+35,y-105,40+(xw-15),8);
  //left leg
  beginShape();
  vertex(x+38,y-140);
  vertex(x+27,y-140);
  vertex(x+2-xw,y);
  vertex(x-7-xw,y);
  vertex(x+18,y-140);
  endShape();
  //right leg
  beginShape();
  vertex(x+43,y-140);
  vertex(x+52,y-140);
  vertex(x+77+xw,y);
  vertex(x+68+xw,y);
  vertex(x+43,y-140);
  endShape();
  rect(x+35,y-140,50+(xw/2),8);
  popMatrix();
}

void mousePressed (){
  background(0);
  redraw();
}


