
/*
A simple drawing tools. 
Hit the following key to change layer
p --> poly layer (start up color)
1 --> metal 1
2 --> metal 2
BACKSPACE --> delete last action
cl --> clear all
There is much more work required to make it a better editor...
This is just the begining...
*/

int gridX=50, gridY=50, width=1000, height=700;
float percentLegion=0.2;
float resnGrid=min(width/gridX,height/gridY);
float currentWidth=resnGrid;

boolean gridDrawBegin=false;
int   msgState=0; 
//0-->when startup, 1-->when c pressed, 2-->after l pressed

color poly=#098E0E, m1=#1925A2, m2=#D30D3B;
color gray=#7C6F72, white=#EDEBEB;
color currentColor;


float[] startPt   =new float[2];
float[] stopPt    =new float[2];
float[] snapPt    =new float[2];
float[] tempPt    =new float[2];
 
ArrayList<gridLine> gridLines; 
remarksBox    rB; 
gridLines     gL;
legionBox     lB;
drawBox       dB;

PImage f;


class gridLines { 
  ArrayList<gridLine> gridLines;  
  gridLines() {  
    gridLines = new ArrayList<gridLine>();
  } 
  
  void add(gridLine gL) { 
    gridLines.add(gL);
  }  
  
  void update(){
    for (int i = gridLines.size()-1; i >= 0; i--) {
      gridLine L = gridLines.get(i);
      L.update();
    }    
  }
  
  void pop(){
    if (gridLines.size()==0){
      gridDrawBegin=false;
    }
    if (gridLines.size()>0) {
      int m=gridLines.size()-1;
      gridLine L=gridLines.get(m);
      startPt[0]=L.xStart; startPt[1]=L.yStart;
      currentColor=L.cL;
      gridLines.remove(m);     
    }
  }
  
  void flush(){
    for (int i = gridLines.size()-1; i >=0 ; i--) {
      gridLines.remove(i);
      gridDrawBegin=false;
    } 
  }
  
  int size(){
    return gridLines.size();
  }
   
}
 
class gridLine { 
  float xStart,yStart,xEnd,yEnd;
  float wL;  
  color cL;
  gridLine(float x1,float y1, float x2, float y2, color c,float w) {  
    xStart=x1; yStart=y1; xEnd=x2; yEnd=y2; cL=c; wL=w;
  } 
  void update() { 
    stroke(cL);
    strokeWeight(wL);
    line(xStart, yStart, xEnd, yEnd); 
  } 
 
}

void registerLine(){
      stopPt=returnPt();
      snapPt=snapGrid(startPt[0], startPt[1], stopPt[0],stopPt[1]);
      gL.add(new gridLine(startPt[0], startPt[1], snapPt[0], snapPt[1],currentColor,currentWidth));
      //println(gL.size());
      startPt=snapPt;
}
 
class remarksBox {
  String s0="Welcome to Stick Diagramme. Click to start drawing...";
  String s1="Click to start drawing...";
  String s2="ENTER to end drawing, Click to continuous drawing...";  
  String s3="Press l to confirm clear all...";  
  String sBox;
  float x=3*resnGrid; 
  float y=8*resnGrid;
  remarksBox(){
  }

  void update() {
      fill(currentColor);    
      textSize(1*resnGrid); 
      text("'p' poly   '1' metal1   '2' metal 2   'cl' clear all   'backspace' clear",x,5*resnGrid);
      textSize(2*resnGrid); 
      switch(msgState) {
      case 0:  sBox=s0; break;
      case 1:  sBox=s1; break;
      case 2:  sBox=s2; break;
      case 3:  sBox=s3; break;
      default:
      }

      text(sBox, x,y);
  }

} 

class legionBox {
  float w=2*resnGrid;
  legionBox(){
  }
  void update() {
    fill(white);
    strokeWeight(0);
    rect(0,0,width, percentLegion*height);
    fill(poly);  rect(3*resnGrid, 1*resnGrid, w, w);    text("poly",   5*resnGrid, 2.5*resnGrid);
    fill(m1);    rect(13*resnGrid, 1*resnGrid, w, w);   text("metal1",15*resnGrid, 2.5*resnGrid);
    fill(m2);    rect(23*resnGrid, 1*resnGrid, w, w);   text("metal2",25*resnGrid,2.5*resnGrid);
  }
} 

class drawBox {
  drawBox(){
  }
  void update() {
    strokeWeight(1);
    fill(gray);
    rect(0,percentLegion*height-0.5*resnGrid,width, height);
    image(f, 0,percentLegion*height-0.5*resnGrid,width, height);
  }
} 

void setup() {
  size(width,height);  
  currentColor = poly;  
  gL=new gridLines();
  msgState=0;
  rB=new remarksBox();
  lB=new legionBox();
  dB=new drawBox();
  f=loadImage("p.gif");
}

void draw() {
  
  dB.update();
  //stroke(currentColor);
  //strokeWeight(resnGrid);
  if (gridDrawBegin==true){
    msgState=2;
    tempPt=returnPt();
    snapPt=snapGrid(startPt[0], startPt[1], tempPt[0], tempPt[1]);
    stroke(currentColor);
    strokeWeight(resnGrid);
    line(startPt[0], startPt[1], snapPt[0], snapPt[1]);
  }

  gL.update();
  lB.update();
  rB.update();

}

float[] returnPt(){ 
  float[] temp = new float[2];
  temp[0]=returnGrid(mouseX);
  temp[1]=constrain(returnGrid(mouseY),percentLegion*height+1,height);
  return temp;
} 

float returnGrid(float x){ 
  float temp;
  temp=x-(x%resnGrid)+0.5*resnGrid;
  return temp;
} 

float[] snapGrid(float x1,float y1, float x2, float y2){ 
  float[] temp = new float[2];
  float dx, dy;
  dx = x2-x1; dy=y2-y1;
  temp[0]=x2; temp[1]=y2;
  if (abs(dy)<abs(dx)) {temp[1]=y1;}
  else       {temp[0]=x1;}
  return temp;
} 



void keyPressed() {
    if (keyCode == ENTER && gridDrawBegin==true ) {
      registerLine();
      gridDrawBegin=false;
      msgState=1;
    } 
    if (keyCode == 8 ) {
      gL.pop();
    } 
    if (key == 'l' && msgState==3 ) {
      msgState=1;
      gL.flush();
    }    
    switch(key) {
    case 'c': 
      msgState=3;        break;
    case 'p': 
      currentColor=poly; break; 
    case '1': 
      currentColor=m1;   break;
    case '2': 
      currentColor=m2;   break;
    default:
      msgState=1;
    }
    
}

void mousePressed() {
      if (gridDrawBegin == false) {
        startPt=returnPt();
        gridDrawBegin=true;
      }
      else{
        registerLine();
      }
}






