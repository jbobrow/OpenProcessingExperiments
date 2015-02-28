
//import fl.transitions.*;
//import fl.transitions.easing*;

int x=60;
int x2=120;
int midpt=100;
int heady=60;
int circleshape= 50;
int circlelocationx= 70;
int circlelocationy=410;
int circlesize=50;
int bodyHeight = 160; //body height
int neckHeight = 70;//neck height
float easing = 0.1;
 
int radius = 45; //head radius



void setup(){
size (800,800);
}





void draw() {

  background (255);
 println ("move mouse left and right at different speeds");


// right foot
//vertex (x,y)
beginShape();
fill (0,0,255);
noStroke();
vertex (x, 540);
vertex (x+10, 460);
vertex(x+20, 460);
vertex(x+30, 520);
vertex(100, 540);
endShape ();

// left foot
beginShape();
fill (0, 0, 255);
noStroke();
vertex (x2+10, 540);
vertex (x2+20, 460);
vertex(x2+20, 460);
vertex(x2+30, 520);
vertex(x2+60, 540);
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

float weight = dist(mouseX, mouseY, pmouseX, pmouseY); 
strokeWeight(weight); 
line(mouseX, mouseY, pmouseX, pmouseY);

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

//head
// ellipse(x, y, width, height)
fill (0,0,50);
ellipse (mouseX, heady, 110, 110);


//eyes
//rect(x, y, width, height)
fill (255);
rect (mouseX-30, heady-40, 20, 20);
rect (mouseX+20, heady+10, 20, 20);
fill (66, 211, 98);
ellipse (mouseX-20, heady-30, 5, 5);
ellipse (mouseX+30, heady+20, 5, 5);

//mouth
fill (255, 0, 0);
ellipse (mouseX, heady, 10, 10);



}


