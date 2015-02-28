
// Code Written By: Chukwudi T. Unonu
// Date Created:  02/07/2012
// Date Finished: 02/13/2012
//
// ARTT489i - Advanced Digital Imaging
// Instructor: Prof. Brandon Morse
// University of Maryland, College Park, MD
//
// Made With: Apple MAC OSX 10.5.8
// Processor 3.06 GHz Intel Core Duo
// Memory 4 GB 1067 MHZ DDR3
// 
// PROJECT 1 of 4: "Tessala' ~ 'Tory"
// DESCRIPTION: An Illustration of Geometric, Organic, Tessellation.
// Lime and/or light green color scheeme against a black background, slowly fading & twisting inward to the center into the color white.
//
// --------------------------------------------------------------------------------------------------------------------------------------
// |       |  Objectives                                                            |  Level of Difficult ( 1 (*) to 5 (*****) | Done ? |
// --------------------------------------------------------------------------------------------------------------------------------------
// | (~)   |  Medium Setup                                                          |  N/A                                     |   YES  | 
// |  (i)  |  Background (Charcoal)                                                 |  *                                       |   YES  |
// |  (ii) |  Border (Grey)                                                         |  **                                      |   NO   |
// | (A)   |  Drawing the first organic, bezier shape, with a lime green point      |  ****                                    |   YES  |
// | (B)   |  Creating a series of commands to have the shape shrink                |                                          |        |
// |       |  inward toward the center                                              |  *****                                   |   NO   |
// | (C)   |  Drawing the rectangle shape, with a red lines point                   |  *                                       |   YES  |
// | (D)   |  Creating a series of commands to have the shape                       |                                          |        |
// |       |  disappear when the mouse is within it's "fill"/"noFill" area          |  **                                      |   NO   |
// | (E)   |  Drawing the ellipse shape, with orange lines                          |  *                                       |   YES  |
// | (F)   |  Creating a series of commands to have the shape                       |                                          |        |
// |       |  fade outward, outside it's fill area (tunnel effect)                  |  **                                      |   YES  |
// --------------------------------------------------------------------------------------------------------------------------------------
// |Option.|  Having a signature at the bottom right react/appear to the mouse      |  *****                                   |   NO   |                       |
// |Option.|  "Prism Shine"                                                         |  ****                                    |   YES  | 
// --------------------------------------------------------------------------------------------------------------------------------------
//
//  ----====    START PROJECT    ====----
//

void setup()
{
  // Screen Resolutions References via Wikiedia
  // (a) <http://en.wikipedia.org/wiki/720p>  
  // HD Size 720p    
    size(1280,720);
  
}

void draw()
{
  // Background Color References via Google.com Search Engine "", Feb 02, 2012.
  // (a) Prese Color Charts <http://www.tayloredmktg.com/rgb/>
  // (b) Color Generator <http://www.colorschemer.com/online.html>
  // (c) Color Calculator <http://drpeterjones.com/colorcalc/>
  // *** (d) Hexadecimal code and RGB value generator <http://www.blogtrickstream.com/2011/08/hexadecimal-color-html-code-rgb-values.html>    

  // "Charcoal" Background
 background(20); 

int value = 0;
//Galactical Sonic Boom
noFill();
smooth();
stroke(255,183,0);
strokeWeight(0.9);
//"for" loop
for (int d = 1500; d > 0; d -= 9) {
  
ellipse(640,340,640,d);
ellipse(640,340,d,340);
ellipse(640, 340, d, d);
}

//// Quads Section
//Shape
beginShape(QUADS);
stroke(111,111,255);// NAVY BLUE
fill(10,10,255); // BLUE
vertex(115,21.25);
vertex(230,21.25);
vertex(172.5,106.25);
vertex(57.5,106.25);//Top-Left

stroke(106,106,0);// DARK YELLOW
fill(255,255,0); // YELLOW
vertex(1035,21.25);
vertex(1150,21.25);
vertex(1207.5,106.25);
vertex(1092.5,106.25);//Top-Right

stroke(106,106,0);// DARK YELLOW
fill(255,255,0); // YELLOW
vertex(57.5,616.25);
vertex(172.5,616.25);
vertex(230,701.25);
vertex(115,701.25);//Bottom-Left

stroke(111,111,255);// NAVY BLUE
fill(10,10,255); // BLUE
vertex(1121.25,616.25);
vertex(1236.25,616.25);
vertex(1178.75,701.25);
vertex(1063.75,701.25);//Bottom-Right
endShape();

//quad();
// Ray of Rectanglar Prism Light
stroke(111,111,255,55);// NAVY BLUE
fill(10,10,255,55); // BLUE
quad(172.5,106.25,230,21.25,800,255,480,255);//Top-Left R
quad(57.5,106.25,172.5,106.25,480,255,480,425);//Top-Left B

stroke(106,106,0,55);// DARK YELLOW
fill(255,255,0,55); // YELLOW
quad(1035,21.25,1092.5,106.25,800,255,480,255);//Top-Right L
quad(1092.5,106.25,1207.5,106.25,800,425,800,255);//Top-Right B

stroke(106,106,0,55);// DARK YELLOW
fill(255,255,0,127); // YELLOW
quad(172.5,616.25,57.5,616.25,480,255,480,425);//Bottom-Left R
quad(172.5,616.25,230,701.25,800,425,480,425);//Bottom-Left T

stroke(111,111,255,55);// NAVY BLUE
fill(10,10,255,55); // BLUE
quad(1063.75,701.25,1121.25,616.25,800,425,480,425);//Bottom-Right L
quad(1121.25,616.25,1236.25,616.25,800,255,800,425);//Bottom-Right T

//// Rectangle
// Reference: Processsing.org <http://processing.org/reference/rect_.html>

// Move the mouse across the image
// to change its value
// Reference <http://processing.org/reference/mouseMoved_.html>


// Prof. Brandon Morse's exemplar
// //
//center is 480 & 255
// top edge - 255-85 = 170
//bottom edge  is 340

//left edge is 320
//right edge is 620

//smooth();
//if(mouseX > 320 && mouseX < 620 && mouseY > 170 && mouseY < 340)
//{
//}
//println(mouseX);



fill(25,100,25);
stroke(0,255,0);
strokeWeight(0.4);
strokeCap(ROUND);
smooth();
if(mouseX > 480 && mouseX < 800 && mouseY > 255 && mouseY < 425)
{
//translate(1,0);
//scale(-0.3);
rect(480, 255, 320, 170);
}
println(mouseX);

 
 
//// Stroke Weight
 strokeWeight(.9);
 
//// Bezier Curves
// Reference: Processsing.org <http://processing.org/reference/bezier_.html>; 
//            WikiPedia.org <http://en.wikipedia.org/wiki/Bézier_curve>
//
// There will be a total of eight seperate lines that are bezier curves
// Their plots should start, continue and end at the following
//
// --------------------------
// MAIN POINTS ( X , Y )
// --------------------------
// POINT 0001: (640,170)
// POINT 0002: (800,255)  
// POINT 0003: (960,340)
// POINT 0004: (800,425)
// POINT 0005: (640,510)
// POINT 0006: (480,425)
// POINT 0007: (320,340)
// POINT 0008: (480,255)
// --------------------------

// Loop
// Reference: Processsing.org <http://processing.org/reference/loop_.html>

// Curves 1 & 2
//noFill();
//stroke(0,255,0);
//line(640,170, 800, 255);
//bezier(x1,y1,cx1,cy1,x2,y2,cx2,cy2);
//bezier(640,170,640,212.5,720,255,800,255);
// cave-in South West
//line(800, 255, 960, 340);
//stroke(0,255,0);
// cave-out North East
//bezier(800,255,880,255,960,255,960,340);
// ------------------
// Curves 3 & 4
//noFill();
//stroke(0,255,0);
//line(960, 340, 800, 425);
//bezier(960, 340, 880, 340, 800, 382.5, 800, 425);
// cave-in NW
//line(800, 425, 640, 510);
//stroke(0,255,0);
// cave-out SE
//bezier(800, 425, 800, 467.5, 720, 510, 640, 510);
// ------------------
// Curves 5 & 6
//noFill();
//stroke(0,255,0);
//line(640, 510, 480,425);
// cave-in NE
//bezier(640, 510, 640,467.5, 560,425, 480, 425);
//line(480,425, 320,340);
//stroke(0,255,0);
// cave-out SW
//bezier(480, 425, 400,425, 320,382.5, 320,340);
// ------------------
// Curves 7 & 8
//noFill();
//stroke(0,255,0);
//line(320,340, 480,255);
// cave-in SE
//bezier(320,340,400,340, 480, 297.5, 480,255);
//line(480,255, 640, 170);
//stroke(0,255,0);
// cave-out NW
//bezier(480,255, 480,255, 520,170, 640, 170);
// ------------------


// Prof. Brandon Morse's exemplar
// // {
// pushMatrix();
// translate(640,340);
// scale(1+(i*.1));
// noFill();
// stroke(255,183,0);
// ellipse(0,0, 640, 340);
// popMatrix();
// }
}

//
//  ----====    END PROJECT    ====----
//
// -------------------------------
// |       |  Checklist          |
// -------------------------------
// | (A)   |  [  X  ]            |
// | (B)   |  [  -  ]            |
// | (C)   |  [  X  ]            |
// | (D)   |  [  -  ]            |
// | (E)   |  [  X  ]            |
// | (F)   |  [  -  ]            |
// -------------------------------
// |Option.|  [  -  ]            |
// -------------------------------
//
//Assignment 1 – Drawing in Processing
//
//In order to familiarize yourself with the processing environment, we’ll start by looking at 
//the basic means of creating imagery in Processing: points, lines, curves, and the shape 
//primitives (ellipse, box).
//
//
//
//For this first assignment, you are to use Processing to create a drawing. The content of 
//the drawing is of your choice, with the following caveats:
//
// 
//
//You must use the following functions:
//
//    * line();
//    * fill();
//    * stroke();
//    * ellipse();
//    * strokeWeight();
//    * quad();
//    * rect();
//
//You may optionally use:
//
//    * bezier();
//    * point();
//    * triangle();
//
//The drawing you create should possess all the qualities you would want from any drawing, namely:
//
//    * well thought-out composition
//    * compelling use of form/mass/line
//   * a strong sense of color (if color is used)
//
//
//
//With those restrictions in mind, you have freedom to determine the content of the image you create. 
//Bare one thing in mind: You will literally be ‘drawing’ this image by positioning each element 
//numerically. With this in mind, and given the short amount of time allotted for completing this project, 
//it is perhaps not a great idea to attempt something drastically complicated. You probably won’t 
//have the time to program each vertex of every building of a skyline, for example, so suit your 
//subject matter to the constraints of the project.
//Reading:
//
//The techniques necessary for this assignment are covered on pp. 17-37 of the Processing book. 
//(Structure 1: Code Elements & Shape 1: Coordinates and Primitives).
//
//
//
//What is due: A static processing sketch that has been exported for web, 
//and posted on the web (probably through terpconnect).
//
// DUE: February 9th, beginning of class.
//
//Some Relavent Artists:
//
//    * Frank Stella
//    * Bridget Riley
//    * W.C. Richardson
//    * Patrick Wilson
//    * Julie Gross
//    * Leslie Dumbrell
//    * Edda Jachens
// <http://coplanar.org/489i/assign1.html>

