
float xpos;
float ypos;
int radius = 125;

void setup()
{
size(500,500);
smooth();
strokeWeight(5);
ellipseMode(RADIUS);
}

void draw()
{
xpos = width/2;
ypos = height/2;
background(0);

/*outside circ*/
stroke(255);
strokeWeight(3);
line(xpos-30,ypos-40, xpos-30, ypos+40);
fill(0);
  ellipse(xpos,ypos-20, 40,40);
float d = dist(mouseX, mouseY, 250, 250);
if(d < radius) {
  fill(225);
  } else {
  fill(0,255,255,30);
  }
ellipse(xpos,ypos, radius, radius);
}

/*float e = dist(mouseX, mouseY,40,40);*/



