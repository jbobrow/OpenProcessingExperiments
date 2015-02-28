
void setup ()
{size(500,500);
background(255);
frameRate(30);
fill(255,0,0);
stroke(0,0,0);
strokeWeight(10);}

void draw()
{background(255);
rect(50,50,mouseX,mouseY);}

void mouseClicked()
{rectMode(CENTER);
fill(mouseY,255,mouseX);
noStroke();
rect(mouseX,mouseY,30,30);}

