


void setup() {
  size( 200,200);
  smooth();
  
}

void draw() {
  background(0);
  
  if( mousePressed  ) {
    fill(255,32,54);
    ellipse( mouseX, mouseY, 30,30);
  } else {
    rectMode(CENTER);
    fill(100,32,255);
    rect(mouseX,mouseY,30,30);
  }
  
}
  
  

