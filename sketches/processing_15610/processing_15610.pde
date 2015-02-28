
int wCen,hCen,myCir,myR1,myR2,myR3;
int e=second();
int i=minute();
int o=hour();
PFont f;
void setup() {
  background(255);
  size(360,600);
  smooth();
  noCursor();
  f=loadFont("ARJULIAN-20.vlw");
  textFont(f);
}

void draw() {
  PImage img1;
  img1=loadImage("img1.jpg");
  image(img1,80,150,290,340);

  wCen=120;
  hCen=320;
  myCir=150;
  myR1=myCir/2 - 5;
  myR2=myCir/2 - 25;
  myR3=myCir/2 - 40;


  fill(0);
  noStroke();
  ellipse(120,320,myCir,myCir);
  float s=map(second(),0,60,0,TWO_PI)-HALF_PI;
  float m=map(minute(),0,60,0,TWO_PI)-HALF_PI;
  float h=map(hour()% 12,0,12,0,TWO_PI)-HALF_PI;


  stroke(255);
  strokeCap(BEVEL);
  strokeWeight(1);
  line(wCen,hCen,cos(s)*myR1+wCen,sin(s)*myR1+hCen);
  strokeWeight(3);
  line(wCen,hCen,cos(m)*myR2+wCen,sin(m)*myR2+hCen);
  strokeWeight(7);
  line(wCen,hCen,cos(h)*myR3+wCen,sin(h)*myR3+hCen);


  String time = nf(o,2)+":"+nf(i,2)+":"+nf(e,2);
  text(time,85,420);
}


