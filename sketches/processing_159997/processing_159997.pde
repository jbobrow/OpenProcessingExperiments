
color[] BLUE = {#0022FF, #0084E8, #1400FF, #004DE8, #00C3FF, #512CFF, #6664FF, #20ADFF};
color[] YELLOW = {#C9FF05, #E8E000, #FFCF00, #E89E00, #FF8F00, #FF7700, #E85600, #FF4A00};
color[] GREEN = {#00FF8E, #00E855, #0FFF00, #4DE800, #93FF00, #C3FF00, #00FF35, #B7FF00};
color[] PURPLE = {#FF005C, #E8009F, #FC00FF, #BE00E8, #9A00FF, #52009E, #FC009C, #BE0082};
color[] BROWN = {#52452A, #875A33, #A36953, #3D1912, #190F0E, #241E12, #332213, #3D281F};
color[] MARINE = {#00FFB2, #00ED74, #00FFD0, #00FCFF, #00B0FF, #00FFDA, #00EDFF, #00BBFF};
color[] palette = MARINE;

int posx = width/2;
int posy = height/2;
int xd = 20;
int yd = 20;
int w = 10;
PImage bkpic;
PImage ballpic;
int h = 10;

// define setup function
void setup(){
  size(358, 493);
//  frameRate(50);
  bkpic = loadImage("Soccer field.png");
  ballpic = loadImage("ball-s.png");
  }

// define draw function
void draw() {
  image(bkpic, 0, 0);
  strokeWeight(10);
  image(ballpic, posx, posy);
  posx = posx + xd;
  posy = posy + yd;
  if (posx>width-50) {
     xd = -xd;}
  if (posy>height-50) {
     yd = -yd;}
  if (posx<0) {
     xd = -xd;}
  if (posy<0) {
     yd = -yd;}
}

// define ball function
void ball (int x,int y,int w,int h) {
   fill (random(0, 255), random(0, 255),random(0, 255)); 
   image(ballpic, x, y, w, h);
   
}

void mousePressed(){
  loop();
}

void mouseReleased(){
  noLoop();
}



