
float time_step=1;
float grav_konst=6.67;
float maxFg=13*time_step;
float xp;
float yp;

float m=10;

float xsp=10;
float ysp=0;

float px;
float py;

float pxsp=-10;
float pysp=0;

float pm=10;

float grid=1;

void setup(){
  size(800, 800, P2D);
  background(255);
  
  /*
  xp=width/2.0-(width/3)/4;
  yp=height/2.0-(height/3)/4;
  px=width/2.0+(width/3)/4;
  py=height/2.0+(height/3)/4;
  */
  /*
  xp=width/3.0;
  yp=height/3.0;
  px=width/2.0;
  py=height/2.0;
  */
  
  xp=random(width);
  yp=random(height);
  px=random(width);
  py=random(height);
  smooth();
  colorMode(HSB);
  frameRate(2000);
}

void draw(){
  calc();
  move();
  float colx=xsp;
  float coly=ysp;
  
  if(colx<=0) colx*=-1;
  if(coly<=0) coly*=-1;
  
  fill(colx+coly, 255, 255);
  noStroke();
  
  ellipse(xp, yp, 10, 10);
  ellipse(px, py, 10, 10);
  
}

void keyPressed(){
  if(key=='r'){
    setup();
  }
}

void calc(){
  float Fg;
  float dis=dist(xp, yp, px, py);
  Fg=grav_konst*((m*pm)/dis)*time_step;
  if(Fg>=maxFg) Fg=maxFg;
  float xe=px-xp;
  float ye=py-yp;
  
  
  float wx=acos(xe/dis);
  float wy=asin(ye/dis);
  
  
  
  float Fx=cos(wx)*Fg;
  float Fy=sin(wy)*Fg;
  
  
  xsp+=Fx;
  ysp+=Fy;
  
  xsp*=grid;
  ysp*=grid;
  
  
  

  xe=xp-px;
  ye=yp-py;
  
  
  wx=acos(xe/dis);
  wy=asin(ye/dis);
  
  
  
  Fx=cos(wx)*Fg;
  Fy=sin(wy)*Fg;
  
  
  pxsp+=Fx;
  pysp+=Fy;
  
  pxsp*=grid;
  pysp*=grid;
  
  px+=pxsp*time_step;
  py+=pysp*time_step;
}

void move(){
  xp+=xsp*time_step;
  yp+=ysp*time_step;
}
