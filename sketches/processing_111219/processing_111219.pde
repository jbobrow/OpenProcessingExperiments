
int diamiter=80; //size of circle
int directiony=1; //falling up or down?
int directionx=1; // moveing left or right?
int distancey=diamiter/2; //center or circle Virtical
int distancex=diamiter/2; //center of circle Horizontal
int speedx=7; //how fasst left or right
int speedy=10; //how fast up or down
//int bar=height-200;  //the center of the bar In the Y

void setup() {
  size (700, 700);
  fill (0,219,255);
  noStroke();
  //frameRate (900);
}

void draw() {
  background (50);
  ellipse (distancex, distancey, diamiter, diamiter);
  rectMode (CENTER);
  rect (mouseX, height-200, 100, 30);
  //  ellipse (distance, height/3, diamiter, diamiter);
  //  ellipse (width-100, distance, diamiter, diamiter);
  //  ellipse (distance, height-300, diamiter, diamiter);
  //  ellipse (width/9, distance, diamiter, diamiter);
  //  ellipse (distance, height/10, diamiter, diamiter);
  distancey=distancey+speedy*directiony;
  distancex=distancex+speedx*directionx;
  //hit bottom or top
  if (distancey<(0+diamiter/2)) {
    directiony=-directiony;
  }
  //hit the god damn bar
  if (distancey>=height-230 && mouseX-50 <= distancex && distancex <= mouseX+50) { 
    directiony=-directiony;
  }
  //miss the bar and bounce on bottom of screen
  if (distancey>height-diamiter/2) {
    directiony=-directiony;
  }
  //hit left or right
  if (distancex>width-diamiter/2||distancex<1+diamiter/2) {
    directionx=-directionx;
  }
}



