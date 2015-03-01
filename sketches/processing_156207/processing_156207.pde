
int x; 
int y; 

int dx;
int dy; 

int ballSize; 

boolean bounce; 
int bounceNumber; 

void setup() {
  size(500, 500); 
  background(255); 

  x = width/4; 
  y = height/2; 

  dx = 1; 
  dy = 1; 

  ballSize = 70; 
  bounce = false;
  
  bounceNumber = 0; 
} 


void draw() {
  background(255); 

  x = x + dx; 
  y = y + dy;

  if ( x > width - ballSize/2 || x < ballSize/2) {
    dx = -dx;
    bounce = true;
  } 

  if ( y > height - ballSize/2 || y < ballSize/2) {
    dy = -dy;
    bounce = true;
  }

  if ( bounce == true ) {
    fill(0);
    bounceNumber += 1; 
  } 
  else {
    fill(255);
  }

  fill(255);
  stroke(0);
  ellipse(x, y, ballSize, ballSize); 


  if ( x % 100 == 0 ) {
    stroke(0);
    line(x, 0, x, height);
  }
  else if ( x % 50 == 0 ) {
    stroke(50); 
    line(x, 0, x, height);
  }
  else if ( x % 20 == 0 ) {
    stroke(100); 
    line(x, 0, x, height);
  }
  else if ( x % 10 == 0 ) {
    stroke(150); 
    line(x, 0, x, height);
  }
  else if ( x % 5 == 0 ) {
    stroke(200); 
    line(x, 0, x, height);
  }
  else if ( x % 2 == 0 ) {
    stroke(230); 
    line(x, 0, x, height);
  }
  else { 
    fill(0);
    ellipse(x, y, 5, 5);
  }

  //text to draw, x position, y position'
  fill(0); 

  text("number of bounces is " + bounceNumber, 100, 100);  

  //text("this is my text", x, y);   
  textAlign(CENTER, CENTER);   
  text(x + ", " + y, x, y); 

  //println(x);

  bounce = false;
} 



