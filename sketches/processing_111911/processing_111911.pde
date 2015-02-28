
int x = 200;
int y = 20;
int xspeed = 3;
int yspeed = 3;
int spacing = 60;
int endCircle;

void setup() {
size(800, 600);

}

void draw() {
background(255);

int xpos = x; // actual x position. Add to this line
int ypos = y;
endCircle = xpos + 160;

if (xpos > width - 130 || xpos < 0) { // left and right walls
xspeed = -xspeed; // go the other way
}
if (ypos > height || ypos < 0) { // top and bottom walls
yspeed = -yspeed; // go the other way 
}
while (xpos <= endCircle) {
ellipse(xpos, ypos, 20, 20);
xpos = xpos + xspeed + spacing;
}

x+=xspeed; // this effectively moves them
y+=yspeed;
}


