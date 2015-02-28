
/* 
   ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
   |||  coded by Michele Semeghini  |||||||||||||||||||||||||||||||||||||
   |||  based on Jared Tarbell's program "Fractal.Invaders", 2004  ||||||
   ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
*/

int pxSize = 3;                 // resolution of each Invader (in pixels)
int invSize = 5;                // must be an odd number!
int halfAxis = (invSize-1)/2;   // fixes a middle vertical simmetry


void setup() {
  size (840, 420);
  frameRate(7);  
}


void draw() {
  translate(7, 7);
  background(255);
  for (int y = 0; y<height; y+=(2*invSize)*pxSize) {
    for (int x = 0; x<width; x+=(2*invSize)*pxSize) {
      pushMatrix();
      translate(x, y);
      for (int xx=halfAxis*pxSize; xx>=0; xx-=pxSize) {
        for (int yy = 0; yy<invSize*pxSize; yy+=pxSize) {
          int n = int(random(10));

          if ( (n%2) == 0) {
            fill(0);
            rect(xx, yy, pxSize, pxSize);
            if (xx!=halfAxis*pxSize) rect(2*halfAxis*pxSize-xx, yy, pxSize, pxSize);
          }
        }
      }
      popMatrix();
    }
  }
}


// to pause/play the animation, a keybord event (spacebar) is checked!
int checkVar = 1;

void keyPressed() {

  if ((key == ' ' ) && (checkVar==1)) {
    noLoop();
    checkVar--;
  }
  else { 
    loop();
    checkVar++;
  }
}
                
