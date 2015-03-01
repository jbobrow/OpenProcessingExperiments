
void setup() {
  size(800,800);
  colorMode(HSB);
  background(0,0,100);
}
void draw() {
 for(int i = 600;i>0; i=i-2) { 
  ellipse (300,300,i,i);
    fill(100,0,200);
  float vel= dist(mouseX,mouseY,pmouseX,pmouseY);
  line(mouseX,mouseY,pmouseX,pmouseY);
  }
    
}
