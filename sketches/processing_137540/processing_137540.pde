
int x=100;
int y=100;
int s=100;
int col=250;

void setup() {
  size( 500, 500 );
  smooth();
}
 
void draw() {
  background(255);
  noFill();
  ellipse(x, y, s, s);
}
 
void keyPressed() {
 
  if (key==CODED) {
    if (keyCode==UP) {
      y-=4;
    }
    else if (keyCode==DOWN) {
      y+=4;
    }
    else if (keyCode==LEFT) {
      x-=4;
    }
    else if (keyCode==RIGHT) {
      x+=4;
    }
  } 
  else {
    if (key=='+') {
      s+=2;
    }
    else if (key=='-') {
      s-=2;
    }
  }
}
 

