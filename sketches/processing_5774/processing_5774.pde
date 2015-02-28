


int h, v;
color cc;
int x1, x2, y1, y2;


void setup() {

  size (800,600);
  background (0);



  h = width/2;
  v = height/2;
  x1 =100;
  y1 = height/2;
  x2 = width-100;
  y2 = height/2;

}

void draw () {

  cc = color (255);
  if (h>width-10) h=width-10;
  if (h<0) h=0;
  if (v>height-10) v=height-10;
  if (v<0) v=0;

  int speed =3;

  if (keyPressed) {

    switch (keyCode) {

    case LEFT: 
      x1-=speed;
      h-=speed;  

      x2+=speed;
      break;
    case RIGHT:
      x1+=speed; 
      h+=speed;

      x2-=speed;
      break;
    case UP: 
      y1-=speed;
      v-=speed; 

      y2+=speed;
      break;

    case DOWN: 
      y1+=speed; 
      v+=speed;

      y2-=speed;
      break;
    }
    switch (key) {
    case ' ': 
      background (0);
      break;
    }
  }
  strokeWeight (0.5);
  stroke (cc);
  line (x1,y1,x2,y2);


  if (mousePressed) {
    rect (h,v,10,10);

  }
}





