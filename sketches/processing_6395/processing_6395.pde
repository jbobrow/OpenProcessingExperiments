
float mcx,mcy;
float r = 200;
float b;
boolean Red;
boolean Blue;
PFont fontA;
void setup() {
  size(1000,1000);
  background(0);
  frameRate(300);
  mcx = 20;
  mcy = 20;
 fontA = loadFont("BaskOldFace-48.vlw");
 textFont(fontA, 32);
}
void draw() {
  fill(0,0,150);
  rect(0,0,20,20);
  fill(100,0,0);
  rect(21,0,20,20);
  fill(14,90,100);
  text("Reset", 0, 60);
}

void mouseDragged(){
  noStroke();
  smooth();
  fill(r,0,b);
  mcx= mcy -1;
  mcy = mcy -1;
  ellipse (mouseX,mouseY,mcx,mcy);
  
  if (mcx < -10) {
    mcx = 20;
  }
  
    if (mcy < -10) {
    mcy = 20;
  }

}

void mouseReleased() {
  mcx =20;
  mcy =20;
}

void mousePressed() {
    
  //colors
   if (Red) {
    r = 200 ;
    b = 0;
  }
   if (Blue) {
    r = 0 ;
    b = 200;
  }
  
  if ((mouseX <20) && (mouseY <20)) {
   Blue = true; 
   Red = false;
  }
  
    if ((mouseX >21) && (mouseY <20) && (mouseX <41))
    {
   Red = true; 
   Blue = false;
  } 
  if ((mouseX <70) && (mouseY <65) && (mouseY >35))
  {

   background(0); 
  }
}


