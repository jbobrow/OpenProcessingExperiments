
void setup()
{
  size(600,600);
  background(0);
}

void draw()
{
  
    fill(255,219,244);
    stroke(random(255),random(255),random(255),random(255));
    strokeWeight(5);
    triangle(mouseX-10,mouseY+20,mouseX,mouseY, mouseX+20,mouseY+10);
  
}
