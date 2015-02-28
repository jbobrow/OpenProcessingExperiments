
void setup() {
  size(500, 500); 
  noStroke();
  ellipseMode(CENTER);
}
float r;
float b;

void draw() {
 
    if (mousePressed) {
   
     r=random(0,255); 
     b=random(0,255);
    
  }

  for (int i=0; i<500; i++) {
    fill(r, mouseY, i+1);
    rect(b, i, width, b);
  }
 
 
  drawTheCuteBall();
    
}



void drawTheCuteBall() {
  fill(0,mouseX,200,mouseY/4);
  ellipse(mouseX,mouseY,300,300);
}
