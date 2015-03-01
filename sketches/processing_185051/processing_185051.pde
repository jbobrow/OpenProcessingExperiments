

void setup(){
  size(400,400);
background(255);
}
void draw(){
  if (mousePressed){
        float x=random(255);
    float y=random(255);
    float z=random(255);
  fill(x,y,z,10);
  stroke(x,y,z,70);
}
else
{
  stroke(0,0,0,255);
  fill(255);
}
  if (mouseX>200){
  triangle(mouseX*2,mouseY*2,mouseX/2,mouseY/2,mouseX+40,mouseY-40);
}
else
  {
  ellipse(mouseX,mouseY,mouseX/3,mouseY/3);
}
}
