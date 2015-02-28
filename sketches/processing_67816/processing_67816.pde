
void setup()
{
size(1000,1000);
noFill();
smooth();
strokeWeight(12);
}

void draw()
{
background(255,255,255);
stroke(0,0,0);
ellipse(499,499,200,200);
stroke(2,62,222);
ellipse(289,499,200,200);
stroke(255,0,0);
ellipse(mouseX,mouseY,200,200);
stroke(2,206,13);
ellipse(609,599,200,200);
stroke(255,205,0);
ellipse(389,599,200,200);
}

