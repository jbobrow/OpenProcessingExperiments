
//Drawing from Variables
int xpos;
int ypos;
 
size(300, 300);
smooth();
 
xpos = 150;
ypos = 250;
 
line(0,0,width,height);
line(width, 0, 0, height);
ellipse(width/3,  100, 50,50);
ellipse(width/2,  100, 50,50);
ellipse(2*width/3,  100, 50,50);
 
 
//Smiley Face
//head
ellipse(xpos, ypos, 50, 50);
//left eye
ellipse(xpos-10, ypos-10, 7, 6);
//right eye
ellipse(xpos+10, ypos-10, 4, 5);
//smile
arc(xpos, ypos, 30, 30, radians(25), radians(135));



