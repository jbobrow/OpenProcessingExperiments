
//Seiji Hall
//7/9/13
//assignment 7
//DMA

void setup() {
  size(600, 500); /*makes the window size 600 x 500*/
  background(0); /*makes BG blak*/
  frameRate(50); /*set framerate to at least 60 i think*/
}

int dx = 2; /*sets dx to 2*/
int dy = 3; /*sets dy to 3*/

int x = 50; /*sets x to 50*/
int y = 50; /*sets y to 50*/

void draw() {
  fill(225); /*fill will be hwhite*/
  ellipse(x, y, 25, 25); /*the rect will be at x,y and 25,25,5<-parameters*/
  
  x = x + dx; /*x will be x + dx*/
  y = y + dy; /*y will be y + dy*/ 
  
  if (x < 0 || x > 475) {
    dx = -1 * dx;
  }
  if (y < 0 || y > 475) {
    dy = -1 * dy;
  }
  if (mousePressed) {
    ellipse(mouseX, mouseY, 25, 25);
  }
}
