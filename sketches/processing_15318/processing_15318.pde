
void setup() {
   
size(200,200);
background(255);
  noLoop();
}
void draw() {
noStroke();
colorMode(HSB, 200);
for (int i = 0; i < 200; i++) {
  for (int j = 0; j < 200; j++) {
    stroke(i, j, 200);
    point(i, j);
  }
}
}
             
