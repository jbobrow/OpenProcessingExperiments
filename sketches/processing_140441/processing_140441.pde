
//Copyright Christopher Henley 2014
/*
Screensaver: press space to reinitialize the screen save, or
any other key to exit
*/

int number=25;
int boundBox=150;
int xCenter,yCenter;
boolean initialize=true;
float maxFigSize=50;

float XVals[]=new float[number];
float YVals[]=new float[number];
float deltaX[]=new float[number];
float deltaY[]=new float[number];
float figSize[]=new float[number];
color figColor[]=new color[number];

color bgColor=color(255);
color gradientCol;

void setup(){
  size(600,400,P2D);
  xCenter=int(width/2);
  yCenter=int(height/2);
}

void draw(){
  initialize();
  prepareWindow();
  drawFigure();
  moveFigure();
  colisionCheck();
}

void initialize(){
  if (initialize==true){
    gradientCol=color(random(255),random(255),random(255));
    for(int i=0; i<number; i++){
      XVals[i]=random(xCenter-boundBox,xCenter+boundBox);
      YVals[i]=random(yCenter-boundBox,yCenter+boundBox);
      deltaX[i]=random(-2,2);
      deltaY[i]=random(-2,2);
      figSize[i]=random(5,maxFigSize);
      figColor[i]=color(random(0,250),random(0,255),random(0,250));
    }
  }
  initialize=false;
  
}

void prepareWindow(){
  background(bgColor);
  for(int i=0; i<20; i+=2){
    fill(gradientCol-(i*5));
    ellipse(xCenter,yCenter,width-i*10,width-i*10);
  }
  println("Frame Rate: "+frameRate);
}
 
void drawFigure(){
  for(int i=0; i<number; i++){
    strokeWeight(1);
    stroke(figColor[i]);
    line(xCenter,yCenter,XVals[i],YVals[i]);
    makeTriangle(XVals[i],YVals[i],figSize[i],figColor[i]);
  }
}

void makeTriangle(float x, float y, float diam, color col){
  noStroke();
  fill(0);
  ellipse(x,y,diam,diam);
  fill(col);
  beginShape();
    for (int i=0; i<360; i+=15){
      vertex(x+(diam/3*cos(radians(i))),y+(diam/3*sin(radians(i))));
    }
  beginContour();
    vertex(x,y-diam/3);
    vertex(x+diam/3*cos(radians(30)),y+diam/3*sin(radians(30)));
    vertex(x-diam/3*cos(radians(30)),y+diam/3*sin(radians(30)));
  endContour();
  endShape(CLOSE);
  
}

void moveFigure(){
  for(int i=0; i<number; i++){
    XVals[i]+=deltaX[i];
    YVals[i]+=deltaY[i];
    if(XVals[i]>width-figSize[i]/2){
      deltaX[i]=random(-2,0);
    }
    if(XVals[i]<0+figSize[i]/2){
      deltaX[i]=random(0,2);
    }
    if(YVals[i]>height-figSize[i]/2){
      deltaY[i]=random(-2,0);
    }
    if(YVals[i]<0+figSize[i]/2){
      deltaY[i]=random(0,2);
    }
  }
}

void colisionCheck(){
  float c=.5;
  for(int a=0; a<number; a++){
    for(int b=0; b<number && b!=a; b++){
      if(dist(XVals[a],YVals[a],XVals[b],YVals[b])<(figSize[a]/2)+(figSize[b]/2)){
        deltaX[a]=deltaX[a]*-1;
        deltaX[b]=deltaX[b]*-1;
        deltaY[a]=deltaY[a]*-1;
        deltaY[b]=deltaY[b]*-1;
        if (deltaX[a]>0){
          XVals[a]+=c;
          XVals[b]-=c;
        }else 
        XVals[a]-=c;
        XVals[b]+=c;
        if (deltaY[a]>0){
          YVals[a]+=c;
          YVals[a]-=c;
        }else
        YVals[a]-=c;
        YVals[b]+=c;
      }
    }
  }
}

void keyPressed(){
  if (key==' '){
    initialize=true;
  }
  else 
  exit();
}


