
void setup()
{
size(800,800);
background(0,0,0);
smooth();

}

void draw()
{
///fill(400,0,0);
ellipse (mouseX,mouseY,50,50);
}
void mousePressed()
{
fill(random (255), random(255), random(255));
}
void keyPressed()
{
save("snapshop1.png");
background(255,255,255);
}

