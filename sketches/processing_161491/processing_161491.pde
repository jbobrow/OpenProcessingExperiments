
int posx = width/2;
int posy = height/2;
int xd = 20;
int yd = 20;
int w = 10;
PImage bkpic;
PImage bcpic;
int h = 10;

// define setup function
void setup(){
  size(600, 319);
  bkpic = loadImage("hockey_rink_diagram.png");
  image(bkpic, 0, 0);
  frameRate(40);
  }

// define draw function
void draw() {
  bkpic = loadImage("hockey_rink_diagram.png");
  image(bkpic, 0, 0);
  image(bkpic, 600, 319);
  strokeWeight(10);
  bcpic = loadImage("images.png");
  image(bcpic, posx, posy);
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
   image(bcpic, 0, 0);
   
}

void mousePressed(){
  loop();
}

void mouseReleased(){
  noLoop();
}



