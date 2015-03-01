
float i=0;
 
void setup() {
  size(500,500);
  colorMode(HSB);
  background(145,155,250);
}
void draw() {
  
 i=i+0.05;

  if(mousePressed){
  i=i*0.005;
  rotate(i);
  stroke(random(255),random(255),random(255));
  line(mouseX,mouseY,random(500),random(500));
  line(mouseY,mouseX,random(500),random(500));
  }
}
