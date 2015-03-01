
void setup()
{size(400,400);
background(100,100,150);}

void draw (){}

void mousePressed()
{strokeWeight(0);
fill(200,0,0,99);
ellipseMode(RADIUS);
ellipse(mouseX, mouseY, 33,39);
}

void keyPressed()
{
fill(0,120,0,99);
ellipseMode(RADIUS);
rect(mouseX, mouseY, 33,39);
}


