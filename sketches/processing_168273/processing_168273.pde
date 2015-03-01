
void setup()
{
 size(500,500);
 background(255);
 fill(0);
}

void draw()
{
  background(255);
  
  //Liniennetz
  line(250,0,250,500);
  line(0,250,500,250);
  
  triangle(0,0+(mouseY/2),0,0,0+(mouseY/2),0);
  triangle(250,0+(mouseY/2),250,0,250+(mouseY/2),0);
  triangle(0,250+(mouseY/2),0,250,0+(mouseY/2),250);
  triangle(250,250+(mouseY/2),250,250,250+(mouseY/2),250);
}
