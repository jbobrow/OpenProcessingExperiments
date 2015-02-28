
int diameter = 5;

void setup()
{
size(1000,1000);
noFill();
frameRate(10);
}
void draw()
{
ellipse(500,500,diameter,diameter);
ellipse(250,250,diameter,diameter);
ellipse(250,750,diameter,diameter);
ellipse(750,250,diameter,diameter);
ellipse(750,750,diameter,diameter);
diameter = diameter + 10;
}



