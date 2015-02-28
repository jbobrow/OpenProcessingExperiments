
void setup()
{
size(400, 600);
background(random(255), random(255), random(255));
smooth();
}

void draw()
{
stroke(random(255), random(255), random(255));
line(200, 300, mouseX, mouseY);
}  

void keyPressed()
{
  background(random(255), random(255), random(255));

}
