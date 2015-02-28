
void setup()
{
size(400, 600);
background(0, 0, 0);
smooth();
frameRate(10);
textSize(40);
}

void draw()
{
  fill(0,0,0,75);
  
stroke(255, 65, 255);
line(0, 0, mouseX, mouseY);

textAlign(CENTER);
text("Merry Christmas!:)",200,100);
}
