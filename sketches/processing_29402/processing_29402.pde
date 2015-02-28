
int xpos;
int ypos;
int interval;
int gradientWidth, gradientHeight;
//media
size(200,200);
background(0);
//define variable values
interval = 255/5;
//radial width/height
gradientWidth = gradientHeight = width;
//radial center pt
xpos = width/2;
ypos = width/2;
noStroke();
//create ellipses
fill(interval);
ellipse(xpos,ypos,gradientWidth,gradientHeight);
fill(interval*2);
ellipse(xpos,ypos,gradientWidth-interval,gradientHeight-interval);
fill(interval*3);
ellipse(xpos,ypos,gradientWidth-interval*2,gradientHeight-interval*2);
fill(interval*4);
ellipse(xpos,ypos,gradientWidth-interval*3,gradientHeight-interval*3);
fill(interval*5);
ellipse(xpos,ypos,gradientWidth-interval*3,gradientHeight-interval*3);


