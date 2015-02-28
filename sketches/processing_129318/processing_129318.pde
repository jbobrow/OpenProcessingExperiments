
void setup() {
  size(500, 500);
  rectMode(CENTER);
  background(#FFFFFF);
  
}


void draw() {
  fill(#FF0000, random(100));
  rect(random(width), random(height), 100, 100);

}


