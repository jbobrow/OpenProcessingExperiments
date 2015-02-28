
/*
 * Assignment    1
 * Name:         Mfon-ido Ime Akpan
 * E-mail:       makpan@brynmawr.edu
 * Course:       CS 110 - 02
 * Submitted:    1/26/2012
 This is a village scene after sunset. It captures a hut, with a slightly open door, a tree,a quarter of a moon, some fruits, and a fabric hanging on a line.
 It is meant to capture the serenity of the village setting in comparison to the bustle of the city. The slightly opened door makes us curious as to who the occupant of the hut is.
 The cloth hanging on the line convinces us that there is some form of intelligent life around. It creates the sense of someone peeping to see who is going to come out of that door. 
 Therefore i titled the scene 'Hush'
 */
 
void setup ( ) {
  //set up the background of the sketch
 size ( 1100, 650); 
 background (118,107,107, 15);

 }
 
 
void draw ( ) {
  
 //declare variables for grass
int xinc = 500;
int ydec = 120;
 
 //draw a rectangle - body of the hut
  stroke (196, 79, 20);
  fill (196, 79, 20);
  rect ( 40, 150, 520, 400);
 
 // draw the roof of the hut  
 strokeWeight (4);
 stroke (4, 88, 19); 
 line (0, 150, 300, 0);
 line (20, 150, 300, 0);
 line (40, 150, 300, 0);
 line (60, 150, 300, 0);
 line (80,150, 300, 0);
 line (100, 150, 300, 0);
 line (120, 150, 300, 0);
 line (140, 150, 300, 0);
 line (160, 150, 300, 0);
 line (180, 150, 300, 0);
 line (200, 150, 300, 0);
 line (220, 150, 300, 0);
 line (240, 150, 300, 0);
 line (260, 150, 300, 0);
 line (280, 150, 300, 0);
 line (300, 150, 300, 0);
 line (320, 150, 300, 0);
 line (340, 150, 300, 0);
 line (360, 150, 300, 0);
 line (380, 150, 300, 0);
 line (400, 150, 300, 0);
 line (420, 150, 300, 0);
 line (440, 150, 300, 0);
 line (460, 150, 300, 0);
 line (480, 150, 300, 0);
 line (500, 150, 300, 0);
 line (520, 150, 300, 0);
 line (540, 150, 300, 0);
 line (560, 150, 300, 0);
 line (580, 150, 300, 0);
 line (600, 150, 300, 0);
 line (0, 150, 600, 150);
 
   //draw a door
  stroke (0);
  fill (5, 23, 113);  
  rect (160, 400, 150,150 );
  
  //draw a door knob 
  fill (0,0,0);
  rect (270,430, 10, 30);
  
  //draw shadow of interior of hut
  fill (0);
  noStroke ( );
  beginShape ();
  vertex (160, 550 );
  vertex (300, 500 );
  vertex (300, 400 );
  vertex (310, 400 );
  vertex (310, 550);
  vertex (160, 550 );  
  endShape ();
  
  //draw a window
  stroke (0);
  fill (28, 21, 147 );
  rect (390, 270, 130, 120 );
  smooth ();
  line (455, 270, 455, 390);
  fill (0);
  rect (430,310,10, 20);
   rect (475,310, 10, 20);
  
   //draw clothes line  
  stroke (0, 0, 0);
  strokeCap (ROUND);
  fill (255, 255, 255 );
  line (561, 250, 1000, 450);   
  
   //draw tree
  stroke (0);
  fill (0, 0, 0);
  noSmooth ();
  rect (1000,300,30, 650);
  noSmooth ( );
  stroke (4, 121, 18);
  fill (4, 121, 18);
  ellipse (970, 170, 150,120);
  ellipse (1030, 250, 150, 120);
  ellipse (940, 290, 150, 120 );
  ellipse (930, 240, 150, 120);
  ellipse (1080, 190, 150, 120 );
  ellipse (1040, 300, 150, 130 );
 
  //draw fruits on tree
  noStroke ();
  fill (240, 229, 12);
  ellipse (950, 200, 20, 30);
  ellipse (1000, 280, 20, 30);
  ellipse (950, 300, 20, 30);
  ellipse (920, 250, 20, 30);
  ellipse (1050, 310, 20, 30 );
  ellipse (1050, 200, 20, 30 );
  
 //draw cloth hanging on clothes line
  beginShape ();
  fill (247,7, 28);
  stroke (0);
  vertex (720, 320);
  vertex (680, 560);
  vertex (890, 620);
  vertex (900, 400);
  endShape ();
  
  //back of cloth
  beginShape ();
  stroke (0);
  vertex (901, 401);
  vertex (940, 610);
  vertex (890,600);
  endShape (); 
  
  //draw circles on cloth
  fill (255);
  ellipse (760, 369, 50, 60);
  ellipse (750, 440, 50, 60);
  ellipse (830, 400, 50, 60);
  ellipse (830, 475, 50, 60);
  ellipse (750, 520, 50, 60);
  ellipse (830, 550, 50, 60 );
  
  //draw painting on wall of home - a triangle inside a quad
  smooth ();
  stroke (0);
  fill (203, 35, 193);
  quad (240, 230,320, 270, 230, 320, 180, 250);
  fill (0, 200, 0);
  triangle ( 240, 240, 270, 290, 220, 290);
  
  //draw moon
  smooth ();
  noStroke();
  fill (255);
  arc (0, 0, 150, 150, 0, 3/2*PI);
  
  //draw bag of corn
  beginShape ();
  smooth ();
  noStroke ();
  fill (31, 240, 175);
 curveVertex (400, 470);
 curveVertex (450, 520);
 curveVertex (420, 580);
 curveVertex (470, 580);
 curveVertex (440, 520);
 curveVertex (500, 470);
 endShape (CLOSE); 
 
 //draw lemon grass infront of and beside hut
 noSmooth ();
 fill (0,255, 0);
 curve (150,393, 45, 447, 100, 640, 297, 469);
 curve (150, 393, 90, 439, 110, 634, 297, 469);
 curve (89, 302, 100, 389, 114, 628, 49, 481);
 curve (95, 290, 110, 370, 119, 635, 55, 484);
 curve (100, 295, 123, 626,138, 452, 60, 480); 
 curve (xinc+150, 393-90, xinc+45, 447-90, xinc+100, 640-90, xinc+297, 469-90);
 curve (xinc+150, 393-90, xinc+90, 439-90, xinc+110, 634-90, xinc+297, 469-90);
 curve (xinc+89, 302-90,xinc+100, 389-90, xinc+114, 628-90, xinc+49, 481-90);
 curve (xinc+95, 290-90, xinc+110, 370-90,xinc+ 119, 635-90, xinc+55, 484-90);
 curve (xinc+100, 295-90, xinc+123, 626-90, xinc+138, 452-90,xinc+60, 480-90);
 
 //draw hanger for painting on the wall
 stroke (0);
 smooth ();
 line (209, 239, 238, 183);
 line (266, 241, 238, 183);
 
 //draw birds
 noStroke ();
 fill (211, 193, 28);
 ellipse (717, 69, 30, 20);
 ellipse (765, 69, 30, 20);
 fill (234, 19, 84);
 ellipse (714,69,5, 5);
 ellipse (759,69, 5, 5);
 ellipse (701, 68, 12, 12);
 ellipse (748, 67, 12, 12);
 triangle (732,66,737, 60,738,77);
 triangle (788,59,790,75,780, 68);
 triangle (769, 65,757, 91,777, 91);
 triangle (721, 69,706, 91,727, 89);
 
 //draw millet seeds on ground
 fill (234, 55, 19);
 ellipse (457, 600, 10, 10);
 ellipse (465, 605, 10, 10);
 ellipse (475,610, 10, 10);
 ellipse (480, 590, 10, 10);
 ellipse (415, 590,10,10);
 
  }
 


