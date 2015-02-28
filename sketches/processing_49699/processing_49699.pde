
float x = 100;
float y = 100;
float xspeed = 6;
float yspeed = 5;
boolean clicker = true;
float incolour = 100;
int backcolour = 255;

int white = 255;
int black = 0;

void setup () {
  size (800, 600);
  smooth();
  noStroke();
}

void draw () {
  
  
  //semi transparent rectangle fader
  fill (backcolour,5);
  rect (0,0,width,height);
 
 //big circle
  fill (incolour);
  ellipse (x,y, 100, 100);
  
//small circle
  fill (backcolour);
  ellipse (x,y, 50, 50);
  
  
  if (x>width-50 || x<50) {
    xspeed = -xspeed;
  } 
  x+=xspeed;
  
  if (y>height-50 || y<50) {
    yspeed = -yspeed;
  }
  y+=yspeed;
  
  

//boolean
  if (clicker == true) {
    incolour = white;
    backcolour = black;
  }
  else {
    incolour = black;
    backcolour = white;
  }
  println (clicker);
}

void mousePressed () {

  clicker = !clicker;
  
}

