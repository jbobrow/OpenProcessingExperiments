
void setup() {
  size(800,800);
  background(255);
}

void draw() {
  translate(mouseX, mouseY);
  rotate(millis()/100.0);
  float cor1 = abs ( 200*sin(millis()/100) );
  float cor2 = abs( 200*sin(millis()/150) );
  float cor3 = abs( 200*sin(millis()/300) );
  
  stroke( cor1, cor2, cor3, 30);
  noFill();
  ellipse(mouseY/10.0,mouseX/10.0, 100, 100);
  line(mouseY/10.0,mouseX/10.0,150,100);
}




