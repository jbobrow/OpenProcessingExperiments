
size(300, 300);
background(#9EF5F3);

float x = 175.6/2;
float y = 188.25/2;
float diameter = 220.55/2;

ellipse(x, y, diameter, diameter);

fill(#F005C9);
ellipse(width/3, height/3, width, height);
noFill();
fill(#1FF005);
rect( width/2 - 150, height/2 - 150, width, height/5);
noFill();
fill(100, 86, 200);
triangle(0, 100, width/2, 0, width, 100);
noFill();

ellipse(x, y, diameter, diameter);

line(0, 50, width, height);
line(0, 50*1.5, width*1.5, height*1.5);
line(0, 50*2, width*2, height*2);
line(0, 50*3, width*3, height*3);
line(0, 50*5, width*5, height*5);


