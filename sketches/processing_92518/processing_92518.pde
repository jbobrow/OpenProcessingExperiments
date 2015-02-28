
// Loris Uzan
// 3/12/2013

int num_of_sparkles=1000;
float[] sparklesX= new float[num_of_sparkles];
float[] sparklesY = new float[num_of_sparkles];
int a=20;
PImage wand;
float gravity=.05;
float sparklecolorgreen=random(210, 255);
int currentclick=0;


void setup () {
  size(900, 450);
  noStroke();
  wand=loadImage("wand.png");
  frameRate(1000);
}

void draw () {
  background(0);
  fill(255, sparklecolorgreen, 0);
  image(wand,mouseX-50,mouseY-62);
  for (int i=0 ; i<num_of_sparkles ; i++) {
    ellipse(sparklesX[i], sparklesY[i], random(1, 5), random(1, 5));
    sparklesY[i]+=gravity;
  }
}

void mouseDragged() {
  sparklesX[currentclick]=mouseX-50;
  sparklesY[currentclick]=mouseY-62;
  currentclick+=1;
  if (currentclick==num_of_sparkles) {
    currentclick=0;
  }
}


void mousePressed() {
  sparklesX[currentclick]=mouseX-50;
  sparklesY[currentclick]=mouseY-62;
  currentclick+=1;
  if (currentclick==num_of_sparkles) {
    currentclick=0;
  }
}




