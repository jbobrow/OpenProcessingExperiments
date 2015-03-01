
float i=255;
void setup(){
  size(700,700);
  smooth();
}
void draw(){
  float s=dist(mouseX,mouseY,pmouseX,pmouseY)+1;
  stroke(50);
  fill(i, random(255));
  ellipse(mouseX,mouseY,s,s);
}

