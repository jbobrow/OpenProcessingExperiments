
float change = 1.1;

void setup() {
  size(400, 400);
  

} 
void draw() {
  background(150);
  strokeWeight(1);
  smooth();
  noFill();
  for (int i = 700; i>mouseY ;i -= 13) {
  ellipseMode(CORNER);
    triangle(width/2 +600,0
            ,width/2 -600,0
            ,width/2+mouseX-200,i*change);

  }
  
  

}
  




