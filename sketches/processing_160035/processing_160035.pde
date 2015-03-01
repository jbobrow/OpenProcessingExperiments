
//Bouncy Ball
PImage bkpic;

int posx = 301;
int posy = 212;
int posx2 = 301;
int posy2 = 212;
int xd = 10;
int yd = 10;
int w = 70;
int h = 70;

// define setup function
void setup() {
  size(602, 423);
  frameRate(80);
  smooth();
  noLoop();
  bkpic = loadImage("galaxy.jpg");
  }
  
void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}

// define draw function
void draw() {
//  background(255);
  image(bkpic, 0, 0);
  ball (posx, posy, w, h);
  posx = posx + xd;
  posy = posy + yd;
  if (posx>(width-35)) {
     xd = -xd;
   }
  if (posy>(height-35)) {
     yd = -yd;
   }
  if (posx<35) {
     xd = -xd;
   }
  if (posy<35) {
     yd = -yd;
   }
}

// define ball function
void ball (int x,int y,int w,int h) {
   noStroke();
   fill (#FFF800); 
   ellipse (x, y, w, h); 
   strokeWeight(10);
   stroke(0);
   point(x-12,y-14);
   point(x+12,y-14);
   strokeWeight(5);
   line(x-15, y+15, x+15, y+15);
}



