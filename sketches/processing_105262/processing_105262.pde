
void setup() {
  
  size(400, 400);
  noStroke();
  smooth();   
  background(255);
}
float r;
float g;
float b;

void draw() {

  // creates 10 circles spaced apart by 40 pixels that have diameters of 20 pixels
  for (int i = 0; i < 10; i++) {
    fill(r,g,b);
    ellipse(mouseX, mouseY, 2*i, 2*i);
  }
    if (mousePressed) {
      r=random(0,255); 
      g=random(0,255); 
      b=random(0,255);
    
  }

}
