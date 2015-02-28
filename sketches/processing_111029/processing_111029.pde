
fill(#C0FAF3);
size(300, 300);
rect(0, 0, width, height);
fill(255, 255, 255);


float x = 50;
float y = 50;
float diameter = 100;
ellipse(x, y, diameter, diameter);

x = x+100;
y = y+100;
diameter = diameter+100;
ellipse(x, y, diameter, diameter);

x = x/2;
y = y/2;
diameter = diameter/2;
ellipse(x, y, diameter, diameter);

fill(#F09584);
rect(0, height/2, width/3, height/4);
fill(#94D625);
triangle(0,100, width/2,0, width, 100);
fill(#FA42F1);
ellipse(width/2, height/2, width/2, height/2);

int z = 10;
line(0, height/1.5, 100, 100);
line(0, height/1.5+z/2, 100+z/2, 100+z/2);
line(0, height/1.5+2*z, 100+2*z, 100+2*z);
line(0, height/1.5+4*z, 100+4*z, 100+4*z);
line(0, height/1.5+8*z, 100+8*z, 100+8*z);


