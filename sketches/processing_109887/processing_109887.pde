
size(300, 300);

background(#55B2F7);

int diameter = 100;
int horizontal = 150;
int vertical = 150;
float d= diameter;
float x = vertical;
float y = horizontal; 

ellipse(x, y, d, d);

x = x + 100;
y = y + 100;
d = d + 100;
ellipse(x, y, d, d);

x = x / 2;
y = y / 2;
d = d / 2;
ellipse(x, y, d, d);


fill(#C006CE);
rect(height / 2, width / 2, height / 2, width / 2);

fill(#0787AD);

ellipse(height / 3, width / 3, d, d);

fill(#AD1515);
triangle(width, y, height, width, x, y);


line(width * 1, 0, 0, height *.2);

line(width * 2, 0, 0, height *.3);

line(width * 3, 0, 0, height * .4);

line(width * 4, 0, 0, height * .5);

line(width * 5, 0, 0, height * .6);



