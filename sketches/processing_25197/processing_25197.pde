
float h, m, s;
float a, b, c;

float cc = random(255);

PFont fontD;
PImage pics1;
PImage pics2;

void setup() {
  size(400, 400);
  fontD = loadFont("KabelLTStd-Book-48.vlw");
  textAlign(CENTER);
  background(0);
  smooth();
  noStroke();
  colorMode(RGB);
  pics1 = loadImage("mountain2.png");
  pics2 = loadImage("mountain.png");
}

void draw() {
  h = hour();
  m = minute();
  s = second();
  
  image(pics1, 0, 0, width, height);
 //hour 
  a = (h/23)*(width-120) + 60;
  //a = 0; 
  noStroke();
  fill(255, 70);
  ellipseMode(CENTER);
  ellipse(a, 120, 120, 120);
  
  if(a <= 0) {
    fill(255);
    text("Sleep Now!!", width/2, height/4);
  }
  
  image(pics2, 0, 0, width, height);
//minute
  b = (m/59)*400;
  //stroke(255, b, 123, 100);
  fill(255, 0, 0, 60);
  rectMode(CORNER);
  rect(0, 0, width, b);
 
  textFont(fontD, 18);
  fill(255);
  text("Time is running", width/2, 355);
//second
  a = s * 6;
  translate(width/2, height/2 + 80);
  fill(255, 80);
  rotate(radians(a));
  triangle(-30, 20, 0, -30, 30, 20);

}
  

