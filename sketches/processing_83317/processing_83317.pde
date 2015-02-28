
PImage img;
float x;
float y;

float xpos;
float xspeed = 3.8;
int xdirection = 1;

float ypos;
float yspeed= 2.3;
int ydirection = 1; 


void setup() {
  size(1000, 1000);
  img = loadImage("down.png");
  //constraints for circles 
  //img = loadImage("circles.png");
}

void draw() {
  background(0);
  x += 0.5;
  y += -0.5;
  
  
  xpos = xpos + (xspeed * xdirection );
  
//********************************************************
//ypos=ypos+(yspeed * ydirection);  // ypos - doesn't do anything in program
//********************************************************


    if (xpos > 400) {
    xdirection += -1;
    }
   if (xpos < 200) {
    xdirection = 1;
   }
   else if(keyPressed==true)  //Watch how the speed changes when you press any key repeatedly or hold a key down. 
    {
      xdirection -= -2;  //this also makes the arrow bounce off the screen to the right because the constraint has changed to -2.
    }
 
  image(img, xpos, 0);
  
  }


