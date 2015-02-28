


int x=60;
int x2=120;
int midpt=100;
int heady=60;
int circleshape= 50;
int circlelocationx= 70;
int circlelocationy=410;
int circlesize=50;


void setup(){
size(800, 800);
smooth ();


}


void draw(){
  
  background (255);
  
  Robotdraw (750,100);
  Robotdraw (700,100);
  Robotdraw (650,100);
  Robotdraw (600,100);
  Robotdraw (550,100);
  Robotdraw (500,100);
  Robotdraw (450,100);
  Robotdraw (400,100);
  Robotdraw (350,100);
  Robotdraw (300,100);
  Robotdraw (250,100);
  Robotdraw (200,100);
  Robotdraw (150,100);
  Robotdraw (100,100);
  Robotdraw (50,100);
  Robotdraw (0,100);


}



void Robotdraw(int x, int y){
  
  pushMatrix ();
translate (x,y);

// right foot
//vertex (x,y)

beginShape();
fill (0,0,255);
noStroke();
vertex (x, 540);
vertex (x, 460);
vertex(x+20, 460);
vertex(x+20, 520);
vertex(100, 540);
endShape ();

// left foot

beginShape();
fill (0, 0, 255);
noStroke();
vertex (x2, 540);
vertex (x2, 460);
vertex(x2+20, 460);
vertex(x2+20, 520);
vertex(x2+40, 540);
endShape ();

//circle above triangle
// ellipse(x, y, width, height)
fill (0,0,100);
ellipse (midpt, 290, 100, 100);

//triangle above body
//triangle(x1, y1, x2, y2, x3, y3);
fill (0, 0, 150);
noStroke();
triangle ( 40, 320, midpt, 380, midpt+60, 320);

//rectangle above circle
//rect(x, y, width, height)

fill (0,0, 50);
rect (50, 240, midpt, 55); 

//antenas
//line(x1, y1, x2, y2)
stroke (20);
strokeCap(ROUND); 
line(60, 240, 10, midpt); //left antena
line (149, 240, 200, 80);

//head
// ellipse(x, y, width, height)
ellipse (midpt, heady, 110, 110);



// lower body
// ellipse(x, y, width, height)
fill(0,0,200);
noStroke();
ellipse (circlelocationx-10, circlelocationy+40, circlesize+10, circlesize+10);
ellipse (circlelocationx+30, circlelocationy+40, circlesize+10, circlesize+10);
ellipse (circlelocationx+70, circlelocationy+40, circlesize+10, circlesize+10);
ellipse (circlelocationx-10, circlelocationy, circlesize+10, circlesize);
ellipse (circlelocationx+10, circlelocationy, circlesize+10, circlesize);
ellipse (110, circlelocationy, circlesize+10, circlesize);
ellipse (140, circlelocationy, circlesize+10, circlesize);
ellipse (70, circlelocationy-30, circlesize, circlesize+20);
ellipse (100, circlelocationy-30, circlesize, circlesize+20);
ellipse (130, circlelocationy-30, circlesize, circlesize+20);


//eyes
//rect(x, y, width, height)
fill (255);
rect (70, heady-40, 20, 20);
rect (120, heady+10, 20, 20);
fill (66, 211, 98);
ellipse (80, heady-30, 5, 5);
ellipse (130, heady+20, 5, 5);

//mouth
fill (255, 0, 0);
ellipse (midpt, heady, 10, 10);


popMatrix();
}



