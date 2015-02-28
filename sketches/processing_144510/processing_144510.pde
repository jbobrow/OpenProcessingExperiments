
void setup()
{ 
size (500,500);
}

void draw()
{
background(0);
 
pushMatrix();
  noStroke();
  fill(mouseX/2,25,0);
  translate(0,50);
    rect(mouseX,0,50,50, mouseX);
    rect(mouseX,70,50, 50, mouseX);
    rect(mouseX,140,50, 50, mouseX);
  translate(450,0);
    fill(255,255,mouseX/2);
    rect(-mouseX,210,50, 50, mouseX);
    rect(-mouseX,280,50, 50, mouseX);
    rect(-mouseX,350,50, 50, mouseX);
popMatrix();

pushMatrix();
translate(0,0);
fill(0);
rect(220, 50, 10,50);
rect(240, 50, 10,50);
rect(280, 400, 10,50);
rect(300, 120, 10, 50);
rect(320, 120, 10, 50);
rect(100, 190, 10, 50);
rect(120, 190, 10, 50);
rect(100, 330, 10, 50);
rect(120, 330, 10, 50);
rect(180, 260, 10, 50);
rect(300, 260, 10, 50);
popMatrix();
}

