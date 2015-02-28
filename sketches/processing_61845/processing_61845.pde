

void setup () {
  size(300,300);
  background(0);
 
}
void draw () {
   background(0);
    int x=mouseX;
  int y=mouseY;
  noStroke();
  smooth();
  fill (192,0,y*.2,150);
  rect (x*.3,y*.3,40,40);
 rect (x*2,y*2,40,40);
 fill(0,60,230,150);
 ellipse (x*1.5,y,80,80);
 ellipse (x*.25,y,80,80);
 fill(255,150);
 ellipse(x,y,30,30);
 }


