
/*
@author Ziqu Zou
07/30/2013
homework2.0
*/

size(500,500);
background(60,110,173);

int groundWidth=width;
int groundHeight=height;

int circleW;
int circleH;
int rect1W;
int rect1H;
int rect2W;
int rect2H;

noStroke();

//circle
fill(0,70);
ellipse(groundWidth/2,groundHeight/2,groundWidth,groundHeight);
fill(0,50);
ellipse(groundWidth/2,groundHeight/2,groundWidth-groundWidth/10,groundHeight-groundWidth/10);
fill(255);
ellipse(groundWidth/2,groundHeight/2,groundWidth-groundWidth/7,groundHeight-groundWidth/7);


//rect
fill(198,0,0);

rect1W=groundWidth-groundWidth/2;
rect1H=groundWidth/7;
rect(groundWidth/2-rect1W/2,groundHeight/2-rect1H/2,rect1W,rect1H);

rect2W=rect1H;
rect2H=rect1W;
rect(groundWidth/2-rect2W/2,groundHeight/2-rect2H/2,rect2W,rect2H);



