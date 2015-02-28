
//Gordon Gleason
//homework #3

int h;
int border;


void setup(){
  size(900,600);
  smooth();
  colorMode(HSB,360,100,100,100);
  background(175,54,99);
  h=0;
  border=30;
  
}

void draw(){
  h++;
  border++;
   strokeWeight(5);
  noFill();
  stroke(6,99,border);
  if (border>70){
    border=30;
  }
  quad(20,20,20,580,880,580,880,20);
  strokeWeight(2);
  quad(10,10,10,590,890,590,890,10);
  stroke(h,99,34);
  fill(h,95,55);
  if (mousePressed){
    ellipse(mouseX,mouseY,abs(pmouseX-mouseX),abs(pmouseX-mouseX));
  }
  if (h>360){
    h=0;
  }
}
