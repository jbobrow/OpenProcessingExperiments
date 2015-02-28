
float zoogX;
float zoogY;

float eyeR;
float eyeG;
float eyeB;


  void setup (){
// Set the size of the window
size(300,300);
}

int x=150;
int y= 130;


void draw () {
  
// Draw a white background
background (255);

// draw Albert's head/body
rectMode(CENTER);
rect(x,y-60,100,40);
rect(x ,y ,150,80);

//Draw Albert's eyes/ eyeball's
eyeR= random (255);
eyeG=random (255);
eyeB= random (255);
fill (eyeR, eyeG, eyeB);

ellipseMode (CENTER);
ellipse (x-40,y-80,30,50);
ellipse (x+40,y-80,30,60);
stroke (0);
fill (0);
ellipse (x+40,y-80,20,10);
ellipse (x-40,y-80,10,40);

//Draw Albert's mouth/ teeth
rectMode (CENTER);
rect(x,y-20,80,40);
rect(x,y,30,10);
stroke (0);
fill (255);
rect (x-20,y-30,10,20);
rect (x+20,y-30,10,20);

//Draw Albert's arms/ legs
line (x-40,y+40,110,210);
line (x+40,y+40,190,210);
line (x-75,y-40,30,120);
line (x+75,y-40,250,140);

//draw Albert's shoes
stroke (0);
fill (240,0,0);
ellipseMode (CENTER);
ellipse (200,210,20,10);
fill(mouseX,mouseY,100);
ellipse (mouseX, mouseY,20,10);

y=y-1;
}

