
/*
 Konkuk University
 SOS iDesign
 
 Name: Da Eun Lee
 ID: 201420095 LEE Daeun
 
 */

PImage img;

int a = 130;
int  b= 180; 
int c = 215; 
int d= 600; 
int e = 100; 
int f = 340; 
int g = 200; 
int h = 285; 
int i= 330; 


void setup() {
  size (600, 600);
  //noLoop();
  smooth(500);
  img = loadImage ("sdg.jpg");
  background(67,39,49);
  

  
}

void draw() {

  println(mouseX + " : " + mouseY);

  //image (img, 0, 0);


stroke(0); 
strokeWeight(2); 
line(328, 40, 355, 88); 
line(335, 37, 362, 84); 
line(342, 31, 368, 79); 
line(348, 27, 376, 74); 
line(355, 22, 383, 71); 
line(360, 17, 389, 67); 
strokeWeight(1); 
line(478, 77, 507, 120); 
line(482, 72, 511, 116); 
line(488, 69, 515, 113); 
line(493, 66, 520, 110); 
line(498, 62, 525, 107); 
line(502, 60, 528, 104); 

  fill(mouseX, mouseY-30, mouseX, mouseY+30);
  ellipse(238, 206, 260, 260);

  fill(39, 12, 59);
  ellipse(212, 180, 171, 171);

  fill(247, 228, 127);
  ellipse(52, 42, 21, 21);

  fill(252,133,241);
  ellipse(66, 101, 41, 41);

  fill(217, 161, 252);
  strokeWeight(2);
  ellipse(72, 308, 61, 61);

  fill(244, 252, 125);
  ellipse(52, 45, 19, 19);

  fill(41, 12, 59);
  ellipse(81, 294, 18, 18);

  fill(247, 124, 250);
  ellipse(75, 427, 16, 16);

  fill(239, 250, 124);
  ellipse(68, 470, 5, 5);

  fill(144, 119, 250);
  ellipse(104, 454, 29, 29);

  fill(255, 255, 98,100);
  noStroke();
  ellipse(106, 366, 44, 44);

  fill(245, 59, 59, 100);
  noStroke();
  ellipse(131, 370, 41, 41);

  fill(240, 125, 9, 100);
  noStroke();
  ellipse(155, 370, 43, 43);


  fill(240, 125, 97, 100);
  noStroke();
  ellipse(163, 340, 43, 43);

  fill(255,194,129, 10);
  noStroke();
  ellipse(136, 316, 43, 43);

  fill(222, 179, 250, 100);
  noStroke();
  ellipse(235, 324, 51, 51);

  fill(0);
  noStroke();
  ellipse(127, 124, 3, 3);

  fill(240, 114, 250, 100);
  noStroke();
  ellipse(169, 310, 5, 5);

  fill(0);
  noStroke();
  ellipse(225, 393, 5, 5);

  fill(250, 182, 114, 100);
  noStroke();
  ellipse(319, 278, 75, 75);

  fill(116, 255, 231, 100);
  noStroke();
  ellipse(299, 228, 46, 46);

  fill(195, 133, 227, 100);
  noStroke();
  ellipse(260, 241, 20, 20);

  fill(227, 124, 217, 100);
  noStroke();
  ellipse(293, 112, 62, 62);

  fill(141, 133, 234, 100);
  noStroke();
  ellipse(396, 167, 90, 90);

  fill(41, 17, 57);
  noStroke();
  ellipse(397, 164, 20, 20);

  fill(255, 246, 144, 100);
  noStroke();
  ellipse(404, 89, 40, 40);

  fill(255, 207, 49, 70);
  noStroke();
  ellipse(461, 115, 22, 22);

  fill(255, 91, 31, 70);
  noStroke();
  ellipse(492, 72, 15, 15);

  fill(110, 25, 209, 70);
  noStroke();
  ellipse(502, 277, 20, 20);

  fill(233, 219, 255, 50);
  noStroke();
  ellipse(463, 396, 100, 100);

  fill(222, 210, 161, 50);
  noStroke();
  ellipse(405, 369, 32, 32);

  fill(252, 99, 145);
  noStroke();
  ellipse(469, 350, 10, 10);

  fill(111, 0, 160);
  noStroke();
  ellipse(481, 352, 4, 4);

  fill(252, 243, 135);
  noStroke();
  ellipse(522, 392, 16, 16);

  fill(252, 243, 135);
  noStroke();
  ellipse(446, 457, 14, 14);

  fill(227, 73, 46, 50);
  noStroke();
  ellipse(432, 489, 11, 11);

  fill(129, 70, 232);
  noStroke();
  ellipse(494, 509, 20, 20);
  
  fill(147,194,255,100);
  ellipse(438,378,25,25);
  
  fill(71,138,191,100);
  ellipse(319,343,72,72);
  
  fill(240,51,152,100);
  ellipse(348,296,25,25);
  
  fill(26,3,15,100);
  ellipse(333,304,2,2);
  
  //plus
  fill(72,162,255,150);
  noStroke();
   ellipse(mouseX, 0, mouseX-10, 0);
 
noStroke(); 
fill(0); 
ellipse(120, 330, 35, 35); 
noFill(); 
stroke(210, 107, 74); 
strokeWeight(8); 
ellipse(h, i, 250, 250); 
fill(212, 219, 237); 
stroke(225, 185, 53); 
ellipse(h,i, 175, 175); 
fill(0); 
stroke(0); 
strokeWeight(3); 
ellipse(h,i, 75, 75); 


fill(44, 81, 74); 
quad(a, b, 175, 150, 380, 600, c, d); 
fill(183, 114, 41); 
noStroke(); 
quad(0, 600, 0, 265, a, b, c, d); 
stroke(0); 
strokeWeight(10); 
strokeCap(SQUARE); 
noFill(); 
arc(122, 30, 160, 160, PI-.5, PI+1); 

stroke(141, 150, 97); 
strokeWeight(3); 
fill(141, 150, 97); 
triangle(-10, 20, 15, -10, 400, 235); 

stroke(255, 236, 53); 
strokeWeight(8); 
line(-5, 165, 225, -5); 


fill(0); 
noStroke(); 
triangle(-10, 5, 15, -10, 390, 225); 

stroke(0); 
strokeWeight(8); 
line(-5, 160, 215, -5); 

stroke(0); 
strokeWeight(8); 
strokeCap(ROUND); 
line(c, d, 75, 0); 

stroke(191, 60, 58, 200); 
strokeWeight(10); 
strokeCap(SQUARE); 
noFill(); 
arc(120, 30, 160, 160, PI-.5, PI+1); 


stroke(191, 60, 58); 
strokeWeight(10); 
strokeCap(SQUARE); 
noFill(); 
arc(-5, 120, 160, 160, PI, 5.5); 

stroke(0); 
strokeWeight(4); 
strokeCap(ROUND); 
line(0, 80, 90, 0); 

stroke(0); 
strokeWeight(4); 
line(0, 20, 25, 0); 

stroke(0, 0, 0, 200); 
strokeWeight(10); 
strokeCap(SQUARE); 
noFill(); 
arc(-5, 125, 160, 160, PI, 5.5); 

stroke(0); 
strokeWeight(3); 
fill(255); 
arc(h,i, 75, 75, 1, 4.2); 

strokeWeight(4); 
fill(199, 48, 42); 
quad(330, 485, 645, 250, 645, 270, 375, 485); 

stroke (0); 
fill(0); 
ellipse(e, f, 220, 220); 


stroke(32, 72, 143); 
strokeWeight(15); 
strokeCap(SQUARE); 
arc(e, f, g, g, 4.1, 5.05); 
arc(e, f, g, g, 1, 2.5); 
stroke(91, 125, 186); 
arc(e, f, g,g, -.3, .2); 


stroke(235, 211, 102); 
strokeWeight(15); 
arc(e, f,g,g, 2.9, 3.3); 
arc(e, f, g, g, -.6, -.45); 


stroke(0); 
strokeWeight(15); 
arc(e,f,g,g, 4.35, 4.55); 
arc(e,f,g,g, 1.5, 2); 


  
stroke(255); 
strokeWeight(15); 
arc(e,f,g,g, 4.4, 4.425); 
arc(e,f,g,g, 4.475, 4.5); 
arc(e,f,g,g, 1.57, 1.61); 


arc(e,f,g,g, 1.67, 1.71); 


arc(e,f,g,g, 1.77, 1.81); 


arc(e,f,g,g, 1.87, 1.91); 


stroke(0); 


strokeWeight(8); 


strokeCap(ROUND); 


line(320, 45, 595, 490); 


line(320, 45, 385, -5); 


strokeWeight(6); 


fill(255); 


quad(320, 45, 365, 12, 485, 205, 440, 237); 


quad(365, 12, 555, 315, 580, 295, 405, -15); 


quad(405, -20, 600, 280, 625, 260, 450, -50); 


strokeCap(SQUARE); 


strokeWeight(10); 


line(495, 130, 430, 25); 


strokeCap(ROUND); 


strokeWeight(8); 


quad(450, -50, 500, -100, 680, 215, 625, 260); 


triangle(500, -100, 570, 16, 593, 0); 


line(350, 95, 485, 8); 


line(380, 140, 510, 55); 


line(410, 190, 535, 101); 


fill(0); 


quad(386, 142, 420, 115, 450, 155, 410, 185); 


quad(455, 155, 485, 135, 515, 180, 490, 205); 


quad(509, 350, 555, 315, 565, 330, 520, 365); 


quad(580, 295, 600, 280, 610, 295, 590, 310); 


quad(522, 157, 550, 140, 565, 152, 535, 175); 


triangle(630, 260, 640, 275, 640, 250); 


strokeWeight(20); 


strokeCap(SQUARE); 


line(420, 380, 645, 450); 


  


//black color arc 


noFill(); 


stroke(0); 


strokeWeight(6); 


strokeCap(SQUARE); 


arc(602, 247, 240, 240, 4, 4.35); 


  


//orange  and yellow quads 


stroke(0); 


strokeWeight(4); 


strokeCap(ROUND); 


fill(175, 151, 66); 


quad(580, 295, 590, 310, 565, 330, 555, 315); 


quad(600, 280, 610, 295, 635, 275, 625, 260); 


fill(200, 114, 53); 


quad(570, 16, 650, 160, 650, 95, 595, 0); 


quad(610, 295, 635, 275, 642, 290, 642, 345); 


quad(565, 330, 590, 310, 645, 405, 645, 445); 


quad(487, 205, 515, 185, 580, 295, 555, 315); 


quad(565, 152, 535, 175, 600, 280, 625, 260); 


  


//blue circle 


noStroke(); 


fill(11, 100, 166, 200); 


ellipse(600, 245, 240, 240); 


  


//line redraw 


stroke(0); 


strokeWeight(6); 


line(630, 125, 640, 145); 


strokeWeight(4); 


line(440, 237, 590, 135); 


line(475, 190, 640, 440); 


line(497, 150, 640, 395); 


line(510, 140, 640, 345); 


line(547, 120, 640, 285); 


line(505, 350, 625, 260); 


line(520, 370, 635, 275); 


  


//light blue circle 


strokeWeight(3); 


fill(212, 219, 237); 


ellipse(e, f, 180, 180); 


  


//small white circle 


stroke(237, 228, 213); 


strokeWeight(1); 


fill(255); 


ellipse(120, 330, 40, 40); 


  


//small black circles 


noStroke(); 


fill(0); 


ellipse(120, 330, 35, 35); 


  


//red triangles 


stroke(215, 43, 33); 


strokeWeight(2); 


fill(215, 43, 33); 


triangle(135, 295, 237, 175, 250, 185); 


triangle(85, 317, 0, 275, 0, 295); 


  


//white quads on triangles 


stroke(255); 


strokeWeight(2); 


fill(255); 


quad(170, 255, 196, 222, 203, 230, 175, 260); 


triangle(10, 280, 0, 295, 0, 275); 


  


//black stroke circle 


stroke (0); 


strokeWeight(6); 


noFill(); 


ellipse(e,f, 220, 220); 


  


//other red triangle & white quad 


stroke(215, 43, 33); 


strokeWeight(2); 


fill(215, 43, 33); 


triangle(150, 365, 260, 480, 240, 480); 


stroke(255); 


fill(255); 


quad(192, 410, 252, 472, 240, 480, 188, 413); 


  


//black quads on triangels 


noStroke(); 


fill(0); 


quad(250, 160, 315, 75, 335, 100, 265, 172); 


quad(232, 475, 230, 470, 243, 462, 247, 465); 


triangle(240, 480, 254, 472, 263, 480); 


  
   stroke (0); //big black square 


  fill(0); 


  quad(270,320,250,360,310,410,330,380); 


    


  stroke (0); //big white square 


  fill(255); 


  quad(250,360,235,390,270,430,310,410); 


    


  stroke (0); //green square 


  fill(27,63,12); 


  quad(235,390,210,430,300,410,260,410); 


    


  stroke (0); //white triangle in bottom 


  fill(255); 


  quad(330,380,310,410,350,420,360,410); 


    


  stroke (0);  


  fill(0); 


  quad(340,365,330,380,360,410,375,395); 


    


  stroke (0); //white square between 2 black squares 


  strokeWeight(2); 


  fill(255); 


  quad(350,352,340,365,375,395,385,382); 


    


  stroke (0); //black corner diamond 


  strokeWeight(0); 


  fill(0); 


  quad(365,330,349,352,386,383,405,370); 


    


  stroke (0); //small triangle 1 


  fill(255); 


  triangle(376,394,358,410,400,410); 


    


  stroke (0); //small black diamond 


  fill(0); 


  quad(385,382,375,395,388,405,398,394); 


    


  stroke (0); //large white diamond 


  strokeWeight(1);  


  fill(255); 


  quad(452,310,385,382,395,391,458,318); 


    


  strokeWeight(1.5); 


  line (400,367,409,375); 


  line (428,335,437,343); 


    


  stroke (0);  


  fill(0); 


  quad(470,290,452,310,458,318,476,298); 


    


  stroke (0); //small triangle 2 


  fill(255); 


  triangle(396,394,378,410,420,410); 


    


  stroke (0); //brown diamond 


  strokeWeight(1);  


  fill(128,64,0); 


  quad(410,375,395,391,408,403,422,387); 


    


  stroke (0); //white lower 


  strokeWeight(1);  


  fill(255); 


  quad(437,343,410,375,422,387,449,355); 


    


  stroke (0); //black lower 


  fill(0); 


  quad(458,319,437,343,449,355,469,332); 


    


  stroke (0); //white small near corner 


  strokeWeight(1);  


  fill(255); 


  quad(477,298,458,319,469,332,487,309); 


    


  stroke (0); //black small near corner 


    fill(0); 


  quad(495,275,477,298,487,309,505,285); 


    


  strokeWeight(2); 


  line (495,275,500,268 );



}

