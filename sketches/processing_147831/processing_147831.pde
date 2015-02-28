

void setup(){ 

size(1024,768); 
smooth();
noLoop(); //shine color
} 

void draw() { 
  fill(0);
  background(0);
  rect(0, 0, width, height);    
  for (int s = -10; s < width; s = s +30) {   
    for (int j = -10; j < height; j = j +30) {
      stroke(#F7528A);
      noFill();   
      ellipse(s,j,100,100); 
      ellipse(s-2,j-2,30,30); 
    } 
  }
} 

void keyPressed() {
  background(0);
  redraw();
}
