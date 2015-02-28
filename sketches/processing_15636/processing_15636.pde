

int wCen,hCen,myCir,myR1,myR2,myR3;
PFont f;
PImage img1, img2, img3 ;

void setup() {
  
  img1=loadImage("img1.png");
  img2=loadImage("img2.png");
  img3=loadImage("img3.png");
  
  f=loadFont("Through_Wood(new)-48.vlw");
  textFont(f);

  size(360,600);
  stroke(255);
  smooth();
  noCursor();
}

void draw() {
  
 
  
  background(130,184,247);
  wCen=width/2;
  hCen=height/2;
  myCir=200;
  myR1=myCir/2 - 5;
  myR2=myCir/2 - 25;
  myR3=myCir/2 - 40;

  fill(255);
  noStroke();
  ellipse(90,220,100,100);
  ellipse(270,220,100,100);
  ellipse(wCen,hCen,myCir,myCir);
  float s=map(second(),0,60,0,TWO_PI)-HALF_PI;
  float m=map(minute(),0,60,0,TWO_PI)-HALF_PI;
  float h=map(hour()% 12,0,12,0,TWO_PI)-HALF_PI;

  stroke(0);
  strokeCap(BEVEL);
  strokeWeight(1);
  line(wCen,hCen,cos(s)*myR1+wCen,sin(s)*myR1+hCen);
  strokeWeight(3);
  line(wCen,hCen,cos(m)*myR2+wCen,sin(m)*myR2+hCen);
  strokeWeight(7);
  line(wCen,hCen,cos(h)*myR3+wCen,sin(h)*myR3+hCen);

  imageMode(CENTER);
 
 
  int e=second();
 int i=minute();
 int o=hour();
 
 String time = nf(o,2)+":"+nf(i,2)+":"+nf(e,2);
 
  textAlign(CENTER);
 text(time,180,450);
 
 
 ellipse(180,300,20,20);
 
 image(img1,30,50);
 image(img2,230,120);
 image(img3,300,570);

}

