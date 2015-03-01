
/*
Konkuk University
SOS iDesign
  
Name: Hye ri Lee
ID: 201420101
  
*/
void setup() {
  size(1024, 768);
  smooth();
  background(#27FF9F);
}
void draw() {
  for (int i = 30; i< width; i = i + 80) {
    for (int j = 20; j< width; j = j + 80) {
   
      
      strokeWeight(3);
      stroke(#B779FF);
      fill(#FFF479);
      ellipse(i, j, 50, 50);
     
      }
  }
}
