
float r;
float g;
float b;
float a;

float diam;
float x;
float y;


float rMax = 0;
float gMax = 255;
float bMax = 255;

int bkg;

 
//--------------------------
void setup(){
  size(200,200);
  background(0);
  smooth();
}

 
//--------------------------
void draw(){
  
  r = random(rMax);
  g = random(gMax);
  b = random(bMax);
  a = random(255);
  
  diam = random(20);
  x = random(width);
  y = random(height);
  
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
 
}

 
//--------------------------
void keyPressed() {
  if (bkg == 0) {
    bkg = 255;
  } else {
    bkg = 0;
  }
}

 
//--------------------------
void mousePressed(){
  if(rMax == 0){
    rMax = 255;
    gMax = 0;
    background (bkg);
  }else if(gMax == 0){
    gMax = 255;
    bMax = 0;
   background (bkg);
  }else{
    bMax = 255;
    rMax = 0;
    background (bkg);
  }
    println();
    println();
    println("red is random " + (int)rMax + ", green is random " + (int)gMax + ", blue is random " + (int)bMax);
}
