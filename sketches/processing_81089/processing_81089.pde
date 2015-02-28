
void setup() {
  size(500, 500);
  smooth();
  noStroke();
}
void draw() {
  float x=mouseX;
  float y=mouseY;
  float ix=500-x;
  float iy=500-y;
  if (mousePressed) {
   ellipse(x,y,20,20);
   ellipse(ix,iy,20,20);
 }
  if(keyPressed){
    fill(random(255),random(255),random(255));
  }
  }



