
int wCen,hCen,myCir, myR1, myR2, myR3;   
PImage img1, img2;  
PFont f;

void setup() {
  size(360,600); 
  stroke(255); 
  smooth();
  f = loadFont ("AmiR-HM-48.vlw");
  textFont(f);
}

void draw() {
  img1 = loadImage("8.jpg");  
  img2= loadImage("Untitled-99.gif"); 
  image(img1,0,0);

  wCen=183; 
  hCen= 305; 
  myCir=230; 
  myR1=myCir/2-2;
  myR2= myCir/2 -20; 
  myR3= myCir/2-40;
  fill(0);
  noStroke();
  ellipse(wCen,hCen,70,70); 
  fill(211,70,22); 
  ellipse(wCen,hCen,15,15);
  float s = map(second(),0,60,0,TWO_PI) - HALF_PI;
  float m = map(minute(),0,60,0,TWO_PI) - HALF_PI;
  float h =map(hour()%12,0,12,0,TWO_PI) - HALF_PI; 

  image( img2, cos(s) * myR1 + 130, sin(s) * myR1+250,100,100);
  stroke(211,70,22); 
  strokeWeight(1);
  strokeWeight(4);
  line (wCen,hCen,cos(m)*myR2+wCen,sin(m)*myR2+hCen);
  line (wCen,hCen,cos(h)* myR3+wCen,sin(h)*myR3+hCen);

  int p = second();
  int o = minute();
  int u = hour();
  fill(249,118,21);
  String time = nf (u,2)+":"+ nf(o,2)+":"+nf(p,2);
  text(time, 120,490);

  int d = day();
  int k = month();
  int y = year();
  String date = nf (y,2)+"."+ nf(k,2)+"."+nf(d,2);
  fill(81,155,144); 
  text(date, 110,150);
  text("Happy Day!",100,100);

  line (0,550,360,550);
  strokeWeight(1);
  stroke(81,155,144);
  line (0,560,360,560);

  stroke(226,148,55);
  strokeWeight(5);
  float g = map(second(),0,60,0,360);
  line (0,549,g,549);
  stroke(107,169,193);      
  strokeWeight(1);
  float b = map(minute(),0,60,0,360);
  line (0,559,b,559);
  stroke(107,169,193);
  strokeWeight(8);
  float n = map(hour(),0,24,0,360);    
  line (n,560,n,560);
}


