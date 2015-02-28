
//Assignment 2
//Graham Barrett
//E-Mail: rbarrett@haverford.edu
//Course CS 110 - Section 01
//Submitted: 9/19/2012
//The following code represents the sketch created for Assignment 2
 /* The sketch is a depiction of a wayward ballon drifting through
the sky. Everytime the mouse button is pressed (mousePressed), the
balloon is generated and can be generated as many times possible.
If a key is pressed though (keyPressed), all the drawn balloons
 are erased, and a new background is generated that is filled with
multiple clouds. Once the key is released (keyReleased), the new
background is removed and replaced with the old once again

*/

int positionX = mouseX;
 int positionY = mouseY;

//Set up the background

void setup() {
  size (1000,1000);
  smooth();
  stroke(1);
  background(0,0,120);
   fill(255);

}

void draw() { }

/* draw balloon whevever the mouse is pressed at
 mouseX and mouseY location
*/

void mousePressed() {
    fill(200,0,150);   
  ellipse(mouseX, mouseY, 60 , 75 );
   stroke(0);
  strokeWeight(2);
  line(mouseX, mouseY+37, mouseX,mouseY+130);
}
 
/* Erase drawn balloons and replace it with cloudy
background everytime a key is pressed
*/

void keyPressed() {
  background(0,0,120);
 
  //draw cloud 1
  fill(255);
   ellipse(750,120,100,30);
   ellipse (700,100,100,30);
ellipse (800, 100,100,30);
ellipse(700,130,100,30);
ellipse (800,130,100,30);

// draw cloud 2
fill (255);
ellipse(300,150,100,30);
ellipse(250,130,100,30);
ellipse(350,130,100,30);
 ellipse(250,160,100,30);
ellipse(350,160,100,30);

// draw cloud 3
fill(255);
ellipse(600,420,100,30);
ellipse(550,400,100,30);
ellipse(650,400,100,30);
ellipse(550,430,100,30);
ellipse(650,430,100,30);
 
//draw cloud 4
fill(255);
ellipse(250,770,100,30);
ellipse(200,750,100,30);
ellipse(300,750,100,30);
ellipse(200,780,100,30);
ellipse(300,780,100,30);

//draw cloud 5
fill(255);
ellipse(780,670,100,30);
 ellipse(730,650,100,30);
ellipse(830,650,100,30);
ellipse(730,680,100,30);
ellipse(830,680,100,30);

}






//Reset background after key is released
void keyReleased(){
  background(0,0,120);
//draw cloud 6
    fill(255);
ellipse(780,570,100,30);
ellipse(730,550,100,30);
ellipse(830,550,100,30);
ellipse(730,580,100,30);
ellipse(830,580,100,30);

//draw cloud 7
fill(255);
ellipse(280,670,100,30);
 ellipse(230,650,100,30);
ellipse(330,650,100,30);
ellipse(230,680,100,30);
ellipse(330,680,100,30);

//draw cloud 8
fill(255);
ellipse(500,670,100,30);
ellipse(450,650,100,30);
ellipse(550,650,100,30);
 ellipse(450,680,100,30);
ellipse(550,680,100,30);

//draw cloud 9
fill(255);
ellipse(100,370,100,30);
ellipse(50,350,100,30);
ellipse(150,350,100,30);
ellipse(50,380,100,30);
ellipse(150,380,100,30);
 

//draw cloud 10
fill(255);
ellipse(900,160,100,30);
ellipse(850,140,100,30);
ellipse(950,140,100,30);
ellipse(850,170,100,30);
ellipse(950,170,100,30);

//draw cloud 11
fill(255);
ellipse(130,175,100,30);
 ellipse(80,155,100,30);
ellipse(180,155,100,30);
ellipse(80,185,100,30);
ellipse(180,185,100,30);
}
