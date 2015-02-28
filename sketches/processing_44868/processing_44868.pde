
int y = 700/2;
int x = 700/2;
int c = 20;
float a = -350;
float b = 700;
float speed=2;
boolean blink=false;
boolean u;
boolean d;
float degree=0;
void setup() {
  size(700, 700);
  smooth();
  drawbackground();
}
void draw() {
  pushMatrix();
  fill(12, 240, 165);
  int R = int(.001);

  translate(width/2, height/2);
  rotate(radians(degree));


  rect(0, -200+R, 20, 20);
  rect(0, 200-R, 20, 20);

  degree+=2; 
  popMatrix();
  if (blink) {

    if (d) {
      fill(0);
      a+=speed;
      b-=speed;
      rect(0, a, width, height/2);
      rect(0, b, width, height/2);
      if (a==0) { 
        d=false;
        u=true;
      }
    }
    else if (u) {
      drawbackground();
      fill(0);
      a-=speed;
      b+=speed;
      rect(0, a, width, height/2);
      rect(0, b, width, height/2);
      if (a==-350) {
        blink=false;
        u=false;
      }
    }
  }
}
void mouseClicked() {
  blink=true;
  d=true;
}
void drawbackground() {
  strokeWeight(2);
  background(234, 33, 211);

  for (int x=0; x<702;x+=15) {
    line(width/2, height/2, 700, x/2);
    line(width/2, height/2, 700, 700-x/2);
    line(0, x/2, width/2, height/2);
    line(0, 700-x/2, width/2, height/2);
  }
  for (int i=0; i<24.5; i+=4) {
    stroke(237, 203, 10);
    fill(240, 245, 2);
    ellipse(height/2, width/2, 150, 150);
    strokeWeight(1);
    stroke(0);
    noFill();
    ellipse(height/2, width/2, x+pow(i, 2), x+pow(i, 2));
  }
}


