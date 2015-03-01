
void setup()
{
  size(600,600);
  background(255);
}

void draw()
{
if (mouseX +mouseY<600) {
  fill(0);
  triangle(0,600,600,600,600,0);
  fill(255);
    triangle(0,0,0,600,600,0);
  
}
  else{
    fill(0);
    triangle(0,0,0,600,600,0);
    fill(255);
    triangle(0,600,600,600,600,0);
 }

}
