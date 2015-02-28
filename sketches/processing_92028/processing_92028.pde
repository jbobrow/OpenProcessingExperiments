
float r = 8;
void setup() {
  size(200,200);
}
void draw() {
background(255);
noStroke();
fill(236, 121, 245);
rectMode(CENTER);
rect(width/2,height/2,r,r);
    r++ ;
if (r > width) {
    r = 0;
  }
}
