
int x=40;
int y=30;
int bodyHeight=30;
int neckHeight=6;
int radius=2;

size(100,100);
smooth();
background(204);
ellipseMode(RADIUS);

//Neck
stroke(102);
rect(x+8,y,x/10,neckHeight);
//head
fill(0);
rect(x+4,y-10,bodyHeight/2,y/3);
fill(255);
rect(x+6,y-8,x/x,y/y);
rect(x+6,y-6,x/x,y/y);
rect(x+12,y-8,x/x,y/y);
rect(x+12,y-6,x/x,y/y);
fill(102);
rect(x+6,y-2,x/x,y/y);
rect(x+8,y-2,x/x,y/y);
rect(x+10,y-2,x/x,y/y);
rect(x+12,y-2,x/x,y/y);
line(x+8,y-10,x+4,y-16);
line(x+12,y-10,x+16,y-16);
ellipse(x+3,y-17,radius/2,radius/2);
ellipse(x+17,y-17,radius/2,radius/2);
//arm
rect(x-6,y+12,x-34,y/y);
quad(x-6,y+12,x-6,y+14,x-12,y+24,x-14,y+24);
quad(x+20,y+12,x+20,y+14,x+30,y+6,x+30,y+4);
rect(x+30,y+4,x-34,y/y);
fill(0);
ellipse(x-13,y+25,radius/2,radius/2);
ellipse(x+37,y+5,radius/2,radius/2);
//leg
noFill();
rect(x+4,y+30,x/20,y/3);
quad(x+4,y+40,x+6,y+40,x+2,y+50,x,y+50);
rect(x+14,y+30,x/20,y/3);
quad(x+14,y+40,x+16,y+40,x+20,y+50,x+18,y+50);
fill(0);
ellipse(x+1,y+51,radius/2,radius/2);
ellipse(x+19,y+51,radius/2,radius/2);
//body
stroke(255);
rect(x,y+6,x/2,bodyHeight);
ellipse(x+6,y+14,radius*2,radius*2);
ellipse(x+6,y+14,radius,radius);
line(x+6,y+18,x+6,y+24);
line(x+6,y+24,x+20,y+24);



