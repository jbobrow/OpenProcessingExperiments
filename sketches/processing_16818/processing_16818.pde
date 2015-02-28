
int wCen,hCen,myCir, myR1, myR2, myR3;    
PImage a,b,c,d,e;

void setup() {
  size(295,445);
  smooth();
  noStroke();
  a= loadImage("1.png");
  b= loadImage("2.png");
  c= loadImage("3.png");
  d= loadImage("4.png");
  e= loadImage("5.png");
} 

void draw() {
  image(a,0,0,295,445);
  image(e,0,330,295,120);
  //
  wCen=146;   
  hCen= 223;   
  myCir=230;   

  float s = map(second(),0,60,0,TWO_PI) - HALF_PI;  
  float m = map(minute(),0,60,0,TWO_PI) - HALF_PI;  
  float h =map(hour()%12,0,12,0,TWO_PI) - HALF_PI;   

  stroke(211,70,22);   
  strokeWeight(1);  
  strokeWeight(4);  
  pushMatrix();
  translate(wCen,hCen);
  rotate(radians(minute()*6-90));
  image (c,0,0);  
  popMatrix();
  pushMatrix();
  translate(wCen,hCen);
  rotate(radians(hour()*30-120));
  image (b,0,0);
  popMatrix();  
  image(d,cos(s)*81+90,sin(s)*81+90,70,50); 
  //cos(m)*76+44,sin(m)*76+44

  int p = second();  
  int o = minute();  
  int u = hour();  
  fill(249,118,21);  
  String time = nf (u,2)+":"+ nf(o,2)+":"+nf(p,2);  
  text(time, 120,490);  

  float n = map(hour(),0,24,0,360);      
  line (n,560,n,560);
}


