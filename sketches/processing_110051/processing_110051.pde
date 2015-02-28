
void setup() {
  size(500, 500);
  background(200, 150, 300);
  fill(201, 34, 56 ); 
  rect(40, 50, 60, 60, 0, 0, 30, 30);
  rect(360, 50, 60, 60, 0, 0, 30, 30);
  stroke(201, 34, 256);
}

void draw() {
    fill(201, 34, 56);
   rect(200, 200, 50, 50, 7);
   frameRate(10);
  for(int i=0; i<300; i++) {
    point(mouseX +random(20), mouseY + random(20)); }

}
