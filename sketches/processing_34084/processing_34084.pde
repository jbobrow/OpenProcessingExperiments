
PImage bg; /*background*/
PImage bh; /*green dino w glasses*/
PImage bj; /* cupcake*/

float bx;
float by;
float bi;
float qw;
int bs = 100;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0;


void setup() 
{
  size(1700, 900);
  frameRate(30); 
  bx = 100/2.0;
  by = 200/2.0;
  bi = 300/2.0; 
  qw = 100/2.0;
  bg = loadImage("robotslovedinos.png");
  bh = loadImage("bowgreendino.gif");
  bj = loadImage("cupcake.png");

}

void draw() 
{ 
  background(bg);
  
   
  if (mouseX > bx-bs && mouseX < bx+bs && 
      mouseY > by-bs && mouseY < by+bs) {
    bover = true;  
    if(!locked) { 
    } 
  } else {
    bover = false;
  }
  image(bh,bx, by, 100, 140);// green bow tie dino

  if (mouseX > bx-bs && mouseX < bx+bs && 
      mouseY > by-bs && mouseY < by+bs) {
         bover = true;  
    if(!locked) { 
    } 
  } else {
    bover = false;
    image(bj, qw, bi ,336,384); //cupcake
  }
}

void mousePressed() {
  if(bover) { 
    locked = true; 
  } else {
    locked = false;
  }
  bdifx = mouseX-bx; 
  bdify = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
  }
    bx = mouseX-bdifx; 
    by = mouseY-bdify; 
  }


void mouseReleased() {
  locked = false;
}


