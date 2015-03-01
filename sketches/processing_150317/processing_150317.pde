
int rad = 60;
float xpos, ypos;

floatxspeed = 2.8;
floatyspeed = 2.2;

int x direction = 1;
int y direction = 1;

void setup()
{
size(640, 360);
frameRate(30);
ellipseMode(RADIUS);

xpos = width/2;
ypos = height/2;
}

void draw()
{
background(102);

xpos = xpos + (xspeed * xdirection);
ypos = pos + (yspeed * ydirection);

if(xpos > width-rad || xpos < rad) {
xdirection *= -1;
}
if (ypos > height-rad || ypos < rad) {
ydirection *=-1;
}
ellipse(xpos, ypos, rad, rad);
}
