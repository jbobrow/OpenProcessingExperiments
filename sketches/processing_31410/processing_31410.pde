
float xpos;
float ypos;

float xspeed=3;
float yspeed=3;

float xdirection=1;
float ydirection=1;


void setup () {
  size (1000,500);
  noStroke ();
  frameRate (60);
  smooth ();
  background (100);
  xpos = 300;
  ypos = 234;
}

void draw () {
 fill (0,200,0);
 rect (xpos, ypos, 50, 50);
 fill (0,0,200);
 triangle (xpos,ypos,xpos + 50,ypos, xpos, ypos + 70);
  
  xpos = xpos + (xspeed * xdirection);
  ypos = ypos + (yspeed * ydirection);
  
  if (xpos < 0 || xpos > width-50){
    xdirection *= -1;
  }
  if (ypos < 0 || ypos > height-50){
    ydirection *= -1;
  }
}

