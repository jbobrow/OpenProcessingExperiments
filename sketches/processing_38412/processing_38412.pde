
float x=100;
float y=50;
float xm=0;
float ym=0;
float yg=.1;
float xg=.1;
float ys;
float xs;
float bs;
float q=0;

void setup(){
  size(1000,1000);
  smooth();
  background(0);
}

void draw(){
  x=x+xm;
  y=y+ym;
  ym=ym+yg;
  xm=xm+xg;
  ys=50-ym;
  xs=50-xm;
  bs=(xs+ys)/2;
  q=45;
  
  translate(width/2,0);
  rotate(radians(q));
  rectMode(CENTER);
  fill(0,10);
    rect(700/2,700/2,700,700);
  
  
  stroke(255,153);
  fill(255,153);
  ellipse(x,y,30,30);
  if(y>700-15){
    ym=-ym;
  }
  if(y<0+15){
    ym=-ym;
  }
  if(x>700-15){
    xm=-xm;
  }
  if(x<0+15){
    xm=-xm;
  }
}

