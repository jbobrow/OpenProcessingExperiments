
int counter;
int x = 20;
int y = 20;

int dx = 0;
int dy = 0;


void setup() {  //setup function called initially, only once
  size(250, 250);
  
}

void draw() {  //draw function loops 

  background (255,255,255,0);
  ellipse (x,y,20,20) ;
  
  if (mousePressed) {
      fill (255,6,255);
  }
  else {
      fill (255,255,6);
  }
  if (keyPressed) {
      fill (6,255,255);

  if (key=='d' || key=='D') {
      fill (255,255,255) ;
      dx=1;
    }
  else if (key=='a') {
  dx=-1;
  }
  else if (key=='w') {
  dy=-1 ;
  }
  else if (key=='s') {
  dy=1 ;
  }
  else {
  dx=0 ;
  dy=0 ;
  }
 }
 x= x+dx;
 y= y+dy;
}
