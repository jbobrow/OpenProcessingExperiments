
void setup() {
  size(500,500);
  noStroke();
}
 
void draw() {
  background(0);
  float h = map(hour(),0,23,30,(height));
  float m = map(minute(),0,60,30,(height));
  float s = map(second(),0,60,30,(height));
 
   //hour rect
  fill(#ff0090);
  rect(h,0,30,250);
  
  //minute rect
  fill(#00ffc0);
  rect(m,250,20,150);
  
  //second rect
  fill(#ffea00);
  rect(s, 400,10,100);
   
}
