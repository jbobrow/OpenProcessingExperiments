
// Mondarian Mega Man
// by Daniel Jovanov, January 15, 2013

int dimension = 30;

// Set up old-school resolution for canvas sketch
// Jan 15
void setup() {
  //size(640, 480);
  // UPDATE: change the resolution to be more square-like
  // Jan 16
  size(480, 480);
} 

/*
Make an object that draws squares and places them
according to coordinates on the sketch canvas, which I
divided into a 16 X 16 square (broken into 30 X 30 pixel squares), 
and have them denoted by parameters a and b, each taking a number
from 0 to 15. The parameters r, g and x take a number from 0 
to 255 in order to color the square.

Jan 15
*/
void drawSquare(int r, int g, int x, int a, int b) {
  fill(r,g,x); 
  rect(dimension*a, dimension*b, dimension, dimension);
} //drawSquare(r,g,x,a,b)

/*
Make an object that draws lines and places them according
to coordinates on the sketch canvas, which I divided into a
16 X 16 square, and have them denoted by parameters a,
which takes a number from 1 to 15. (0 and 16 give no 
visible line.)

Jan 15
*/
void gridLineHor(int a) { // horizontal lines
  line(0, dimension*a, 480, dimension*a);
} //gridLineHor(a)

void gridLineVer(int a) { // vertical ines
  line(dimension*a, 0, dimension*a, 480);
} //gridLineVer(a)
/*
Take drawSquare() and gridLine(), and make the main draw() 
function use it.

Jan 15
*/
void draw() {
  background(255,255,255);
  // make grid
  // Jan 16
  
  // Horizontal lines
  gridLineHor(1);
  gridLineHor(2);
  gridLineHor(3);
  gridLineHor(4);
  gridLineHor(5);
  gridLineHor(6);
  gridLineHor(7);
  gridLineHor(8);
  gridLineHor(9);
  gridLineHor(10);
  gridLineHor(11);
  gridLineHor(12);
  gridLineHor(13);
  gridLineHor(14);
  gridLineHor(15);
  
  // Vertical lines
  gridLineVer(1);
  gridLineVer(2);
  gridLineVer(3);
  gridLineVer(4);
  gridLineVer(5);
  gridLineVer(6);
  gridLineVer(7);
  gridLineVer(8);
  gridLineVer(9);
  gridLineVer(10);
  gridLineVer(11);
  gridLineVer(12);
  gridLineVer(13);
  gridLineVer(14);
  gridLineVer(15);
  
  // top of head
  // Jan 15
  drawSquare(0,0,0,6,0);
  drawSquare(0,0,0,7,0);
  drawSquare(0,0,0,8,0);
  drawSquare(0,0,0,9,0);
  
  // connect to left of head
  // Jan 16
  drawSquare(0,0,0,6,1);
  drawSquare(0,0,0,5,1);
  drawSquare(0,0,0,4,1);
  
  drawSquare(0,0,0,3,2);
  drawSquare(0,0,0,2,3);
  drawSquare(0,0,0,1,4);
  drawSquare(0,0,0,1,5);
  drawSquare(0,0,0,1,6);
  
  // left of head
  // Jan 15
  drawSquare(0,0,0,0,7);
  drawSquare(0,0,0,0,8);
  drawSquare(0,0,0,0,9);
  
  //fill(255,255,255); // white
  ellipse(45,255,30,90); // left ear
  
  // connect to bottom of head
  // Jan 16
  drawSquare(0,0,0,1,10);
  drawSquare(0,0,0,2,10);
  drawSquare(0,0,0,2,11);
  
  drawSquare(0,0,0,2,12);
  drawSquare(0,0,0,3,13);
  drawSquare(0,0,0,4,14);
  
  // bottom of head
  // Jan 16
  drawSquare(0,0,0,5,15);
  drawSquare(0,0,0,6,15);
  drawSquare(0,0,0,7,15);
  drawSquare(0,0,0,8,15);
  drawSquare(0,0,0,9,15);
  drawSquare(0,0,0,10,15);
  
  // connect to right of head
  // Jan 16
  drawSquare(0,0,0,11,14);
  drawSquare(0,0,0,12,13);
  drawSquare(0,0,0,13,12);
  
  drawSquare(0,0,0,13,11);
  drawSquare(0,0,0,13,10);
  drawSquare(0,0,0,14,10);
  
  // right of head
  // Jan 16
  drawSquare(0,0,0,15,7);
  drawSquare(0,0,0,15,8);
  drawSquare(0,0,0,15,9);
  
  //fill(255,255,255);
  ellipse(435,255,30,90);
  
  // connect back to top of head
  // Jan 16
  drawSquare(0,0,0,14,6);
  drawSquare(0,0,0,14,5);
  drawSquare(0,0,0,14,4);
  
  drawSquare(0,0,0,13,3);
  drawSquare(0,0,0,12,2);
  drawSquare(0,0,0,11,1);
  
  drawSquare(0,0,0,10,1);
  drawSquare(0,0,0,9,1);
  
  // eyes
  // Jan 16
  drawSquare(0,0,0,5,9);
  drawSquare(0,0,0,5,10);
  drawSquare(0,0,0,6,9);
  drawSquare(0,0,0,6,10);
  
  drawSquare(0,0,0,9,9);
  drawSquare(0,0,0,9,10);
  drawSquare(0,0,0,10,9);
  drawSquare(0,0,0,10,10);
  
  // UPDATE: When using the Javascript version, drawing the fol-
  // lowing arcs causes all of the colored squares to disappear
  //fill(0,0,255);
  //arc(180,300,60,60,0,PI+HALF_PI,PIE);
  //arc(300,300,60,60,0,PI+HALF_PI,PIE);
  
  // mouth--hot pink color
  // Jan 16
  drawSquare(255,0,60,5,12);
  drawSquare(255,0,60,6,12);
  drawSquare(255,0,60,7,12);
  drawSquare(255,0,60,8,12);
  drawSquare(255,0,60,9,12);
  drawSquare(255,0,60,10,12);
  
  drawSquare(255,0,60,6,13);
  drawSquare(255,0,60,7,13);
  drawSquare(255,0,60,8,13);
  drawSquare(255,0,60,9,13);
  
  // others
  // Jan 16
  drawSquare(0,0,0,2,9);
  drawSquare(0,0,0,2,8);
  drawSquare(0,0,0,2,7);
  
  drawSquare(0,0,0,3,7);
  drawSquare(0,0,0,4,6);
  drawSquare(0,0,0,5,6);
  
  drawSquare(0,0,0,6,7);
  drawSquare(0,0,0,7,8);
  drawSquare(0,0,0,8,8);
  
  drawSquare(0,0,0,9,7);
  drawSquare(0,0,0,10,6);
  drawSquare(0,0,0,11,6);
  
  drawSquare(0,0,0,12,7);
  drawSquare(0,0,0,13,7);
  drawSquare(0,0,0,13,8);
  drawSquare(0,0,0,13,9);
  
  // blue color
  drawSquare(0,0,120,7,4);
  drawSquare(0,0,120,8,4);
  
  fill(0,0,255);
  triangle(210,150,270,150,240,180);
  
  /*
  After I made the basic shape and added some features, I then
  color each of the other squares in the haed with a different
  color similar to how Mondrian fills in some of the square holes
  on his paintings, but I will fill all of them rather than just
  some of them
  
  Jan 16
  */
  fill(0,0,120);
  //start with the triangles
  triangle(210,150,210,180,240,180);
  triangle(270,150,270,180,240,180);
  
  //face
  drawSquare(255,255,120,7,10);
  drawSquare(255,255,120,8,10);
  
  drawSquare(255,120,30,7,11);
  drawSquare(255,120,30,8,11);
  
  drawSquare(180,150,24,5,11);
  drawSquare(180,150,24,6,11);
  drawSquare(180,150,24,9,11);
  drawSquare(180,150,24,10,11);
  
  drawSquare(120,180,15,4,11);
  drawSquare(120,180,15,11,11);
  drawSquare(120,180,15,3,11);
  drawSquare(120,180,15,12,11);
  
  drawSquare(60,90,8,3,12);
  drawSquare(60,90,8,12,12);
  drawSquare(180,45,45,4,12);
  drawSquare(180,45,45,11,12);
  
  drawSquare(90,24,24,4,13);
  drawSquare(90,24,24,11,13);
  drawSquare(200,12,60,5,13);
  drawSquare(200,12,60,10,13);
  
  drawSquare(60,90,140,4,10);
  drawSquare(60,90,140,11,10);
  drawSquare(30,45,70,4,9);
  drawSquare(30,45,70,11,9);
  
  drawSquare(30,45,70,3,10);
  drawSquare(30,45,70,12,10);
  drawSquare(15,20,35,3,9);
  drawSquare(15,20,35,12,9);
  
  drawSquare(7,10,16,3,8);
  drawSquare(7,10,16,12,8);
  drawSquare(18,28,43,4,8);
  drawSquare(18,28,43,11,8);
  drawSquare(9,14,150,5,8);
  drawSquare(9,14,150,10,8);
  drawSquare(4,7,75,6,8);
  drawSquare(4,7,75,9,8);
  
  drawSquare(255,255,0,4,7);
  drawSquare(255,255,0,5,7);
  drawSquare(255,255,0,10,7);
  drawSquare(255,255,0,11,7);
  
  drawSquare(50,3,20,5,14);
  drawSquare(150,2,70,6,14);
  drawSquare(150,2,70,7,14);
  drawSquare(150,2,70,8,14);
  drawSquare(150,2,70,9,14);
  drawSquare(50,3,20,10,14);
  
  drawSquare(0,0,60,7,3);
  drawSquare(0,0,60,8,3);
  drawSquare(0,0,30,7,2);
  drawSquare(0,0,30,8,2);
  drawSquare(0,0,15,7,1);
  drawSquare(0,0,15,8,1);
  
  drawSquare(0,0,60,7,6);
  drawSquare(0,0,60,8,6);
  drawSquare(0,0,30,6,6);
  drawSquare(0,0,30,9,6);
  drawSquare(120,120,90,7,7);
  drawSquare(120,120,90,8,7);
  
  drawSquare(60,60,110,6,5);
  drawSquare(60,60,110,9,5);
  drawSquare(77,77,26,5,5);
  drawSquare(77,77,26,10,5);
  drawSquare(45,45,13,4,5);
  drawSquare(45,45,13,11,5);
  drawSquare(24,24,7,3,5);
  drawSquare(70,70,4,3,6);
  drawSquare(24,24,7,12,5);
  drawSquare(12,12,4,2,5);
  drawSquare(6,6,2,2,6);
  drawSquare(6,6,2,13,6);
  drawSquare(70,70,4,12,6);
  drawSquare(12,12,3,13,5);
  
  drawSquare(42,42,25,3,4);
  drawSquare(42,42,25,12,4);
  drawSquare(21,21,12,2,4);
  drawSquare(21,21,12,13,4);
  drawSquare(21,21,12,3,3);
  drawSquare(21,21,12,12,3);
  
  drawSquare(40,40,26,4,3);
  drawSquare(40,40,26,11,3);
  drawSquare(20,20,140,5,3);
  drawSquare(20,20,140,10,3);
  drawSquare(20,20,13,4,2);
  drawSquare(20,20,13,11,2);
  drawSquare(10,10,29,5,2);
  drawSquare(10,10,29,10,2);
  
  drawSquare(30,30,115,6,4);
  drawSquare(30,30,115,9,4);
  drawSquare(15,15,85,6,3);
  drawSquare(15,15,85,9,3);
  drawSquare(8,8,70,6,2);
  drawSquare(8,8,70,9,2);
  
  drawSquare(54,54,70,5,4);
  drawSquare(54,54,70,10,4);
  drawSquare(60,60,42,4,4);
  drawSquare(60,60,42,11,4);
  // Whew!
  
  fill(0,0,255);
  arc(180,300,60,60,0,PI+HALF_PI,TWO_PI);
  arc(300,300,60,60,0,PI+HALF_PI,TWO_PI);
}



