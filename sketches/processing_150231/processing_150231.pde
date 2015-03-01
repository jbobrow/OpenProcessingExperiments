
int ellipsex0 = 640;
int ellipsey0 = 360;
int ellipsew = 30;
int ellipseh = 30;
int speed = 30;
int red = color(200,0,0);
int white = color(255);
int black = color(0);

boolean kollision = false;

class Rechteck {
  int x0, y0, w, h;
  Rechteck() {
    x0=round(random(width));
    y0=round(random(width));
    w=round(random(20, 150));
    h=round(random(20, 150));
  }
  void update() {
    y0=y0+round(random(3, 10));
    if (y0>height) {
      y0=-100;
      x0=round(random(width));
    }
  }
  void draw() {
    fill(round(random(0, 255)), round(random(0, 255)), round(random(0, 255)));
    rect(x0, y0, w, h);
    stroke(white);
  }
}

Rechteck[] array=new Rechteck[round(random(15, 20))];


void setup() {
  size(1280, 720);
  for (int i=0; i<array.length; i++) {
    array[i]=new Rechteck();
  }
}


void draw() {
  background(0);
  for (int i=0; i<array.length; i++) {
    array[i].draw();
    array[i].update();
  }

  boolean kollision=false;
  for (int i=0; i<array.length; i++) {
    int x0=array[i].x0;
    int y0=array[i].y0;
    int w=array[i].w;
    int h=array[i].h;
    if (x0+w>ellipsex0) {
      if (x0<ellipsex0+ellipsew) {
        if (y0+h>ellipsey0) {
          if (y0<ellipsey0+ellipseh) {
            kollision=true;
          }
        }
      }
    }
  }
  if (kollision) {
    fill(red);
  } else {
    fill(white);
  }
  ellipse(ellipsex0, ellipsey0, ellipsew, ellipseh);
  ellipseMode(CENTER);
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      ellipsey0-=speed;
    } else if (keyCode == DOWN) {
      ellipsey0+=speed;
    }
  }
  if (key == CODED) {
    if (keyCode == LEFT) {
      ellipsex0-=speed;
    } else if (keyCode == RIGHT) {
      ellipsex0+=speed;
    }
  }
  if (key == 'w') {
    ellipsey0-=speed;
  } else if (key == 's') {
    ellipsey0+=speed;
  }
  if (key == 'a') {
    ellipsex0-=speed;
  } else if (key == 'd') {
    ellipsex0+=speed;
  }
  ellipsex0=constrain(ellipsex0, 0, width);
  ellipsey0=constrain(ellipsey0, 0, height);
}

