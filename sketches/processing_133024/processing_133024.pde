
int topX;
int topY;
 
void setup() {  //setup function called initially, only once
  size(550, 800);
  topX = 100;
  topY = height/2; 
}
 
void draw() {  
  background(222, 208, 197);
  //small vertical rect
  noStroke();
  fill(69, 68, 155);  
   rectMode(CENTER);
   rect(265, topY, 20, 100);
 
    //move down
 topY++;
 
 //arrow line
 stroke(51);
line(200, topY, 450, topY);
topY++;

//triangle
fill(51);
triangle(450, topY, 475, topY, 450, topY);
topY++;

//black small rect
fill(51);
rect(325, topY, 50, 10);
topY++;

//horizontal black rect
fill(51);
rect(325, topY, 50, 10);
topY++;

 
//white rect
noStroke();
fill(255);
rect(300, topY, 25, 625);
topY++;


//black rect 
fill(51);
rect(285, topY, 15, 675);
topY++;


//diagonal line
stroke(51);
line(500, topY, 100, topY);
topY++;
 
//diagonal tip
stroke(51);
line(75, topY, 125, topY);
topY++;
 
//square
noStroke();
fill(173, 30, 35);
rect(325, topY, 40, 40);
topY++;


//red ellipse 
noStroke();
fill(122, 19, 29);
ellipse(300, topY, 300, 250);
topY++;
 
//top circle
noStroke();
fill(231, 113, 36);
ellipse(100, topY, 30, 30);
topY++;

//bottom circle 
noStroke();
ellipse(100, topY, 30, 30);
topY++;
}
 
 /*topY= topY +*/ 
 
 



