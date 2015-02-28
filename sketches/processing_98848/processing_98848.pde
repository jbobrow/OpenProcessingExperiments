
void setup() {
  smooth();
  noFill();
  size(600, 600);
  background(255);
  stroke(0, 0, 0, 10);
}

int w=10, h=10;
int r=0;
void draw() {
  
  if (w>900) {

    w=10;
    h=10;
    r=0;
    
    stroke(random(255), random(255), random(255), 10);
  }
  translate(width/2, height/2);
  rotate(radians(r+=2));
  
  ellipse(0, 0, w+=2, h+=3);

}
