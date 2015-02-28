
/* Assignment #1
 * Name: Justin Wei        
 * E-mail: jwei@haverford.edu
 * Course: CS 110 - Section #2
 * Submitted: 1/26/12
 
 *I used various drawing primitives to complete my rendering of two 
 popular optical illusions. I used mostly rectanges of various grayscale
colors to make the illusion on the left. On the right side, I used ellipses
and a quadrilateral to form another illusion. To form the letters, I used
a combination of arcs, bezier curves, and lines. I found curves to be
the hardest shapes to implement.*/
 
void setup() {
  size(1200, 700);
  background(255);
}

void draw() {
//outline/border of left side's optical illusion
  rectMode(CORNER);
  stroke(180);
  strokeWeight(2.0);
  smooth();
  fill(180);
  rect(50, 50, 570, 500);  


//draw first square using beginShape/endShape
  fill(0);
  beginShape(); 
  vertex(60, 50); 
  vertex(110, 50); 
  vertex(110, 100); 
  vertex(60, 100); 
  endShape(CLOSE);

//continue first row of squares
  rectMode(CORNER);
  fill(255);
  rect(110, 50, 50, 50);
  fill(0);
  rect(160, 50, 50, 50);
  fill(255);
  rect(210, 50, 50, 50);
  fill(0);
  rect(260, 50, 50, 50);
  fill(255);
  rect(310, 50, 50, 50);
  fill(0);
  rect(360, 50, 50, 50);
  fill(255);
  rect(410, 50, 50, 50);
  fill(0);
  rect(460, 50, 50, 50);
  fill(255);
  rect(510, 50, 50, 50);
  fill(0);
  rect(560, 50, 50, 50);

//first separation (line in between rows)
  stroke(180);
  line(50, 100, 620, 100);
  smooth();
  strokeWeight(1.5);
  strokeCap(ROUND);
  
//second row of squares
  fill(0);
  beginShape(); 
  vertex(50, 100); 
  vertex(100, 100); 
  vertex(100, 150); 
  vertex(50, 150); 
  endShape(CLOSE);
  
  rectMode(CORNER);
  fill(255);
  rect(100, 100, 50, 50);
  fill(0);
  rect(150, 100, 50, 50);
  fill(255);
  rect(200, 100, 50, 50);
  fill(0);
  rect(250, 100, 50, 50);
  fill(255);
  rect(300, 100, 50, 50);
  fill(0);
  rect(350, 100, 50, 50);
  fill(255);
  rect(400, 100, 50, 50);
  fill(0);
  rect(450, 100, 50, 50);
  fill(255);
  rect(500, 100, 50, 50);
  fill(0);
  rect(550, 100, 50, 50);
  
//second separation
  stroke(180);
  line(50, 150, 620, 150);
  smooth();
  strokeWeight(1.5);
  strokeCap(ROUND);

//third row of squares
  fill(0);
  beginShape(); 
  vertex(60, 150); 
  vertex(110, 150); 
  vertex(110, 200); 
  vertex(60, 200); 
  endShape(CLOSE);
  
  rectMode(CORNER);
  fill(255);
  rect(110, 150, 50, 50);
  fill(0);
  rect(160, 150, 50, 50);
  fill(255);
  rect(210, 150, 50, 50);
  fill(0);
  rect(260, 150, 50, 50);
  fill(255);
  rect(310, 150, 50, 50);
  fill(0);
  rect(360, 150, 50, 50);
  fill(255);
  rect(410, 150, 50, 50);
  fill(0);
  rect(460, 150, 50, 50);
  fill(255);
  rect(510, 150, 50, 50);
  fill(0);
  rect(560, 150, 50, 50);
  
//third separation
  stroke(180);
  line(50, 200, 620, 200);
  smooth();
  strokeWeight(1.5);
  strokeCap(ROUND);  
  
//fourth row of squares
  fill(0);
  beginShape(); 
  vertex(70, 200); 
  vertex(120, 200); 
  vertex(120, 250); 
  vertex(70, 250); 
  endShape(CLOSE);
  
  rectMode(CORNER);
  fill(255);
  rect(120, 200, 50, 50);
  fill(0);
  rect(170, 200, 50, 50);
  fill(255);
  rect(220, 200, 50, 50);
  fill(0);
  rect(270, 200, 50, 50);
  fill(255);
  rect(320, 200, 50, 50);
  fill(0);
  rect(370, 200, 50, 50);
  fill(255);
  rect(420, 200, 50, 50);
  fill(0);
  rect(470, 200, 50, 50);
  fill(255);
  rect(520, 200, 50, 50);
  fill(0);
  rect(570, 200, 50, 50);
  
//fourth separation
  stroke(180);
  line(50, 250, 620, 250);
  smooth();
  strokeWeight(1.5);
  strokeCap(ROUND);  
  
//fifth row of squares
  fill(0);
  beginShape(); 
  vertex(60, 250); 
  vertex(110, 250); 
  vertex(110, 300); 
  vertex(60, 300); 
  endShape(CLOSE);
  
  rectMode(CORNER);
  fill(255);
  rect(110, 250, 50, 50);
  fill(0);
  rect(160, 250, 50, 50);
  fill(255);
  rect(210, 250, 50, 50);
  fill(0);
  rect(260, 250, 50, 50); 
  fill(255);
  rect(310, 250, 50, 50);
  fill(0);
  rect(360, 250, 50, 50);
  fill(255);
  rect(410, 250, 50, 50);
  fill(0);
  rect(460, 250, 50, 50);
  fill(255);
  rect(510, 250, 50, 50);
  fill(0);
  rect(560, 250, 50, 50);
  
//fifth separation
  stroke(180);
  line(50, 300, 620, 300);
  smooth();
  strokeWeight(1.5);
  strokeCap(ROUND);  
  
//sixth row of squares
  fill(0);
  beginShape(); 
  vertex(50, 300); 
  vertex(100, 300); 
  vertex(100, 350); 
  vertex(50, 350); 
  endShape(CLOSE);
  
  rectMode(CORNER);
  fill(255);
  rect(100, 300, 50, 50);
  fill(0);
  rect(150, 300, 50, 50);
  fill(255);
  rect(200, 300, 50, 50);
  fill(0);
  rect(250, 300, 50, 50);
  fill(255);
  rect(300, 300, 50, 50);
  fill(0);
  rect(350, 300, 50, 50);
  fill(255);
  rect(400, 300, 50, 50);
  fill(0);
  rect(450, 300, 50, 50);
  fill(255);
  rect(500, 300, 50, 50);
  fill(0);
  rect(550, 300, 50, 50);
  
//sixth separation
  stroke(180);
  line(50, 350, 620, 350);
  smooth();
  strokeWeight(1.5);
  strokeCap(ROUND);  
  
//seventh row of squares
  fill(0);
  beginShape(); 
  vertex(60, 350); 
  vertex(110, 350); 
  vertex(110, 400); 
  vertex(60, 400); 
  endShape(CLOSE);
  
  rectMode(CORNER);
  fill(255);
  rect(110, 350, 50, 50);
  fill(0);
  rect(160, 350, 50, 50);
  fill(255);
  rect(210, 350, 50, 50);
  fill(0);
  rect(260, 350, 50, 50);  
  fill(255);
  rect(310, 350, 50, 50);
  fill(0);
  rect(360, 350, 50, 50);
  fill(255);
  rect(410, 350, 50, 50);
  fill(0);
  rect(460, 350, 50, 50);
  fill(255);
  rect(510, 350, 50, 50);
  fill(0);
  rect(560, 350, 50, 50);
  
//seventh separation
  stroke(180);
  line(50, 400, 620, 400);
  smooth();
  strokeWeight(1.5);
  strokeCap(ROUND);  
  
//eighth row of squares
  fill(0);
  beginShape(); 
  vertex(70, 400); 
  vertex(120, 400); 
  vertex(120, 450); 
  vertex(70, 450); 
  endShape(CLOSE);
  
  rectMode(CORNER);
  fill(255);
  rect(120, 400, 50, 50);
  fill(0);
  rect(170, 400, 50, 50);
  fill(255);
  rect(220, 400, 50, 50);
  fill(0);
  rect(270, 400, 50, 50);
  fill(255);
  rect(320, 400, 50, 50);
  fill(0);
  rect(370, 400, 50, 50);
  fill(255);
  rect(420, 400, 50, 50);
  fill(0);
  rect(470, 400, 50, 50);
  fill(255);
  rect(520, 400, 50, 50);
  fill(0);
  rect(570, 400, 50, 50);
  
//eighth separation
  stroke(180);
  line(50, 450, 620, 450);
  smooth();
  strokeWeight(1.5);
  strokeCap(ROUND);  
  
//ninth row of squares
  fill(0);
  beginShape(); 
  vertex(60, 450); 
  vertex(110, 450); 
  vertex(110, 500); 
  vertex(60, 500); 
  endShape(CLOSE);
  
  rectMode(CORNER);
  fill(255);
  rect(110, 450, 50, 50);
  fill(0);
  rect(160, 450, 50, 50);
  fill(255);
  rect(210, 450, 50, 50);
  fill(0);
  rect(260, 450, 50, 50);
  fill(255);
  rect(310, 450, 50, 50);
  fill(0);
  rect(360, 450, 50, 50);
  fill(255);
  rect(410, 450, 50, 50);
  fill(0);
  rect(460, 450, 50, 50);
  fill(255);
  rect(510, 450, 50, 50);
  fill(0);
  rect(560, 450, 50, 50);
  
//ninth separation
  stroke(180);
  line(50, 500, 620, 500);
  smooth();
  strokeWeight(1.5);
  strokeCap(ROUND);  
  
//tenth row of squares
  fill(0);
  beginShape(); 
  vertex(50, 500); 
  vertex(100, 500); 
  vertex(100, 550); 
  vertex(50, 550); 
  endShape(CLOSE);
  
  rectMode(CORNER);
  fill(255);
  rect(100, 500, 50, 50);
  fill(0);
  rect(150, 500, 50, 50);
  fill(255);
  rect(200, 500, 50, 50);
  fill(0);
  rect(250, 500, 50, 50);
  fill(255);
  rect(300, 500, 50, 50);
  fill(0);
  rect(350, 500, 50, 50);
  fill(255);
  rect(400, 500, 50, 50);
  fill(0);
  rect(450, 500, 50, 50);
  fill(255);
  rect(500, 500, 50, 50);
  fill(0);
  rect(550, 500, 50, 50);


//circles of right side's optical illusion
  
  noFill();
  ellipseMode(CENTER);
  stroke(0);
  strokeWeight(4.0);
  smooth();
  ellipse(925, 310, 50, 50);
  ellipse(925, 310, 75, 75);
  ellipse(925, 310, 100, 100);
  ellipse(925, 310, 125, 125);
  ellipse(925, 310, 150, 150); 
  ellipse(925, 310, 175, 175);
  ellipse(925, 310, 200, 200);
  ellipse(925, 310, 225, 225);
  ellipse(925, 310, 250, 250); 
  ellipse(925, 310, 275, 275);
  ellipse(925, 310, 300, 300);
  ellipse(925, 310, 325, 325);
  ellipse(925, 310, 350, 350); 
  ellipse(925, 310, 375, 375);
  ellipse(925, 310, 400, 400);
  ellipse(925, 310, 425, 425);
  ellipse(925, 310, 450, 450); 
  ellipse(925, 310, 475, 475);
  ellipse(925, 310, 500, 500);

//square (inside of circles)
  noFill();
  stroke(200,0,255);
  strokeWeight(5.0);
  smooth();
  quad(1100,122, 750,122, 750,485, 1100,485);

//word "Optical" using a mix of lines, ellipses, and arcs.
  stroke(0);
  strokeWeight(2.0);
  smooth();
  ellipse(150,601,25,40);
  line(170,600, 170,640);
  arc(177,613, 25,25, 4.2,8.4);
  line(200,585, 200,624);
  line(190,600, 210,600);
  line(218,603, 218,624);
  ellipse(218,592, 2,2);
  arc(237,613, 25,25,.7,5.5);
  arc(265,614, 24,24, .8,5.3);
  line(274,600,274,626);
  line(285,578, 285,626);
  
//word "Illusions" using a mix of lines, ellipses, and bezier curves.
  line(333,578, 333,626);
  line(325,578, 341,578);
  line(325,626, 341,626);
  line(352,578, 352,626);
  line(363,578, 363,626);
  bezier(374,601, 370,633, 397,633, 393,601);
  line(393,601, 393, 626);
  bezier(415,610, 400,605, 401,600, 419,601); 
  bezier(415,610, 428,615, 424,633, 406,623);
  line(434,603, 434,625);
  ellipse(434,592, 2,2);
  ellipse(452,614, 16,24);
  line(468,603, 468,626);
  bezier(468,626, 466,598, 486,598, 483,626);
}

