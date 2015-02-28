
int i=1;
void setup(){
  size(292, 350);
  background(0);
  frameRate(30);
}
void draw(){
  smooth();
  strokeWeight(5);
  stroke(20,20,255,20);
  fill(random(255),random(255),random(255),70);
  float t=mouseY/2;
  ellipse (mouseX, mouseY,t,t);
}
void keyPressed(){
  save("image"+i+".png");
  i++;
}



