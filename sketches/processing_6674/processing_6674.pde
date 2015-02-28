
float as, am, ah;
PImage hs,hm,hh,bg;


void setup() {
  size(800,560);
  smooth();
  hs = loadImage("second.png");
  hm = loadImage("minute.png");
  hh = loadImage("hour.png");
  bg = loadImage("bg1.jpg");

}

void draw() {
  background(bg);
  pushMatrix();
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
  image(hs, -6, -16);
  popMatrix();

  pushMatrix();
  rotate(am-PI);
  image(hm, -6, 2.6);
  popMatrix();

  pushMatrix();
  rotate(ah-PI);
  image(hh, -8, 2.6);
  popMatrix();
  
popMatrix();
  //println(s);
  //println(m);
  //println(h);




}



