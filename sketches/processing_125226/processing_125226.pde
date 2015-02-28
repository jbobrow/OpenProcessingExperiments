
float b= 1;
float c= 2;
float d= 4;

void setup() {
  size(800,800);
  loop();
  
}

void draw() {
  fill(mouseX,0, mouseY);
  stroke(mouseX, 0, mouseY);
  strokeWeight(3);
  line(b,b, mouseX,mouseY);
  
  b = b+1;
  c = c+2;
  d = d+2;
}
