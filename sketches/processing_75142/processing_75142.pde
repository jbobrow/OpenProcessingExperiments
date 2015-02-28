
int _x,_y,_wi,_hi;
color _c;
void setup(){
  size (500,500);
  noLoop();
  smooth();
colorMode(HSB);
_x = width/2;
_y = height/2;

_wi= width/4;
_hi= width*3;

}
void draw(){
  background(0);
  for (int i=0; i<100;i++){
  _c = color(random(256), 200, 200);  
  target (int (random(width)),int(random(height)), 10, 30, _c);
  }
}
void target (int x, int y, int wi, int hi, color c){
smooth();
noStroke();
fill(c);
ellipse(x,y,wi*4, wi*4);
fill (0);
ellipse(x,y,wi*3, wi*3);
fill (c);
ellipse(x,y,wi*2, wi*2);
fill (0);
ellipse(x,y,wi,wi);



}

void mousePressed() {
redraw();
}

