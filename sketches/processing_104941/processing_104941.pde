
size(400,400);
background(255);

float xpos;
float ypos;
float gradientWidth;
float gradientHeight;
float partWidth;
float partHeight;

gradientWidth=width;
gradientHeight=height;

partWidth=width;
partHeight=height;

xpos=width/2;
ypos=height/2;

//rect1
fill(0,0,255);
gradientWidth=gradientWidth/1.2;
gradientHeight=gradientHeight/8;
rectMode(CENTER);
rect(xpos,ypos,gradientWidth,gradientHeight);

//ellipse
fill(0,0,50,180);
partWidth=partWidth/2;
partHeight=partHeight/2;
ellipse(xpos,ypos,partWidth,partHeight);

//rect2
fill(0,0,255,100);
rectMode(CENTER);
rect(xpos,ypos,gradientHeight,gradientWidth);

//line

line(0,0,width,height);
line(0,height,width,0);

//shape
fill(0,255,0,100);
beginShape();
vertex(0,height/2);
vertex(width/2,0);
vertex(width,height/2);
vertex(width/2,height);
endShape();
