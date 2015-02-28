
//Copyright Christopher Henley 2014

float x,y;
float wd,ht;
float xDist;
float yDist;
float easCoef;
float clr1;
float clr2;
float clr3;

void setup(){
  size(400,400);
  pushMatrix();
  translate(width/2,height/2);
  background(0,0,0);
  wd=100;
  ht=100;
}

void draw(){
  easCoef=.1;
  xDist=mouseX-x;
  yDist=mouseY-y;
  x=x+xDist*easCoef;
  y=y+yDist*easCoef;
  clr1=random(0,255);
  clr2=random(0,255);
  clr3=random(0,255);
  noStroke();
  fill(0,0,0,25);
  rect(0,0,width,height);
  fill(clr1,clr2,clr3);
  //scale increase with left button
  if (mousePressed && (mouseButton==LEFT)){
    wd=wd+2;
    ht=ht+2;
  }
  //scale decrease with right button
  if (mousePressed && (mouseButton==RIGHT)){
    wd=wd-2;
    ht=ht-2;
  }
  ellipse(x,y,wd,ht);
  fill(0,0,0);
  ellipse(x,y,wd/2,ht/2);
  fill(clr1,clr2,clr3);
  ellipse(x,y,wd/3,ht/3);
  //arc(x,y,wd,ht,.1*PI,.9*PI,CHORD);
  //arc(x,y,wd,ht,PI*1.1,PI+.9*PI,CHORD);
}


