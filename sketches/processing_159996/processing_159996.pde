
// code begins here - declaring global variables
int posx = 300;
int posy = 200;
int xd = 20;
int yd = 20;
int w =50;
int h = 50;

// define setup function
void setup() {
  size(600,400);
  frameRate(5);
  }

// define draw function
void draw() {
 // background(255);
  ball (posx, posy, w, h);
  posx = posx + xd;
  posy = posy + yd;
  if (posx>width) {
     xd = -xd;
   }
  if (posy>height) {
     yd = -yd;}
  if (posx<0) {
     xd = -xd;}
  if (posy<0) {
     yd = -yd;}
     
}




// define ball function
void ball (int x,int y,int w,int h) {
   fill (random(0,255),random(0,255),random(0,255)); 
   noStroke();
   ellipse (x, y, w, h);
   ellipseMode(CORNERS);
}





