
size(400,400);
background(255,255,255);

int xpos;
int ypos;

int interval;
int gradientWidth;
int gradientHeight;

interval = 300/5;
gradientWidth = width;
gradientHeight = height;

xpos = width/2;
ypos = height/2;

noStroke();

fill(interval);
fill(255,0,200);
ellipse(xpos, ypos, gradientWidth, gradientHeight);

fill(interval*2);
fill(0,255,255);
ellipse(xpos, ypos, gradientWidth-interval*2, gradientHeight-interval/2);

fill(interval*3);
fill(255,255,0,80);
ellipse(xpos, ypos, gradientWidth-interval, gradientHeight-interval*4);

fill(0,0,0,50);
rect(xpos, ypos+1, gradientWidth-interval, gradientHeight-interval/2);

fill(0,0,0,50);
rect(0, 0, gradientWidth-200, gradientHeight-200);


