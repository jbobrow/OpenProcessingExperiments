
ColorHEllipse[] e= new ColorHEllipse[10];
float xpos, ypos, xspeed, yspeed;

void setup() {
  colorMode(HSB);
  size(500, 500) ;
  frameRate(50);
  background(0);
  for (int i=0; i<10;i++) {   
    e[i]=new ColorHEllipse (random(25, 100), random(25, 100), random(1, 10), random(1, 10), color(random(255), random(255), random(255)));
  }
}

void draw() {
  fadeToBlack();
  for (int i = 0; i < 10; i++) {
    e[i].update();
  }
}

void fadeToBlack() {
  noStroke();
  fill(0, 30);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

class ColorHEllipse extends HEllipse {
  color col;
  ColorHEllipse(float x, float y, float p, float q, color _col){
    super (x,y,p,q);
    col= _col;
  }
  
  void update(){
    super.update();
     fill(col);
  } 
}
class HEllipse {
 float xpos, ypos, xspeed, yspeed; 
  HEllipse(float x, float y, float p, float q) {
  xpos=x;
   ypos=y;
    xspeed=p;
   yspeed=q;
 }
  
  void update() {
    xpos += xspeed;
    ypos += yspeed;
    if (xpos>width-25) {
      xspeed=xspeed*(-1);
    }
    if (ypos>height-25) {
      yspeed=yspeed*(-1);
    }
    if (xpos<0+25) {
      xspeed=xspeed*(-1);
    }
    if (ypos<0+25) {
      yspeed=yspeed*(-1);
    }
    stroke(255);
    ellipse(xpos, ypos, 50, 50);
  }
}


