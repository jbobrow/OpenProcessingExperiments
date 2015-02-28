
/*
Konkuk University
SOS iDesign
 
Name: Gwang il Lee
ID: 201420094
 
*/
void setup() {
  size(1024, 768);
  smooth();
  background(#F5FFD3);
}
void draw() {
  for (int i = 20; i< width; i = i + 40) {
    for (int j = 20; j< width; j = j + 40) {
      strokeWeight(3);
      stroke(0, 0, 0);
      noFill();
     
      strokeWeight(2);
      stroke(255);
      fill(#9DCEF2);
      ellipse(i, j, 30, 30);
      noFill();
      fill(#736CDB);
      strokeWeight(4);
      ellipse(i,j,10,10);
      }
  }
}
