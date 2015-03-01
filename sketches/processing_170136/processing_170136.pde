
void setup(){
  background(100);
  size(500,500);
  smooth();
}
void draw(){
  float s=dist(mouseX,mouseY,pmouseX,pmouseY)+3;
    stroke(255);
  colorMode(HSB);
  fill(random(0,mouseX),random(0,mouseY),255);
  ellipse(mouseX,mouseY,s,s);
}


