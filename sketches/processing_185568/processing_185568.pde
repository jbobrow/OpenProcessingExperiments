
pointCir[] _pointArr = {};
int _pointNum = 2;
int nowBallNum = -1;
boolean ballView = true;
void setup(){
  size(500,500);
  getPoint();
}

void draw(){
  background(255);

  fill(255,0,0);
  beginShape();
  PVector[][] NV = new PVector[_pointNum][3];
  for(int i = 0;i < _pointNum; i++){
  NV[i] = _pointArr[i].Noise();
  }
  vertex(_pointArr[_pointNum-1].v[2].x - NV[_pointNum-1][2].x,_pointArr[_pointNum-1].v[2].y - NV[_pointNum-1][2].y);
  for(int i = 0;i < _pointNum; i++){
    bezierVertex(_pointArr[i].v[0].x - NV[i][0].x,_pointArr[i].v[0].y - NV[i][0].y,_pointArr[i].v[1].x - NV[i][1].x,_pointArr[i].v[1].y - NV[i][1].y,_pointArr[i].v[2].x - NV[i][2].x,_pointArr[i].v[2].y - NV[i][2].y);
  }
  endShape();
  if(ballView){
    for(int i=0; i<_pointNum; i++){
      int i2 = i+1;
      if(i2>_pointNum-1){
        i2 = 0;
      }
       line(_pointArr[i].v[2].x,_pointArr[i].v[2].y,_pointArr[i2].v[0].x,_pointArr[i2].v[0].y);
       line(_pointArr[i].v[1].x,_pointArr[i].v[1].y,_pointArr[i].v[2].x,_pointArr[i].v[2].y);
      _pointArr[i].drawPoint(color(255,200,200*i));
    }
  }
}

void mouseDragged(){
  if(nowBallNum==-1){
    for(int i=_pointNum-1;i>=0; i--){
      _pointArr[i].research();
      if(_pointArr[i].ballSel>-1){
        _pointArr[i].pointDrag();
        nowBallNum = i;
        return;
      }
    }
  }else{
    _pointArr[nowBallNum].pointDrag();
  }
}

void mouseReleased(){
  if(nowBallNum>-1){
    println(" point["+nowBallNum+","+_pointArr[nowBallNum].ballSel+"]"+"(x,y) = "+"("+int(_pointArr[nowBallNum].v[_pointArr[nowBallNum].ballSel].x)+","+int(_pointArr[nowBallNum].v[_pointArr[nowBallNum].ballSel].y)+")");
    _pointArr[nowBallNum].ballSel = -1;
    nowBallNum = -1;
  }
}

void keyPressed(){
  if(key == ' '){
    ballView = !ballView;
  }
  if(key == '1'){
    pointCir thispoint = new pointCir(450, 50, 450, 150, 300, 300);
    _pointArr = (pointCir[])append(_pointArr, thispoint);
    _pointNum++;
    
  }
  
}

void getPoint() {
    pointCir thispoint = new pointCir(450, 50, 450, 150, 300, 300);
    _pointArr = (pointCir[])append(_pointArr, thispoint);
    pointCir thispoint2 = new pointCir(150, 150, 150, 50, 300, 50);
    _pointArr = (pointCir[])append(_pointArr, thispoint2);
}

class pointCir{
  
  PVector[] v = new PVector[3];
  int ballSel = -1;
  float noiseFactor = random(1,5);
  float noiseStep = 0.02;
  PVector[] nv = new PVector[3];
  
  pointCir(int x1, int y1, int x2, int y2, int x3, int y3){
     v[0] = new PVector(x1, y1);
     v[1] = new PVector(x2, y2);
     v[2] = new PVector(x3, y3);
     nv[0] = new PVector(x1, y1);
     nv[1] = new PVector(x1, y1);
     nv[2] = new PVector(x1, y1);
  }
  
  void drawPoint(color cl){
    for(int i = 0; i<v.length; i++){
      fill(cl);
      ellipse(v[i].x, v[i].y, 10, 10);
    }
  }
  
  void research(){
    if(ballSel == -1){
      for(int i=0; i<v.length; i++){
        if(dist(mouseX,mouseY,int(v[i].x),int(v[i].y))<10){
          ballSel = i;
        }
      }
    }
  }
  void pointDrag(){
      if(ballSel>-1){
        v[ballSel].x=mouseX;
        v[ballSel].y=mouseY;
        if(mouseX<0){v[ballSel].x=0;}
        if(mouseY<0){v[ballSel].y=0;}
        if(mouseX>width){v[ballSel].x=width;}
        if(mouseY>height){v[ballSel].y=height;}
     }
   }
   
   PVector[] Noise(){
     noiseFactor+=noiseStep;
     nv[0].x = (0.5-noise(noiseFactor))*100;
     nv[0].y = (0.5-noise(noiseFactor+20))*100;
     nv[1].x = (0.5-noise(noiseFactor+30))*100;
     nv[1].y = (0.5-noise(noiseFactor+40))*100;
     nv[2].x = (0.5-noise(noiseFactor+50))*100;
     nv[2].y = (0.5-noise(noiseFactor+60))*100;
     return nv;
   }
}
