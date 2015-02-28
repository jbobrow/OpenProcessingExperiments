
void setup()
{
size(800,600);
background(255,255,255); 
}

void draw()
{
  fill(255,0,0);
ellipse(400,300,mouseX,mouseY);
fill(0,0,200);
ellipse(200,150,mouseX,mouseY);
fill(0,255,0);
ellipse(600,450,mouseX,mouseY);
fill(255,255,255);
ellipse(600,150,mouseX,mouseY);
fill(255,255,255);
ellipse(200,450,mouseX,mouseY);
}
