
float xoffset = 60;
float yoffset = 60;
 
void setup() {
  size(600, 400);
  smooth();
}
 
void draw() {
  background(164, 206, 250);
 
  int r = 0;
  while (r < 301){
    noFill();
    strokeWeight(30);
    ellipse(width/2, height/2, 30+xoffset*r, 30+yoffset*r);
    r = r + 1; // or r++
}
}
