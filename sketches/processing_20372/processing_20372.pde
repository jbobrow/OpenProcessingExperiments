
float glowActual;
float sun;
PImage b; 
PShape t;

void setup() {
  size (640,480);
  background (0);

  b= loadImage ("glow.PNG");

  t = loadShape ("time.svg");
  PFont font  = loadFont ("C.vlw");
  textFont (font,32);
  frameRate(30);
}
void draw() {
  int s =second();
  float s1=map(s,0,60,0,360); 
  int m =minute();
  float m1=map(m,0,60,0,360);
  int h =hour();
  int ha = hour()%12;
  int hb = hour()%12;
  if(h==0 && ha==0)
  {hb=12;}
  if(h==12 && ha==0)
  {hb=12;}
  
  float h1 =map(h,0,24,0,255);
  float q=random(630,640);
  float w=random(470,480);



  background (0);

  glowActual += (s1 - glowActual) * .1;
  sun += (h1+ - sun) *.1;



  //*
 


  noStroke();
  smooth();
  ellipseMode(CENTER);
  fill (255,290-sun,3);
  ellipse (320,240,100+(sun/10),100+(sun/10));


  image (b,0,0,q,w); 
  tint (255,glowActual);



  ellipseMode(CENTER);
  fill (glowActual-100,55,50);
  pushMatrix();
  translate (width/2, height/2);
  rotate (radians(m1-90));
  noStroke();
  smooth ();
  ellipse (145,0,40,40);
  popMatrix();
  //*/

  pushMatrix();
  fill (255,255,255);
  translate (width/2, height/2);
  rotate (radians(s1-90));
  noStroke();
  smooth ();
  ellipse (228,0,10,10);
  popMatrix();


  if (mousePressed) {
    shape (t,0,0,640,480);
    fill(255);
    text (hb,width/2+75,height/2+10);
    text (":",width/2+115,height/2+7);
    text (m,width/2+130,height/2+10);
    text (":",width/2+180,height/2+7);
    text (s,width/2+210,height/2+10);
  }
}


