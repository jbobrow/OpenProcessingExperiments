
void setup()
{
   size(500,500);

}

void draw()
{

background(80);

noStroke();
fill(210);

ellipse(400,100,75,75);
ellipse(400,400,75,75);
ellipse(200,100,75,75);
ellipse(300,100,75,75);
ellipse(200,400,75,75);
ellipse(300,400,75,75);


ellipse(mouseX/3.75,100,75,75);
ellipse(mouseX/3.75,400,75,75);

fill(90,193,156);
ellipse(mouseX/3.75,200,75,75);
ellipse(mouseX/3.75,300,75,75);
ellipse(300,200,75,75);
ellipse(300,300,75,75);
ellipse(200,200,75,75);
ellipse(200,300,75,75);
ellipse(400,300,75,75);
ellipse(400,200,75,75);
}
