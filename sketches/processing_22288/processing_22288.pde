
float angle = 0.0;

void setup () {
  size (500,700);
  smooth();
  background(20,50,50);
  
}

void draw () {
  rotate (angle);
  translate(mouseX,mouseY);
  rect(-15,-15,30,30);
  fill(0,155,20);
  angle += 0.1;
  
}
                
                
