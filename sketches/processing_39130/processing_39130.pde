
int xpos;
int ypos;

size(300,300);
stroke(0);
strokeWeight(5);
smooth();
background(255);

xpos = width/2;
ypos = height/2;

//seat
line(xpos-30, ypos, xpos+30,ypos);
//back
line(xpos-30, ypos, xpos-35, ypos-80);
//left leg
line(xpos-30, ypos, xpos-35, ypos+80);
//right leg
line(xpos+30, ypos, xpos+35, ypos+80);  


