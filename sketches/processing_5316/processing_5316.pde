
float as, am, ah;
PImage hs,hm,hh;


void setup() {
  size(400,400);
  smooth();
  hs = loadImage("second.png");
  hm = loadImage("minute.png");
  hh = loadImage("hour.png");
}

void draw() {
  background(255);
  translate(width/2,height/2);

  noStroke();



  int s = second();
  int m = minute();
  int h =hour();

  as = map (s, 0, 60, 0, TWO_PI);
  am = map (m, 0, 60, 0, TWO_PI);
  ah = map (h%12, 0, 12, 0, TWO_PI);

  //as =am =ah =0;

  pushMatrix();
  rotate(as-PI);
  image(hs, -10, -30);
  popMatrix();

  pushMatrix();
  rotate(am-PI);
  image(hm, -10, 5);
  popMatrix();

  pushMatrix();
  rotate(ah-PI);
  image(hh, -15, 5);
  popMatrix();

  println(s);
  println(m);
  println(h);




}



