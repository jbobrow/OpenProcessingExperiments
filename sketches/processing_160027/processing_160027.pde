
// code begins here - declaring global variables
PImage bkpic;
int posx = 457;
int posy = 327;
int xd = 10;
int yd = 20;
int w =15;
int h = 15;

// define setup function
void setup() {
  size(915,653);
  frameRate(20);
  noLoop();
  bkpic = loadImage("soccerfield.jpg");
  }

// define draw function
void draw() {
  //background(200,0,0);
  //bkpic = loadImage("soccerfield.jpg");
  image(bkpic, 0, 0);
  ball (posx, posy, w, h);
  posx = posx + xd;
  posy = posy + yd;
  if (posx>width-50) {
     xd = -xd;}
  if (posy>height) {
     yd = -yd;}
  if (posx<50) {
     xd = -xd;}
  if (posy<0) {
     yd = -yd;}
}

// define ball function
void ball (int x,int y,int w,int h) {
   fill (255, 255, 255); 
   ellipse (x, y, w, h);
   
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}


