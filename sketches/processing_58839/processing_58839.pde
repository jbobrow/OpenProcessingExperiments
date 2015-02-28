
 // move from down to up 
void setup() {
  size(500, 500); 
  rectMode(CENTER);
  smooth();
  noFill();
  
}
 
void draw() {
  background(#59ED05);
  
  translate(width/2, height/2);
   

  for (int i=0; i < 100; i++) {
    
    float angle = map(mouseX, 0, -width, 0, -PI);
    rotate(angle);
    float s = map(mouseY, 0, -height, -1.1, -1.5);
    scale(s);
 
    triangle(0, 0, 400, 500, 400, 500);
  } 
}

