
/* Shim Sang Joon 
 201420086 
 */

void setup() {  
  size(600, 600);  
  background(255);
  noLoop();
}  

void draw() {
  fill(#47FAB9); 
  noStroke();  
  background(#34D699);
  rect(0, 0, width, height);   

  // grid filled with ellipses  
  for (int i = -10; i < width; i = i +50 ) {  
    for (int j = -10; j < height; j = j +50 ) {  
      stroke(#FF5AFD);  
      noFill();  
      ellipse(i, j, 100, 100 );
      ellipse(i-50, j-50, 25, 25);
    }
  }
} 
