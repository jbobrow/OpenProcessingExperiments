

 void setup() {
  size(800, 800);
  colorMode(HSB);
background(1);
}
void draw() {
  float aleatorio=random(100,150);
  float x = random(0,width);
  float y = random(0,height);

  float vt = dist(mouseX,mouseY,pmouseX,pmouseY); 
  strokeWeight(vt/5);
  //stroke(0,100);
  line(mouseX,mouseY,mouseX,mouseY); 
  noStroke(); 
  fill(aleatorio,255,255);
ellipse(mouseX,mouseY,vt,vt);
}
