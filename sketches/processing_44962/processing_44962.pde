
PImage pez;
PImage estanque;
int size = 60;
float xpos, ypos;
float xspeed = 2.0;
float yspeed = 2.0;
int xdirection = 1;
int ydirection = 1;

void setup()
{
size(400,300);
noStroke();
frameRate(50);
smooth();

xpos = width/20;
ypos = height/8;
estanque = loadImage ("estanque.jpg");
pez = loadImage ("pez.gif");
}

void draw()
{
background(estanque);
xpos = xpos + ( xspeed * xdirection );
ypos = ypos + ( yspeed * ydirection );
if (xpos > width-size || xpos < 0) {
xdirection *= -1;
}

if (ypos > height-size || ypos < 0) {
ydirection *= -1;
}
image (pez,xpos+size/2, ypos+size/2);
}

