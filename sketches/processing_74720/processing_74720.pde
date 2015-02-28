
// Leyli Guliyeva
// Copyright 2012; 1130 class
// Assignment 7

// Click and drag the mouse to avoid collision


float gamestate, a, a2, aSpeed, b, b2, bSpeed, c, d, e, f, dis, cSpeed, dSpeed, diam, qDiam, ab, hits, distX, distY;

void setup () {
  size (400, 600);
  smooth ();
  rectMode (CENTER);
  ellipseMode (CENTER);
  a = 40;
  a2 = a;
  b = 40;
  b2 = b;
  aSpeed = 0;
  bSpeed = 0;
  diam = 60;
  c = 200;
  d = 200;
  e = 100;
  cSpeed = 10;
  dSpeed = -6;
  qDiam = 10;
  hits = 0;
  
}

void draw () {
  background (255);
  xMark ();
  circle ();
  bounce ();
  moveCircle ();
  collision ();
  displayText ();
  collisionDetection ();
}

void xMark () {
stroke (#3CB9B2);
strokeWeight (6);
line (c-5, d-5, c+5, d+5);
line (c-5, d+5, c+5, d-5);
fill (255);

} 

void circle () {
stroke(#F26E6E);
noFill ();
ellipse (a, b, diam, diam);
}


void bounce () {
  c += cSpeed;
  d += dSpeed;
  
  if (c < qDiam || c > width-qDiam) {
    cSpeed = -cSpeed;
  }
  
  if (d < qDiam || d > height-qDiam) {
    dSpeed = -dSpeed;
  }
}

 
void mouseDragged ()
{
 if (mouseX > pmouseX)
 {
   aSpeed = aSpeed + .25;
 }
 else if (mouseX < pmouseX)
{
  aSpeed = aSpeed - .25;
}
 if (mouseY > pmouseY)
 {
   bSpeed = bSpeed + .25;
 }
 else if (mouseY < pmouseY)
 {
   bSpeed = bSpeed - .25;
 }
 
   
}
 
void moveCircle ()
{
  a = a + aSpeed;
  if (a > width + e*.50)
  {
    a = -e*.50;
  }
  else if(a < -e*.50)
  {
    a = width + e*.50;
  }
  b = b + bSpeed;
  if (b > height + e*.50)
  {
    b = -e*.50;
  }
  else if (b < -e*.50)
  {
    b = height + e*.50;
  }
}

void collision () {
  dis = dist ( a, b, c, d);
  if (dis < 50)
  {
    background (#3CB9B2);
    hits++;
    a = random(0, width);
    b = random(0, height);
    cSpeed = random (5, 15);
    dSpeed = random (-9, -3);
  }
}

void displayText () {
  fill (#F26E6E);
  text ("time" + " " + " " + " " + ":" +  " " + " " + " " + millis ( )/1000, width/5, height*.85);

}

 void collisionDetection ()
  {
  fill (#F26E6E);
  text ("collisions" + " " + " : " + " " + hits, width/5, height*.9 );
  
  if (a > width + e*.50 || a < -e*.50 || b > height + e*.50 || b < -e*.50)    
  {
   ;
  }
}

  


