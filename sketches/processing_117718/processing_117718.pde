
void setup() {
  background(0);
  size(400,400);
  frameRate(500000);
  
}

int xStart=0; 
float yStart=0;
int aStart=185; 
float bStart=150;
float angStart=.1;
int n=0;
void draw() {
  int rad=50;
  int numPts=20 ;
  int jiggle=1;
  strokeWeight(0.1);
  stroke(0,0,255,10);
  
  
  
  noFill();
  cubes(numPts, jiggle, xStart, 0);
  xStart+=5;
  angStart+=9;
  
  if (xStart>=400) {
    yStart+=5;
    bStart+=5;
    xStart=0;
  }
  if (bStart>=400){
    bStart=150;
    aStart=185;
    fill(200,255*(sin(angStart)),200);
  } 
  

}


void cubes(int num, int jiggle, int xLoc, int yStart) {
 
   for (int yLoc=0; yLoc<=400; yLoc+=5) {
     if (xStart>=185 && xStart <=225  ){
       if (yStart<=150){
        stroke(0,240*(sin(angStart)),255,10);
        fill(0,random(1*(abs(width/random(0,5)-xStart))),240*(sin(angStart)),25);
        rect(xLoc+random(-jiggle,jiggle),yLoc-250+random(-jiggle,jiggle),3*sin(angStart),3*sin(angStart));
       } else {
         noFill();
       }
     }  else if (xStart<=185 || xStart >=225  ){
      stroke(0,240*(sin(angStart)),255,10);
      fill(0,random(1*(abs(width/random(0,5)-xStart))),240*(sin(angStart)),25);
      rect(xLoc+random(-jiggle,jiggle),yLoc+random(-jiggle,jiggle),3*sin(angStart),3*sin(angStart));
     } 
     
 } 
  
  
}


