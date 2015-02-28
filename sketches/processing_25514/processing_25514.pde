

PImage[] sittingguy = new PImage[7];
PImage[] sleepingguy = new PImage[7];
PImage[] fontjump = new PImage[7];
int dx, x,  d;

void setup() {
  size(1012, 450); 
  smooth();
  x = 0;
  for (int i=0; i<7; i++) {
    sittingguy[i] = loadImage("sittingguy-"+"0"+(i+1)+".png");
    sleepingguy[i] = loadImage("sleepingguy-"+"0"+(i+1)+".png");
    fontjump[i] = loadImage("fontjump-"+"0"+(i+1)+".png");
  }

  println(sittingguy);
}


void draw() {

  background(255);

  //dx = int(map(mouseX, 0, width, 0, 7));
  if (x < dx) x++;
  if (x > dx) x--;
  d = int(map(mouseX, 0, width, 0, width + 80));
  println(x);

  image(sittingguy[x], 0, 0);
  image(sleepingguy[x], 0, 0);
  image(fontjump[6-x], 0, 0);
  noStroke();
  //rect(d, 200, width, 200);
}


void mousePressed() {
  if (dx==0) { 
    dx = 5;
  } 
  else { 
    dx=0;
  }
}


