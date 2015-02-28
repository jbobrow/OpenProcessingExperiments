
//import processing.video.*;

//MovieMaker mm;

PImage p;
PImage b;
PImage c;
float range,angle = 0.0;
int num=100;

int[] x = new int [num];
int[] y = new int [num];

void setup(){
  size(800,800);
  p = loadImage("logo.png");
  b = loadImage("cloud.jpg");
  c = loadImage("cloud1.png");
  smooth();
  imageMode(CENTER);
  noStroke();
//  mm = new MovieMaker (this,width,height,"mouse.mov",15,MovieMaker.ANIMATION,MovieMaker.HIGH);
//  frameRate(15);
}

void draw(){
  
  background(b);
  
  float d = dist(width/2,height/2,mouseX,mouseY);
  float sw = constrain(d,0,30);
  float ssw = constrain(d,0,255);
  
    for (int i= num-1; i > 0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }

  x[0] = mouseX;
  y[0] = mouseY;
  fill(255,25);
  for (int i = 0; i < num; i++) {
    tint(255,0+ssw);
//    image(c, x[i],y[i],i*2.0,i*2.0);
    ellipse(x[i], y[i], i*5.0, i*2.0);
  }
  
  pushMatrix();
  translate(width/2,height/2);
  tint(255,255-ssw);
  image(p,0,0);
  popMatrix();
  
//  mm.addFrame();
}

//void mousePressed() {
//  if ( mouseButton == LEFT) {
//    mm.finish();
//  }
//}

