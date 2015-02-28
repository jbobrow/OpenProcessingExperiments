
PImage b;
int i;
PImage a;
boolean bgdone=false;


void setup() {
  size(500,500);
  b = loadImage("iwashere.png");
  a = requestImage("carte.jpg");

}

void draw() {
  if (bgdone == false && a.width != 0 ) {
      bgdone=true;
      image(a,0,0);
  }
  i= 5;
  image(b, mouseX,mouseY,i,i);
}

void mouseClicked() {
  i=0;
  while(i<70) {
    i=i+1;
    image(b,mouseX,mouseY,i,i);

    if(mouseButton == RIGHT) {
      noLoop();
    }
  }
}


