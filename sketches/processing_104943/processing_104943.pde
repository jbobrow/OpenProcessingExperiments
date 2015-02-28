
size(400,400);
background(255,255,255);
noStroke();

int xpos;
int ypos;



int interval;
int grandientWidth;
int grandientHight;

interval=225/10;
grandientWidth=width;
grandientHight=height;

xpos=width/2;
ypos=height/2;

fill(interval,100,100);
ellipse(xpos,ypos,grandientWidth,grandientHight);

interval=interval+50;
grandientWidth=grandientWidth-50;
grandientHight=grandientHight-50;
fill(interval,100,100);
ellipse(xpos,ypos,grandientWidth,grandientHight);

interval=interval+50;
grandientWidth=grandientWidth-50;
grandientHight=grandientHight-50;
fill(interval,100,100);
ellipse(xpos,ypos,grandientWidth,grandientHight);

interval=interval+50;
grandientWidth=grandientWidth-50;
grandientHight=grandientHight-50;
fill(interval,100,100);
ellipse(xpos,ypos,grandientWidth,grandientHight);


int wpos;
int hpos;

wpos=width/2;
hpos=height/2;

fill(255,0,0);
rectMode(CENTER);
rect(wpos,hpos,grandientWidth/5,grandientHight/5,90);

grandientWidth=grandientWidth+50;
grandientHight=grandientHight+50;
fill(255,0,0,80);
rect(wpos,hpos,grandientWidth/5,grandientHight/5,90);

grandientWidth=grandientWidth+50;
grandientHight=grandientHight+50;
fill(255,0,0,60);
rect(wpos,hpos,grandientWidth/5,grandientHight/5,90);

grandientWidth=grandientWidth+50;
grandientHight=grandientHight+50;
fill(255,0,0,40);
rect(wpos,hpos,grandientWidth/5,grandientHight/5,90);

grandientWidth=grandientWidth+50;
grandientHight=grandientHight+50;
fill(255,0,0,20);
rect(wpos,hpos,grandientWidth/5,grandientHight/5,90);

grandientWidth=grandientWidth+50;
grandientHight=grandientHight+50;
fill(255,0,0,20);
rect(wpos,hpos,grandientWidth/5,grandientHight/5,90);
