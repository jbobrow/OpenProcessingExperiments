
float x=0;
float y=0;
int theta =1;
int height1=50;
int height2=60;
int height3=40;
PFont font;
float xPos;
float yPos;

void setup() {
  colorMode(HSB, 255);
  rectMode(CENTER);
  size(500, 500);
  font = loadFont("fonttype.vlw");
}

void draw() {
  background(255);


  //text time 
  textAlign(CENTER);
  fill(122);
  textSize(18);
  text(hour()+":"+ minute()+":"+second(), width/2, 400);

  //second
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(map(second(), 0, 60, 0, 360)));
  fill(random(0, 255), 255, 255);
  strokeWeight(3);
  line(0, 0, 0, height2);
  popMatrix();

  //hour
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(map(hour(), 0, 12, 0, 360)));
  line(0, 0, 0, -height3);
  popMatrix();

  //minute
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(map(minute(), 0, 60, 0, 360)));
  line(0, 0, 0, height1);
  popMatrix();
  
  //background circle

  fill(random(0,255), 255, 255, 12);
  float s = map(second(), 0, 59, 0, 200);
  ellipse(width/2, height/2, x, x);
  fill(random(0,255),255 , 255, 22);
  float m = map(minute(), 0, 59, 0, 200);
  ellipse(width/2, height/2, m, m);
  fill(random(0,255), 255, 255, 52);
  float h = map(hour(), 0, 23, 0, 200);
  ellipse(width/2, height/2, h, h);
  ellipse(width/2, height/2,200,200);

}
