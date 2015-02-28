
PImage img;
int direction =1;

float signal;

void setup(){
  size(555, 555);

img = loadImage("sky.jpg");
stroke(333, 222, 111);
strokeWeight(3);
frameRate(30);
}

void draw(){  if (signal > img.width*img.height-1 || signal < 0) { 
    direction = direction * -1; 
  }

  if (mousePressed) {
    int mx = constrain(mouseX, 0, img.width-1);
    int my = constrain(mouseY, 0, img.height-1);
    signal = my*img.width + mx;
  } else {
    signal += 0.33*direction;
  }

  int sx = int(signal) % img.width;
  int sy = int(signal) / img.width;

  if (keyPressed) {
    set(0, 0, img);  // fast way to draw an image
    point(sx, sy);
    rect(sx - 5, sy - 5, 11, 11);
  } else {
    color c = img.get(sx, sy);
    background(c);
  }
  image(img, 0, 0);

int q = 11;
int w = 22;
int e = 33;
int r = 44;

line(q, w, e, r);
line(q, w, e, r);
line(q, w, e, r);
line(q, w, e, r);
line(q, w, e, r);

line(q+111, w, e, r);
line(q+222, w, e, r);
line(q+333, w, e, r);
line(q+444, w, e, r);
line(q+555, w, e, r);

line(q, w+111, e, r);
line(q, w+222, e, r);
line(q, w+333, e, r);
line(q, w+444, e, r);
line(q, w+555, e, r);

line(q, w, e+111, r);
line(q, w, e+222, r);
line(q, w, e+333, r);
line(q, w, e+444, r);
line(q, w, e+555, r);

line(q, w, e, r+111);
line(q, w, e, r+222);
line(q, w, e, r+333);
line(q, w, e, r+444);
line(q, w, e, r+555);

}


