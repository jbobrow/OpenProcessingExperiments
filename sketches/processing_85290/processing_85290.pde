
void setup()
{
  size(1000,500);
  background(250);
  smooth();
}


int value = 0;

void draw()
{

//background(mouseX,mouseY,mouseX,mouseY);
fill(255);



stroke(140,134,255);
println(mouseX);

if (mousePressed==true) {
  fill (0);
  } else {
  fill (255);
  }
  ellipse(mouseX,mouseY, 25,25);
  
} 


