
void setup() {
  size(600,400);
  frameRate(4);
  }
int posx;
int posy;
int xd = 10;
int yd = 20;
int wid =50;
int ht = 80;

void draw() {
  background(21,52,173);
  smiley(posx,posy,wid,ht);
  posx = posx + xd;
  posy = posy + yd;
  if (posx>width) {
     xd = -xd;}
  if (posy>height) {
     yd = -yd;}
  if (posx<0) {
     xd = -xd;}
  if (posy<0) {
     yd = -yd;}
}
void smiley(int x,int y,int w,int h) {
   fill(160, 43, 23); 
   ellipse(x,y,w,h);
   noFill();
   arc(x,y,w/2,h/2,.25*PI,PI*.75);
   fill(0,0,0);  //black
   ellipse(x-w*.25,y-h*.25,w/10,h/10);
   ellipse(x+w*.25,y-h*.25,w/10,h/10);
}


