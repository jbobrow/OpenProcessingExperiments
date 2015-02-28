
PFont myFont;
float s;
float t;
float a;
float r;
float b;
float u;
float c;
float k;
float s1;
float c1;
float o;
float f;
float f1;
float e;
float e1;
float l;
void setup(){
  size(510,180);
  myFont = loadFont("GillSans-Bold-90.vlw");
}

void draw(){
  background(0,103,81);
  textFont(myFont);
  stroke(255);
  strokeWeight(l);
  line(0,20,600,20);
  line(0,160,600,160);
  fill(255);
  textSize(30+s);
  textAlign(CENTER,CENTER);
  text("S",30,80);
  textSize(30+t);
  textAlign(CENTER,CENTER);
  text("T",60,80);
  textSize(30+a);
  textAlign(CENTER,CENTER);
  text("A",90,80);
  textSize(30+r);
  textAlign(CENTER,CENTER);
  text("R",120,80);
  textSize(30+b);
  textAlign(CENTER,CENTER);
  text("B",150,80);
  textSize(30+u);
  textAlign(CENTER,CENTER);
  text("U",180,80);
  textSize(30+c1);
  textAlign(CENTER,CENTER);
  text("C",210,80);
  textSize(30+k);
  textAlign(CENTER,CENTER);
  text("K",240,80);
  textSize(30+s1);
  textAlign(CENTER,CENTER);
  text("S",270,80);
  textSize(30+c);
  textAlign(CENTER,CENTER);
  text("C",330,80);
  textSize(30+o);
  textAlign(CENTER,CENTER);
  text("O",360,80);
  textSize(30+f);
  textAlign(CENTER,CENTER);
  text("F",390,80);
  textSize(30+f1);
  textAlign(CENTER,CENTER);
  text("F",420,80);
  textSize(30+e);
  textAlign(CENTER,CENTER);
  text("E",450,80);
  textSize(30+e1);
  textAlign(CENTER,CENTER);
  text("E",480,80);
}

void mousePressed(){
  l = random(15);
  s = random(0,90);
  t = random(0,90);
  a = random(0,90);  
  r = random(0,90);
  b = random(0,90);
  u = random(0,90);
  c = random(0,90);
  k = random(0,90);
  s1 = random(0,90);
  c1 = random(0,90);
  o = random(0,90);
  f = random(0,90);
  f1 = random(0,90);
  e = random(0,90);
  e1 = random(0,90);
}

