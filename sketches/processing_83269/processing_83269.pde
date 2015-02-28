
void setup()
{
size(600, 600);
background(255,255,205);
smooth();
frameRate(10);
}

void draw()
{
fill(255,255,255);
rect(100,100,400,400);
stroke(random(0,255),random(0,255),random(0,255));
ellipse(width/2,height/2,mouseX,mouseY);
}
