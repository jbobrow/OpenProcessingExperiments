
//Copyright Christopher Henley 2014
//ICE 21

final int MAX=6;
Figure fig[]=new Figure[MAX];
color bgColor=color(0,255,0);

void setup(){
  size(400,400);
  background(bgColor);
  ellipseMode(CENTER);
  rectMode(CENTER);
  initializeFigure();
}

void initializeFigure(){
  for (int i=0; i<fig.length; i++){
    fig[i]=new Figure(0,((height/(fig.length+1))*(i+1)),color(10*i,20*i,255/(i+1)));
  }
}
void draw(){
  prepareWindow();
  moveFigures();
}

void prepareWindow(){
  background(bgColor);
  drawRings((2*width/3),color(255,0,0));
  drawRings((width/3),color(0,0,255));
}

void drawRings(float d, color col){
  strokeWeight(2);
  fill(col);
  ellipse(width/2,height/2,d,d);
}

void moveFigures(){
  for (int i=0; i<fig.length; i++){
    fig[i].update();
    fig[i].reDraw();
  }
}

class Figure
{
  float xVal,yVal,diam,deltaX;
  color figColor;
  boolean ellip,dot,recta;
  
  Figure(float x,float y,color col){
    xVal=x;
    yVal=y;
    figColor=col;
    diam=40;
    deltaX=random(1,3);
  }
  
  void update(){
    xVal+=deltaX;
    if (xVal>width){
      deltaX=deltaX*-1;
    }
    if (xVal<0){
      deltaX=deltaX*-1;
    }
    color c=get(int(xVal),int(yVal));
    if (c==color(0,255,0)){
      dot=true;
      ellip=false;
      recta=false;
    }
    if (c==color(255,0,0)){
      dot=false;
      ellip=true;
      recta=false;
    }
    if (c==color(0,0,255)){
      dot=false;
      ellip=false;
      recta=true;
    }
  }
  
  void reDraw(){
    if ((dot)&&(!ellip)&&(!recta)){
      fill(0);
      ellipse(xVal,yVal,diam/4,diam/4);
    }
    if ((ellip)&&(!dot)&&(!recta)){
      fill(figColor);
      ellipse(xVal,yVal,diam,diam);
    }
    if ((recta)&&(!dot)&&(!ellip)){
      fill(figColor);
      rect(xVal,yVal,diam,diam);
    }
  }
}


