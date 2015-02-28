
//Copyright Christopher Henley

float x,y,dx,wd,ht;
color bgColor,ellipseColor;

void setup(){
  size(400,400);
  background (0);
  x=0;
  y=height/2;
  wd=39;
  ht=29;
  dx=1;
  
  bgColor=color(0,25);
  ellipseColor=color(255,0,0);
  noStroke();
}

void draw(){
  prepareWindow();
  moveEllipse();
  drawEllipse();
}

void prepareWindow(){
  fill(bgColor);
  rect(0,0,width,height);
}

void drawEllipse(){
  fill(ellipseColor);
  ellipse(x,y,wd,ht);
}

void moveEllipse(){
  x+=dx;
  if (x>(width-wd/2)){
    dx=-1;
  }
  else if (x<wd/2){
    dx=1;
  }
}


