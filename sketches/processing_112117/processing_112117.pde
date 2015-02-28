
int numCircles = 25;
int spacing = 30;
 
void setup() {
size(800, 600);
smooth();
background(0);
}
 
void draw() { 
background(0);
 
bullseye(width/2, height/2);
bullseye(width/2-200, height/2);
bullseye(width/2+200, height/2);
bullseye(width/2, height/2-200);
bullseye(width/2, height/2+200);
}
 
void bullseye(int xPos, int yPos) {
stroke(127);
strokeWeight(.5);
noFill();
// bullseye
for (int i=0;i < numCircles;i++)
{
ellipse(xPos, yPos, i*spacing, i*spacing);
}
}
