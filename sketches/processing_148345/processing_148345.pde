
void setup()
{
size(400, 600);
background(255, 255, 12);

}

void draw()
{
stroke(34, 75, 98);
strokeWeight(5);
line(200, 300, mouseX, mouseY);
stroke(0, 0, mouseX, mouseY);
 line(mouseX, mouseY, 50, 50);
}

void mousePressed() {
  exit(); 
}
