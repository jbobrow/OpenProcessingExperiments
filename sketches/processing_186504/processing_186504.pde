
void setup() {
  size(600,600);
  colorMode(HSB);
  background(0,0,100);
}
void draw() {

  ellipse (300,300,300,300);
    fill(100,0,200);
  float vel= dist(mouseX,mouseY,pmouseX,pmouseY);
  line(mouseX,mouseY,pmouseX,pmouseY);
 
   
}

