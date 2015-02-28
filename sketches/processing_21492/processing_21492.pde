

// variables for position of left ellipse
float x = 300;
float y = 100;

// variables for position of right ellipse
float x1=100;
float y1 = 100;

//variables for position of boca 
float x2= 200;
float y2 = 200;

// variables for speed of rectangles
float speed = 3;
float speed1 = 3;
float speed2 = 3;


void setup () {
 size (400,400);

}

void draw () {
  
  smooth ();

 //yellow background
 background (248,235,0);

 //color the rectangle
 fill (0);
 noStroke () ;
 rectMode (CENTER);
 
 
//eye left
 ellipse (x, y, 75,75);
 fill(255);
 ellipse (x-10, y-15, 22,30);
 
 //eyes right
 fill(1);
 ellipse (x1, y1, 75, 75);
 fill(255);
 ellipse (x1-10, y1-15, 22,30);
 
 //red 
 stroke(1);
 strokeWeight(2.5);
 fill(255,49,74);
 ellipse (x2,y2+90,150,190);
 
 
 //chicks
  strokeWeight(3.5);
 ellipse (x2+225, y2+50,130,130);
  ellipse (x2-225, y2+50,130,130);
 
 
 //yellow
 noStroke();
 fill ( 248,235,0);
 ellipse(height/2+50, width-180,120,120);
  fill ( 248,235,0);
 ellipse(height/2-50, width-180, 120,120);

//nose 
stroke(1);
strokeWeight(5);
fill(1);
triangle(190,210,200,200,210,210);

//move the rectangles by adding speed
 y = y+speed;
 y1=y1+speed1;
y2= y2+speed2;


//keep the rectangles from leaving the screen
 if ((y>height-25) || (y<150)) {
 speed = speed *-1; 

 }

 if ((y1>height-25) || (y1<150)) {
 speed1 = speed1 *-1; 

 }

 if ((y2>height-25) || (y2<300)) {
 speed2 = speed2 *-1; 

 }
}


