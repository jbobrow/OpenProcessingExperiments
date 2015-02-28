
void setup()
{
  size(500,500);
}

void draw()
{
background(0);
noStroke();
fill(100);
ellipse(250,50,50,50);
ellipse(250,150,50,50);
ellipse(250,250,50,50);
ellipse(250,350,50,50);
ellipse(250,450,50,50);


translate(50,150);
  fill(149,9,9);
  ellipse(mouseX/2.5,0,45,45);



translate(400,200);
fill(149,9,9);
ellipse(-mouseX/2.5,0,45,45);
}
