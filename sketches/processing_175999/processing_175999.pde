
void setup() {
  background(0);
  size(500,500);
  noFill();
  stroke(255);
  strokeWeight(3);
  frameRate(40);
 }
 
int fr=20;
int x=10;
int y=250;
int x1=250;
int y1=10;
int d=8;
int b=100;
int x2=10;
int y2=10;

void draw() {
 frameRate(fr);
  //background(0);
  stroke(255,b);
  ellipse(x,y,d,d);
  ellipse(500-x,y,d,d);
  ellipse(x1,y1,d,d);
  ellipse(x1,500-y1,d,d);
 // ellipse(x2,y2,d,d);
  // ellipse(500-x2,500-y2,d,d);
 // x2=x2+10;
 // y2=y2+10;
  x=x+10;
  y1=y1+10;
  d=d+8;
  b=b-2;
  if (x>370) {
    background(0);
    x=10;
    d=8;
    b=100;
  }
 
   if (y1>370) {
    background(0);
    y1=10;
    d=8;
    b=100;
  }
}
  void keyReleased(){
    if (keyCode==UP) {
      fr++;
    }
      if (keyCode==DOWN) {
      fr--;
    }
     if (key=='n') {
     noLoop();
    }
     if (key=='y') {
     loop();
    }
     if (key=='s') {
     saveFrame();
    }
  }
