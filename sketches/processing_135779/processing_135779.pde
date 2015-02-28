
void setup(){
  size(800,400);
  smooth();
  background(0);
}
void draw(){
  if (mousePressed==true){
    float r=random(400);
  fill(mouseY,mouseX,r,100);
  triangle(mouseX,mouseY,pmouseX,pmouseY,mouseX/2,mouseY/2);
  }
}

