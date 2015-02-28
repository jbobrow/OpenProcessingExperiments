
void setup() {
  size(500,500);
  background(0);
}

void draw() {
  
    
  //draw a white line
  stroke(255);
  line(mouseX,mouseY,10,300);
  
  //draw a black rectangle
  stroke(0,0,255);
  fill(255,0,0);
  rect(mouseX,mouseY,100,100);

  stroke(255,0,0);
  fill(116,92,191,100);
  ellipse(100,30,100,50);

  triangle(50,50,50,100,100,100);
}
                
                
