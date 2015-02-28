
void setup()
{
  size(400,400);
  smooth();
  background(54,54,54);
}
void draw(){
  if(mousePressed==true){
  translate(400,400);
  float k=random(4);
  rotate(PI/k);
  fill(pmouseY/1.5,pmouseX/2,240,150);
  rect(pmouseX/2,pmouseY/3,mouseX,mouseY);
  }
}
