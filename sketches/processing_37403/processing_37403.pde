
void setup() {
  size
    (300, 300);
    colorMode(HSB,width,height,88);
}

void draw() {
  background(0,50,50);
  
  for (int x=20; x<280; x+=20) {
    fill(0,0,99);
    rectMode(CENTER);
    rect(mouseX,mouseY,10,150);
    fill(mouseX,x,width);
    ellipse(mouseX,mouseY-75,100,100);
    
  }
}


