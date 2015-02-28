
void setup()
{
 size(400, 600);
 background(0, 0, 0,130);
 smooth();
}

void draw()
{

 fill(random(255),random(255),random (255));
 ellipse (mouseX,mouseY,100,100);
}

void keyPressed()
{
 background (random (255),random (255),random (255)); 
}
