
int numFrames = 5;
int frame = 0;
int numSegments = 27;
float[] x = new float[numSegments];
float[] y = new float[numSegments];
float[] angle = new float[numSegments];
float segLength = 10;
float targetX, targetY;
float flyX = 50;
float flyY = 50;
float inc=0.0;
int flyXDirection = 1;
int flyYDirection = -1;
PImage plantpot;
PImage plantpotfront;
PImage[] images = new PImage[numFrames];
PImage[] images2 = new PImage[numFrames];

void setup() {
  size(900, 800);
  smooth(); 
  plantpot = loadImage("plantpot.png");
  plantpotfront = loadImage("plantpotfront.png");
  images[0] = loadImage("fly_anim0000.gif");
  images2[0] = loadImage("audrey_anim0000.gif");
  images[1] = loadImage("fly_anim0001.gif");
  images2[1] = loadImage("audrey_anim0001.gif");
  images[2] = loadImage("fly_anim0002.gif");
  images2[2] = loadImage("audrey_anim0002.gif");
  images[3] = loadImage("fly_anim0003.gif");
  images2[3] = loadImage("audrey_anim0003.gif");
  images[4] = loadImage("fly_anim0002.gif");
  images2[4] = loadImage("audrey_anim0004.gif");
  x[x.length-1] = width/2;
  y[x.length-1] = height-308;

}
void draw() {
  background(160,233,255);
  frameRate(15);
  noStroke();
  smooth();
  fill(255);
  rect(0,595,width,300);
  for (float y=15; y<400; y*=1.3){
    strokeWeight(y/7);
    stroke(y/2);
    line(0,y+580,width,y+580);
  }
  image(plantpot,50,-100);
  noFill();
  inc +=0.015;
  float angle2=sin(inc)/10.0+sin(inc*1.2)/20.0;
  stroke(100,173,12,160);
  tail(189,19,-angle2/1.2);
  tail(271,32,-angle2/1.7);
  stroke(55,143,0,180);
  tail(209,29,-angle2/1.2);
  tail(315,16,-angle2*1.2);
  stroke(75,183,40,180);
  tail(234,33,angle2/2.5);
  tail(325,15,angle2*1.3);
  stroke(23,111,24,140);
  tail(295,30,angle2/2.7);
  tail(244,23,-angle2/2);
  tail(182,14,angle2*1.2);
  
  image(plantpotfront,50,-100);
  strokeWeight(20.0);
  stroke(82,155,11,185);
  for(int i=x.length-1; i>=1; i--) {
    positionSegment(i, i-1);
  }
  for(int i=0; i<x.length; i++) {
    segment(x[i], y[i], angle[i], (i+1)*1.45);
  }
  flyX = mouseX + 0.8 * flyXDirection;
  flyY = mouseY + 0.8 * flyYDirection;
  if(flyX > width-25 || flyX < 25) {
    flyXDirection *= -.8; 
  }
  if(flyY > height-25 || flyY < 25) {
    flyYDirection *= -.8; 
  }
  frame = (frame+1) % numFrames;
  image(images[frame],flyX,flyY,93,93);
  
  reachSegment(0, flyX, flyY);
  for(int i=1; i<numSegments; i++) {
    reachSegment(i, targetX, targetY);
  }
  audrey(x[0], y[0]);
  imageMode(CORNER);
}
void audrey(float headx, float heady){
  imageMode(CENTER);
  image(images2[frame],headx,heady,230,230);
}
void positionSegment(int a, int b) {
  x[b] = x[a] + cos(angle[a]) * segLength;
  y[b] = y[a] + sin(angle[a]) * segLength;
}
void reachSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  angle[i] = atan2(dy, dx);  
  targetX = xin - cos(angle[i]) * segLength;
  targetY = yin - sin(angle[i]) * segLength;
}
void segment(float x, float y, float a, float sw) {
  strokeWeight(sw*.75);
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

void tail(int x, int units, float angle2) {
  pushMatrix();
  translate(x+200,508);
  for(int i=units; i>0; i--){
    strokeWeight(i*.75);
    line(0,0,0,-8);
    translate(0,-8);
    rotate(angle2);
  }
  popMatrix();
}

