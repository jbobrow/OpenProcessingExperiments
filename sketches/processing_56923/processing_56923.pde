
PImage tiger1;
PImage t1mask;
PImage tiger2;
PImage t2mask;

int size = 180;

float xpos, ypos;

float xspeed = 2.8;
float yspeed = 2.2;

int xdirection = 1;
int ydirection = 1;

void setup() {
imageMode (CENTER);
size (900,400);
smooth ();

xpos = width/2;
ypos = height/2;

tiger1 = loadImage ("tiger1.jpg");
tiger1.resize (400,400);
t1mask = loadImage ("t1mask.jpg");
t1mask.resize (400,400);
tiger1.mask(t1mask);


tiger2= loadImage ("tiger2.jpg");
tiger2.resize (250,250);
t2mask = loadImage ("t2mask.jpg");
t2mask.resize (250,250);
tiger2.mask(t2mask);
}

void draw() {

background (0,0,0);
image(tiger1, width/2, height/2);

xpos = xpos + (xspeed * xdirection);
ypos = ypos + (yspeed * ydirection);

if (xpos > width-size || xpos < 0) {
  xdirection *= -1;
}
if (ypos > height-size || ypos < 0) {
  ydirection *= -1;
}
image(tiger2, xpos+size/2, ypos+size/2);


}



