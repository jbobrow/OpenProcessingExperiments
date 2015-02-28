
// Jason Tsao
// 1.17.2012

int xpos;
int ypos;

size(300, 300);
smooth();

xpos = width/2;
ypos = height/2;

// Draw a smiley face


ellipse( xpos, ypos, 300,300);

arc( xpos, ypos, 200, 200, radians(0), radians(180));

ellipse( xpos-30, ypos-30, 30, 30);
ellipse( xpos + 30, ypos-30, 30, 30);

