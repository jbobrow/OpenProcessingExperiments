
PImage bkphoto;
int posx = 173;
int posy = 245;
int xd = 20;
int yd = 20;
int w = 10;
int h = 10;

void setup() {
  size(355, 491);
  bkphoto = loadImage("field.png");
  frameRate(30);
  noLoop();
  }

void draw() {
  //background(200, 100, 0);
  image(bkphoto, 0, 0);
  ball(posx, posy, w, h);
  posx = posx + xd;
  posy = posy + yd;
  if (posx>(width-w)) {
     xd = -xd;}
  if (posy>height-h) {
     yd = -yd;}
  if (posx<0) {
     xd = -xd;}
  if (posy<0) {
     yd = -yd;}
}

void ball(int x,int y,int w,int h) {
   //noStroke();
   ellipseMode(CORNER);
   fill(255); 
   ellipse(x, y, w, h);

}
void mousePressed() {
  loop();  
}

void mouseReleased() {
  noLoop();  
}


