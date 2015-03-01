
float i=0;

void setup() {
  size(500,500);
  colorMode(HSB);
  background(145,155,250);
}
void draw() {

  if(mousePressed){
  i=i*0.005;
  rotate(i);
  line(mouseX,mouseY,75,75);
  }
}

