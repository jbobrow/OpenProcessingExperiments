
void setup() {
  size(800, 800);
 noCursor();
 smooth();
 background(#E3831B);
}
void draw (){
  float b=random(105, 155);
  float a=random(1, 200);
if(mousePressed==true)
{
  strokeWeight(3);
  stroke(255, a, b);
  triangle(mouseY+4, mouseX, mouseX-3, mouseY-3, mouseX+3, mouseY-3);
  
}
else
{
  strokeWeight(8);
  stroke(#2A2EB7);
  line(mouseX, mouseY, pmouseX, pmouseY);
}
}


