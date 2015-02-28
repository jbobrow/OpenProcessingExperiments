
/**
 * Draw what the camera sees constructivist style.
 * 
 *Mike Wirth 2008
 */ 
import processing.video.*;
import processing.pdf.*;
int num = 2000;
int range = 4;
float space=5.5;

float[] ax = new float[num];
float[] ay = new float[num]; 

boolean saveOneFrame = false;
int beakDensity = 0;
int beak = 0;

int q = 0;
Capture cam;
 float count = 0;

void setup() {
  size(640,480);
  frameRate(120);
  smooth();
  // If no device is specified, will just use the default.
  cam = new Capture(this, 640,480);
//noStroke();
 
cam.start();
}


 color pix;
 
void draw() {
//noLoop();

  cam.read();
  //tint(0, 55);
   //  float pointillize = map(mouseX, 0, width, 2, 18);
  int x = int(random(cam.width));
  int y = int(random(cam.height));
 // tint(22, 0, 0); 
  color pix = cam.get(x, y);
// fill(pix, 126);
  // for(int i=0; i<width; i++) {
 //ellipse(x, y, random(14), random(15));

   
 //  }
count += .01;
if(count >= 25){

  count = 0;
}

fill(pix+3, random(88,120));
drawCurve(x,y,pix);




} 


void drawCurve(int xer, int yer, int pix){
  float sizer = random(.9,37.1);

for(int i = 0; i < 1; i ++) {
  noStroke();
  ellipse(random(-145,45)+xer, random(-45,145)+yer, sizer+1.2, sizer+1.2);
}

for(int l = 0; l < 1; l ++) {
 noFill();
  stroke(pix,245);
 strokeWeight(random(.0001 ,1.3));
 bezier(random(-9,9)+xer, random(-8,8)+yer, random(-3,3)+xer, random(-4,2)+yer, random(-4,3)+xer, random(-3,4)+yer, random(-9,9)+xer, random(-9,9)+yer);
}


for(int k=0; k<1;k++){
  strokeCap(SQUARE);
  stroke(pix,199);
  strokeWeight(random(sizer+11));
line(random(-13,15)+xer, random(-14,15)+yer, random(-16,15)+xer, random(-21,15)+yer);

}

}

int doubleClick = 0;

void mousePressed() {
  if(doubleClick == 0){
  beginRecord(PDF, "Lines"+count+".pdf"); 
 // background(255);
 doubleClick = 1;
}else if(doubleClick == 1){
  endRecord();
  doubleClick = 0;
background(255);
}
}





