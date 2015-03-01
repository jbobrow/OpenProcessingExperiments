
int size=10;     //USE ARROW KEYS TO CONTROL SIZE.
int r=0;         // LEFT, RIGHT, CONTROL, ALT FOR RGB AND BLACK.
int g=0;         // SHIFT TO WIPE IT CLEAN.
int b=0;

void setup()
{
  size(500,500);
  smooth();
  background(255);
}
void draw()
{
  fill(r,g,b);
  stroke(r,g,b);
  
 if (keyPressed) {
   
  if (key == CODED) {
   
    if (keyCode == SHIFT) {
      background(255);
    }
    if (keyCode == UP) {
      size=size+2;
    }
    if (keyCode == DOWN) {
      size=size-2;
    }
    if (keyCode == RIGHT) {
     r=0;
     g=255;
     b=0; 
    }
    if (keyCode == LEFT) {
     r=255;
     g=0;
     b=0; 
    }
    if (keyCode == CONTROL) {
     r=0;
     g=0;
     b=255; 
    }
    if (keyCode == ALT) {
     r=0;
     g=0;
     b=0; 
    }
  } 
}
  if (mousePressed)
  {
    ellipse(mouseX,mouseY,size,size);
  } 

}


