
/*************************************

*Assignment 01
*Name: Leslie Tjing
*Email: Ltjing@haverford.edu
*Course: CS 110- Section 02
*Submitted: 1-26-2012
*
* This is an attempted scenery sketch of Vincent van Gogh's Starry Night Over the Rhone painting.
I used curveVertex to outline the shape of Van Gogh's famous cypress tree. I wanted to draw the wind, and tried to using bezier curves,
but was unable to successfully do so. I instead drew clouds. Furthermore, it was difficult to 
capture the essence of a village, but I was able to create some houses using the primitive shapes we learned in class. 

**************************************/
PImage img;
  
void setup () {
  size (1000, 600);
  smooth();
}

void draw() {
  background(0, 0, 0);
  noStroke ();
  strokeWeight(2);
  frameRate (0);
  
 
//Hills (from left to right)
smooth();
noStroke ();
fill (0,130,145);
arc (0, 450, 300, 150, 3.114, 6.242);
fill (11, 81, 98);
arc (500, 435, 275, 200, 3.114, 6.237);
fill (0, 130,145);
arc (300, 450, 350, 300, 3.114, 6.242);
fill (0, 130, 145);
arc (700, 435, 275, 200, 3.114, 6.237);
fill (11, 81, 98);
arc (1000, 425, 155, 145, 3.114, 6.237);
fill (0, 130, 145);
arc (900, 425, 175, 135, 3.114, 6.237);


//Water
noStroke ();
fill (8, 24, 100);
rectMode (CORNERS);
rect(0, 440, 1000, 600);


//Ground
noStroke ();
fill(176, 245, 116);
beginShape ();
vertex (0, 600);
    curveVertex(0, 500);
    curveVertex(0, 550);
    curveVertex(100, 530);
    curveVertex(200, 520);
    curveVertex(300, 445);
    curveVertex(400, 435);
    curveVertex(500, 415);
    curveVertex(600, 400);  
    curveVertex(700, 405);
    curveVertex(1000, 410);
    curveVertex(1000, 410);
    vertex(1000, 600);
endShape ();


//House 1
stroke (0);
rectMode (CORNER);
fill (164, 81, 237);
rect(400, 375, 120, 120);
//H1 door
fill(108, 59, 26);
rect(435, 430, 45, 65);
//H1 window
fill(209, 188, 175);
arc (457, 430, 45, 50, PI, 2*PI);
//H1 roof
fill(160, 19, 57);
triangle (380, 385, 460, 330, 540 , 385);
//H1 doorknob
ellipse (443, 460, 5, 5);


//House 2
fill (245, 133, 42);
rect ( 550, 300, 80, 130);
//H2 door
fill(108, 59, 26);
rect(573, 365, 35, 65);
//H2 window 
stroke (0);
fill(0);
rect(560, 315, 20, 35);
stroke (255);
line(560, 330, 580, 330);
line(570, 315, 570, 350);
stroke (0);
fill (235,random (215, 255), 25);
frameRate (5);
rect(600, 315, 20, 35);
stroke (255);
line(603, 330, 617, 330);
line(610, 317, 610, 348);
//H2 Roof
stroke (0);
fill(137, 175, 16);
triangle( 540, 300, 590, 230, 640, 300);
//H2 doorknob
ellipse (580, 399, 5, 5);


//House 3
fill (237, 245, 42);
rect (700, 315, 120, 100);
//H3 door
fill(108, 59, 26);
arc (760, 414, 55, 100, PI, 2*PI);
//H3 windows
fill(255, 255, 0);
//left window
rect(715, 325, 20,33);
line(717, 340, 733, 340);
line(725, 327, 725, 356);
//right window
rect(780, 325, 20, 33);
line(780, 340, 800, 340);
line(790, 327, 790, 356);
//H3 roof
fill(40, 222, 211);
quad( 680 , 315, 733, 280, 783, 280, 840, 315);
//H3 doorknob
fill(40, 222, 211);
ellipse (743, 400, 5, 5);


//House 4
fill (245, 42, 137);
rect ( 850, 380, 120, 100);
//H4 door
fill(108, 59, 26);
rect ( 890, 430, 45, 50);
//H4 window 
fill (235,random (215, 255),25);
frameRate (2);
//left window
rect (865, 390, 20, 33);
line (867, 405, 883, 405);
line (875, 391, 875, 422);
//right window
rect (937, 390, 20, 33);
line (939, 405, 955, 405);
line (947, 390, 947, 421);
//H4 roof
fill(250,157,35);
triangle (840, 380, 910, 300, 980, 380);
fill(250,157,35);
ellipse (900, 460, 5,5);


//Cloud 1 (far left)
noStroke();
fill(234, 234, 234);
ellipse (175, 130, 165, 100);
ellipse (230, 130, 95, 60);
ellipse (120, 130, 95, 60);


//Cloud 2
noStroke();
fill(234, 234, 234);
ellipse (475, 100, 165, 70);
ellipse (530, 100, 95, 40);
ellipse (420, 100, 95, 40);

     
//Sun
stroke (0);
fill (248, 247, 134);
ellipse (850, 150, 150, 150);


//Inner Moon
fill (250, 247, 134);
ellipse (850, 150, 135, 135);
fill (232, 74, 30);
ellipse (850, 150, 115, 115);


//Cloud 3
noStroke();
fill(255);
ellipse (775, 200, 165, 60);
ellipse (820, 200, 95, 39);
ellipse (730, 200, 95, 39);


// Draw First Tree
smooth();
noStroke ();
fill(33,115,19);
beginShape ();
    curveVertex(105, 600);
    curveVertex(105, 600);
    curveVertex(80, 500);
    curveVertex(105, 400);
    curveVertex(95, 300);
    curveVertex(110, 200);
    curveVertex (115, 150);
    curveVertex(105, 100);
    curveVertex(90, 80);
    curveVertex(90, 80);
    curveVertex(115, 102);
    curveVertex(148, 165);
    curveVertex (170, 200);
    curveVertex (175, 250);
    curveVertex(180, 300);
    curveVertex (190, 350);
    curveVertex(200, 375);
    curveVertex (210, 450);
    curveVertex(230, 500);
    curveVertex(240, 550);
    curveVertex (235, 570);
    curveVertex (215, 597);
    curveVertex (195, 600);
    curveVertex (195, 600);
    
endShape();

 
//Draw Second Tree 
noStroke();
beginShape ();
    vertex (60, 600);
    curveVertex(60, 600); 
    curveVertex(60, 600); 
    curveVertex(35, 550);
    curveVertex(37, 453);
    curveVertex(38, 415);
    curveVertex(58, 350);
    curveVertex(59, 330);
    curveVertex(65, 300);
    curveVertex(80, 330);
    curveVertex(90, 360);
    curveVertex(95, 400);
    curveVertex(96, 453);
    curveVertex(98, 475);
    curveVertex(105, 550);
    curveVertex(105, 600);
    curveVertex(105, 600);
    
endShape ();

 
// Star 1
noStroke ();
fill (63, 145, 224);
ellipse (175, 75, 85, 85);
fill (255,random (215, 255),0);
frameRate (2);
ellipse (175, 75, 65, 65);


//Star 2
fill (63, 145, 224);
ellipse (400, 50, 55, 55);
fill (255,random (215, 255),0);
frameRate (2);
ellipse (400, 50, 45, 45);


//Star 3
fill (63, 145, 224);
ellipse (700, 90, 65, 65);
fill (255,random (215, 255),0);
frameRate (2);
ellipse (700, 90, 50, 50);


//Signpost
fill(49, 34, 14);
rect (290, 270, 8, 55);


//Signpost backing
fill(116, 203, 245);
rect( 250, 235, 90, 60);
stroke (255, 255, 0);
strokeWeight(5);


//Starry Night picture
img = loadImage("Starrynight2.jpg");
image(img, 255, 240, 80, 50);

}

   

