
void setup() {
  size(300, 300);
  background(100);
}

void draw() {
  background(random(25));
  
  stroke(255);
  line(mouseX,mouseY,10, 101);

  //draw a black rectangle
  stroke(0, 0, 255);
  fill(0, 0, 0);
  rect(100, 50, 100, 100);

  fill(0, 255, 0, 244);
  ellipse(100, 50, 200, 200);

  triangle(100,50, 20, 30, 10, 50);
}

                
                
