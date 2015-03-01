
float i=255;
void setup(){
  size(500,500);
  smooth();
}
void draw(){
  float s=dist(mouseX,mouseY,pmouseX,pmouseY)+1;
  stroke(50);
  fill(i,102);
  ellipse(mouseX,mouseY,s,s);
}


