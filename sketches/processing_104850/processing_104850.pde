
size(600,600);
background(255);
smooth();

int xpos;
int ypos;
int wShape;
int hShape;

xpos=width/2;
ypos=height/2;

//default set width and hight
wShape=width/3;
hShape=height/3;

noStroke();

//red circle
fill(242,91,15,85);
ellipse(xpos/2,ypos/2,wShape,hShape);

//inner red circle1
ellipse(xpos/2,ypos/2,wShape/1.2,hShape/1.2);

//inner red circle2
ellipse(xpos/2,ypos/2,wShape/1.5,hShape/1.5);

//inner red circle3
ellipse(xpos/2,ypos/2,wShape/2,hShape/2);

//green circle
fill(36,175,9,95);
ellipse(xpos*1.5,ypos/2,wShape,hShape);

//inner green circle1
ellipse(xpos*1.5,ypos/2,wShape/1.2,hShape/1.2);

//inner green circle2
ellipse(xpos*1.5,ypos/2,wShape/1.5,hShape/1.5);

//inner green circle3
ellipse(xpos*1.5,ypos/2,wShape/2,hShape/2);

//yellow circle
fill(242,220,15,85);
ellipse(xpos,ypos/2,wShape,hShape);

//inner yellow circle1
ellipse(xpos,ypos/2,wShape/1.2,hShape/1.2);

//inner yellow circle2
ellipse(xpos,ypos/2,wShape/1.5,hShape/1.5);

//inner yellow circle3
ellipse(xpos,ypos/2,wShape/2,hShape/2);

rectMode(CENTER);

//rect
fill(175,9,175,50);
rect(xpos,ypos*1.5,wShape*2.5,hShape/2);

//inner rect1
fill(175,9,175,60);
rect(xpos,ypos*1.5,wShape*2.4,hShape/3);

//inner rect2
fill(175,9,175,70);
rect(xpos,ypos*1.5,wShape*2.3,hShape/4);

//inner rect3
fill(175,9,175,80);
rect(xpos,ypos*1.5,wShape*2.2,hShape/5);


