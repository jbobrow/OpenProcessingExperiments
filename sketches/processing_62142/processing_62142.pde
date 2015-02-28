
/*
Square Modulo, Dan Olson 2012
Updated 2013 :
  --Added night and day cycles 
  --Modular width and height
  --Right mouse click pauses program and output to pdf...
           ... (if enabled, uncomment lines and run on host)
  --Left mouse click restarts program
  --Press s for PNG (screenshot to web browser or host folder)
*/
//import processing.pdf.*;
float col;
void setup() {

size(400,400);
//beginRecord(PDF, "filename.pdf");
}

void draw() {
  
int h = hour();

if (h >= 7 || h <= 20) {
  blueWhiteColors();
}

if (h >= 20 || h <= 7) {
  randomPrismColor();
}

frameRate(10);

float r = ceil(random(1,width));

for(float x=0; x<width; x+=r) {
for(float y=0; y<height; y+=r) {
rect(x,y,width%r,height%r);
  }
}

}

void blueWhiteColors() {
  float r=ceil(random(1,400));
  fill(r,255,255,200);
  stroke(45,76,255);
}

void randomPrismColor() {
fill(0,200);
colorMode(HSB,100);
stroke(random(col),100,100);
col = col+1;
if (col > 100) {
col = 0;
  }
}

void mousePressed(){ 
  if(mouseButton == RIGHT) {
  noLoop(); //Halts the program
  //endRecord();
}  else { 
  setup();
  loop();
  }  
}

void keyPressed() {
  if( key == 's' || key == 'S') {
    save("filename.png");
  }
}


