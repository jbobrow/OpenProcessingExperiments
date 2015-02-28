
void setup()
{
 size(400, 600);
 background(0, 0, 0);
 smooth();
}

void draw()
{
 fill(random(255),random(255),random(255));
 ellipse(mouseX, mouseY, 100,100);
 stroke(255, 155, 155);
 line(0, 0, mouseX, mouseY);

 
}
