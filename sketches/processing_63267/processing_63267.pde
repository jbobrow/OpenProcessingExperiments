
int B = 30;
int H = 30;
 
void setup() {
  size (500,500);
  smooth();
   
}
 
void draw() {
 
  background(random(0,255));
  frameRate(7);
  fill(55,30,10);
  ellipse(250,250, B, H);
   
}
 
void mousePressed() {
 
  B = B + 40;
  H = H + 5;
   
}


