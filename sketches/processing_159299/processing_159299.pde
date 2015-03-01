
 void setup() {size(600,600);
 }
 void draw() {
   background(255);
for (float a=0;a<mouseX;a=a+2){
  fill(a,0,0);
  ellipse(a*6,200,10,10); }
  for (int a=width;a>mouseX;a=a-5){
  ellipse(a*2,400,a,a); }
  for (float b= 0;b<1000; b=b+1){
    strokeWeight(random(5));
    point(random(width), random(height));
 }
 }
