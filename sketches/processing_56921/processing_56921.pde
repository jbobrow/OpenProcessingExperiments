
PImage img;
int size = 60;
int x=10;

float xpos, ypos;    
  
float xspeed = 2.0; 
float yspeed = 1.5; 

int xdirection = 2;
int ydirection = 1;


void setup () {
  size(600, 600);                        
  smooth();                          
  img = loadImage ("on.png");
  img.resize (200, 200);
  imageMode(CENTER);
  //image(img, 100, 100);
  xpos = width/2;
  ypos = height/2;
}

void draw () {
  
  background (255);
  image(img, xpos, ypos);
  petMoving ();
}

void petMoving () {
  
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  if (xpos > width-size/2 || xpos < 0+size/2) {
    xdirection *= -1;
  }
  if (ypos > height-size/2 || ypos < 0+size/2) {
    ydirection *= -1;
  }
}


