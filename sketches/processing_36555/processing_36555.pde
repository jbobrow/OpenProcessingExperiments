
void setup() {
  size(600,300);
  background(104,206,200);
}

void draw() {
  stroke(255);
  line(mouseX,mouseY,80,80);
 
  //draw a red rectangle 
  stroke(0,0,255);
  fill(255,0,0);
  rect(100,0,100,100);

  fill(0,255,0,255);
  ellipse(100,30,30,50);

  triangle(30,50,45,6,7,29);
}
                
                                
