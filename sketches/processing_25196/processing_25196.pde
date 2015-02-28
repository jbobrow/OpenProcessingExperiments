
PImage glass;

float a, b, c;
float s, m, h;

int ss, mm, hh;

PFont ffont; 



void setup() {
  
  glass = loadImage("6_glass_1.png");
  
  ffont = loadFont("HelveticaNeue-Light-48.vlw");
  textFont(ffont, 48);
  
  size(500,500);
  background(255);
  smooth();
  
}

void draw() {
  s = second();
  m = minute();
  h = hour(); 
  
  ss = second();
  mm = minute();
  hh = hour(); 
  
  if (h > 12 || hh > 12) {
    h = h - 12;
    hh = hh - 12;
  }
  
  fill(255,0,0);
  noStroke();
  rect(0,0,180,height);
  
  a = (h/23)*160;
  fill(255);
  noStroke();
  rect(0,52,180, 160-a);
  
  
  
  fill(0,255,0);
  noStroke();
  rect(180,0,170,height);
  
  b = (m/59)*160;
  fill(255);
  noStroke();
  rect(180,268,170, 160-b);
  
  fill(0,0,255);
  noStroke();
  rect(345,0,170,height);
  
  c = (s/59)*160;
  fill(255);
  noStroke();
  rect(345,268,170, 160-c);
  
  image(glass, 0, 0);
  
  if(mousePressed){
  
  fill(0);
  textFont(ffont, 24);
  textAlign(CENTER);
  text(hh,90,125);
  text(mm,250,340);
  text(ss,410,340);
  
  //textFont(ffont, 55);
  text("h",90,340);
  text("m",250,125);
  text("s",410,125);
  }
  
}
  

