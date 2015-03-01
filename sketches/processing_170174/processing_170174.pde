
void setup()
{
  size(500, 500);
 size(500,500);
 background(255);
 noStroke();
  fill(255,120,30);
  smooth();
}
 
void draw()
{
  int i=20;
  int j=20;
  if (mousePressed) {
    i=20;
    j=20;
  }
   
  else {
    i=20;
    j=10;
  }
 
  rectMode(CENTER);
  rect(mouseX, mouseY, i, j);
   
   
}
 




