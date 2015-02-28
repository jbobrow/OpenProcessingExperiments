
size(300, 300);
background(154, 234, 232);

//first ellipse (red)
float x = 50;
float y = 50;
float diameter = 25;
fill(250, 0, 0);
ellipse(x, y, diameter, diameter);

//second ellipse (green)
x += 100;
y += 100;
diameter += 100;
fill(0, 250, 0);
ellipse(x, y, diameter, diameter);

//third ellipse (blue)
x /= 2;
y /= 2;
diameter /= 2;
fill(0, 0, 250);
ellipse(x, y, diameter, diameter);

//rectangle (always 4th quadrant)
int rectWidth = width / 2;
int rectHeight = height / 2;
fill(245, 69, 222);
rect(width / 2, height / 2, rectWidth, rectHeight);

//oval (always 3rd quadrant)
int ovalWidth = width / 2;
int ovalHeight = height / 4;
fill(255, 244, 28);
ellipse(width / 4, (height / 2) + (height / 4), ovalWidth, ovalHeight);

//triangle (always 1st quadrant)
int centerX = width / 2;
int centerY = height / 2;
int topX = (width / 2) + (width / 4);
int topY = 0;
int rightX = width;
int rightY = height / 2;
fill(46, 234, 242);
triangle(centerX, centerY, topX, topY, rightX, rightY);

//lines at exponential intervals
int lineY = 10;
strokeWeight(5);
stroke(0);
line(0, lineY, width, lineY);
lineY *= 2;
line(0, lineY, width, lineY);
lineY *= 2;
line(0, lineY, width, lineY);
lineY *= 2;
line(0, lineY, width, lineY);
lineY *= 2;
line(0, lineY, width, lineY);



