
int j=0;
int y=0;
float r=0;
int sweeps=0;

void setup () {
  size (900,700);
  smooth();
  //noStroke();
  background (0, 180, 234);
  //rectMode(CENTER);
}

void draw () {

  translate (j, y);
  rotate (r);
  translate (-j, -y);

  j=j+10;
  //println (j);
  //rectangle loop
  for (int i=0; i<=100; i=i+20) {

    //println (i);
    fill (random(256), random(256), random(256));
    rect (i+j, i+y, 10, 1000);
  }
  if (j>width) {
    j=-100;
    y= int( random(0, height));
    sweeps= sweeps+1;
    if (sweeps==6) {
      sweeps=0;
      background (0, 180, 234);
    }
  }
  r=r+PI/69;
}


