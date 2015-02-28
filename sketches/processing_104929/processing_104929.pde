
size (400,400); 
background (255);


smooth();

int circX=120;
int circY=120;
int circW=350;
int circH=350; //
int xpos;
int ypos;
int interval;
int gradientWidth;
int gradientHeight;


fill (50, 200, 255);
ellipse (width/3.1, height/3.5, circW, circH);

smooth ();

float posY= 200;

stroke(50,200,255);
strokeWeight (8);
fill(255 - posY);
rect(width/1.4, height/3, 60, 60);

interval = 255/5;
gradientWidth= width;
gradientHeight= height;

xpos = width/3;
ypos = height/1;

fill(interval);
ellipse(xpos, ypos, gradientWidth, gradientHeight);

fill(interval*5);

gradientWidth = gradientWidth - interval;
gradientHeight = gradientHeight - interval;
ellipse(xpos, ypos, gradientWidth, gradientHeight);

fill(interval);

gradientWidth = gradientWidth - interval;
gradientHeight = gradientHeight - interval;
ellipse(xpos, ypos, gradientWidth, gradientHeight);

fill(interval* 7);

gradientWidth = gradientWidth - interval;
gradientHeight = gradientHeight - interval;
ellipse(xpos, ypos, gradientWidth, gradientHeight);

fill(interval);

gradientWidth = gradientWidth - interval;
gradientHeight = gradientHeight - interval;
ellipse(xpos, ypos, gradientWidth, gradientHeight);





