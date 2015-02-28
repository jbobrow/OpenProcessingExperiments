
//////////////////////////////////////////////////////////////////////
//Christen Setters
//Cross Project 4
// The sun will rise when you press the 'l' key as you move your mouse 
// to the sky. The 'o' key will turn off the sun and make it night 
//again.
//5 September 2012
//////////////////////////////////////////////////////////////////////

int circleX=0;
int circleY=100;
int barA=600;


void setup() {
  size(600, 600);
  background (0, 0, 100);
}

void draw() {
  mountians();
  woodCross();
 println(barBC());
} 

void starOfDavid () {
  int tri;
  tri=15;

  noStroke();
  fill(255, 255, 0);
  triangle (25, tri, 37, tri, tri*2, 25);
  fill (255, 255, 0);
  triangle (23, 22, 37, 22, tri*2, 10);
}

void risingSun() {

  // risiing sun//
  noStroke();
  fill (255, 250, 0);
  ellipse(300, 600, mouseX, 2*mouseX);
} 

void mountians() {
  
  //mountains//
  fill(0, 150, 0);
  triangle(circleX, barA, 150, barA/2, barA/2, barA);
  triangle(250, barA, barA, barA, barBC(), barA/2);
}
void woodCross() {

  //Cross vertical bar//
  fill(211, 116, 38);
  noStroke();
  triangle(250, circleY/2, 350, 50, barA/2, 25);  
  noStroke();
  triangle (250, 550, 350, 550, 300, 575);
  noStroke();
  rect(250, circleY/2, circleY, 500);

  //Cross horizontal bar//
  triangle(circleY, 125, circleY, 225, circleY/2, 175);
  triangle(500, 125, 500, 225, 550, 175);
  rect(circleY, 125, 400, circleY);

  //lines on the cross//
  stroke(0);
  line (barA/2, circleY, barA/2, 550);
  line(circleY, 175, 500, 175);
}

void keyPressed() {
  if (key == 'l') {
    background (250, 250, 100);
    risingSun();
  }

  else if (key == 'o') {
    background(0, 0, 100);
    starOfDavid();
  }
  
}

int barBC() {
  int result;
  result = barA-150; 
  return result;
  
}


