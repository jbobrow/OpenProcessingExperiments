
void setup()
{
size (400, 400);
background(240);
smooth();
strokeWeight(3);
}



void draw()
{

}


void mousePressed()
{
noFill();
rect(mouseX, mouseY, 25,25);
}

void mouseReleased()
{
  rect(mouseX - 50,mouseY -50, 50,50);
}

void keyPressed()
{
  background (245);
}

                
