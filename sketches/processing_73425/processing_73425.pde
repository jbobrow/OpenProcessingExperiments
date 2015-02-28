
int x = 0;
int y=0;
int speed =1;
int gravity =-2;
float r=150;
float g=90;
float b=180;
void setup() {
  size(300,300);
  smooth();
}
void draw() {
  background(r,g,b);
  stroke(255);
      if(mouseX>width/2) {
      r=r+1;
    } else {
     r=r-1;
    }
    if(r>255) {
      r=255;
    } else if (r<0) {
      r=0;
    }
    if(mouseY>height/2) {
      g=g+1;
    }else {
      g=g-1;
    }
  y=y+speed;
  if ((y > width) || (y < 0)){
    speed=speed * gravity;
  }
  stroke (0);
  fill (25);
  ellipse (29,y,12,12);
  fill(255);
   ellipse (229,y,32,32);
   fill(120);
   ellipse (129,y,42,42);
}

