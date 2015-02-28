
int x;
int x2=270;
void setup(){
  size(400,300);
  smooth();
  noFill();
  background(255);
  x=270;
  frameRate(15);
}
void draw(){
background(255);
ellipse(100,x2,70,70);
x2=x2-1;
fill(80);
stroke(94,48,160);
ellipse(200,x2,80,80);
x=x+1;
fill(46,144,240);
stroke(46,144,240);
ellipse(x,270,40,40);
x2=x2-1;
fill(24,46,237);
stroke(240,46,237);
}
