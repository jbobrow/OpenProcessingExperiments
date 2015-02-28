
/* @pjs font = "PurplePurse-Regular.ttf" ; */

int x=0;
int myState = 0 ;
PFont myFont;
 
void setup() {
  size (500, 500);
  smooth();
  myFont = createFont("PurplePurse-Regular.ttf", 200);
}

void draw(){
   
switch(myState){
  
case 0:
background(#67A5FA);
fill (255);
rect (0, 400, 500, 100);
textFont(myFont,25); 
fill (000);
text("Click the mouse to build a snowman", 50, 480);
break;
 
case 1:
fill(255);
ellipse(250, 350, 200, 200);
break;
 
case 2:
fill(255);
ellipse(250, 230, 150, 150);
break;
 
case 3:
fill(255);
ellipse(250, 150, 100, 100);
break;
   
case 4:
fill(000);
ellipse(235, 130, 10, 10);
break;
   
case 5:
fill(000);
ellipse(265, 130, 10, 10);
break;

case 6:
fill(000);
//triangle(80, 125, 108, 70, 236, 125);
ellipse(250, 150, 15, 15);
break;
   
case 7:
fill(000);
pushMatrix ();
rotate (radians (180));
arc(-250, -165, 60, 50, PI, TWO_PI);
popMatrix ();
break;
   
case 8:
fill(000);
ellipse(250, 230, 20, 20);
ellipse(250, 280, 20, 20);
ellipse(250, 330, 20, 20);
break;

case 9:
fill(000);
rect (220, 40, 60, 50);
fill(000);
rect (200, 85, 100, 30);
textFont(myFont,40); 
fill (#FF0000);
text("Happy", 310, 100);
text("Birthday!", 310, 150);
break;
  
  }
  } 

void mousePressed(){
   myState ++;
    if (myState > 9){
  myState = 0;
  }
}



