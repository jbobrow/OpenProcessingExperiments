
// A moving circle! This produces very similar results to early code, but using custom functions.

float yPos = 0; //position of the circle
float vel = 4;  //the speed of the circle

void setup(){
  size(600,300);
  smooth();
}

void draw(){
  /* 
  Besides my comments, the draw section is very organized and compact. 
  When programming, attempt to make very simple draw loops, like this one, 
  Keep similar actions grouped into functions which are called from draw().
  */
  background(255,255,255);
  move(); 
  make();
}

void move(){
  yPos += vel;
  if( yPos < 0 || yPos > height){ // if the circle is at the top of bottom of the screen
    vel *= -1; //move it the other way
  }
}

void make(){
  /*
  This is good practice as well. Always put relavent drawing commands directly before 
  whatever shape you are drawing. In a simple program like this, it doesn't matter, 
  but if you are drawing thousands of shapes, it will.
  */
  noStroke();
  fill(255,0,127);
  ellipse(300,yPos,50,50);
}

