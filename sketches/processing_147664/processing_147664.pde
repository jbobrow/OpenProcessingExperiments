

/* Konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name: Shim Sang Joon
 ID: 201420086
 */

void setup() {   
  size(1024, 768);   
  smooth(); 
  noLoop();
}   
void draw() {     
  background(#0B0F29);  
  for (int i = -10; i < width; i = i +50 ) {   
    for (int j = -10; j < height; j = j +50 ) {  
      strokeWeight(2);
      stroke(255);
      noFill();
      ellipse(i+8, j, 50, 50);
      strokeWeight(1);
      ellipse(i+8, j, 25, 25);
      ellipse(i+8, j, 10, 10);
      fill(0);
      ellipse(i+33, j+25, 20, 20);
      noFill();
      stroke(#1C5267);
      strokeWeight(2);
      rect(i+8, j, 50, 50);
    }
  }
} 
