
void setup(){
  size(480,120);
  smooth();
}

void draw(){
if (mousePressed)
{
  fill(42,144,183);
} else {
  fill(255);
}
ellipse (mouseX,mouseY,80,80);
}

