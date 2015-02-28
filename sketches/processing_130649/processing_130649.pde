
int _xstep =5 ;
int _ystep = 5;
Circle[] _circleArr = {};
int _numX, _numY;
float maxDist;

void setup() {
  background(130,255,200);
  size(640, 480); 
  _numX = int(1.4*width/_xstep);
  _numY = int(height/_ystep);
  smooth();
  colorMode(HSB);
  drawCircle();
  rectMode(CENTER);
  frameRate(30);
   for (int i=0; i < _numX * _numY; i++) {
    _circleArr[i].Dist(mouseX,mouseY);
  }
}

void draw() {
  background(130,255,200);
   for (int i=0; i < _numX * _numY; i++) {
       _circleArr[i].Distkousin(mouseX,mouseY);
  }
  for (int i=0; i < _numX * _numY; i++) {
    _circleArr[i].drawMe();
  }
}

/*void mousePressed(){
    
       for (int i=0; i < _numX * _numY; i++) {
    _circleArr[i].Dist(mouseX,mouseY);
  }
}*/

void drawCircle() {
  int x0=0;
  int y0=0;
  for (int i=0; i < _numX; i++) {
    x0 = i*_xstep;
    for (int j=0; j < _numY; j++) {
      y0 = j*_ystep;
      Circle thisCirc = new Circle(x0, y0, i, j);
      noStroke();
      thisCirc.drawMe();
      _circleArr = (Circle[])append(_circleArr, thisCirc);
    }
  }
}

class Circle {
  int x, y;
  color myPhotoColor;
  float[] rot = {};
  float[] d={};
  float[] plus={};
     float a=1.35;
    float b=1.15;
    float c=0.5;
    float[] r={};
  Circle (int x1, int y1, int i, int j) {
    x = x1;
    y = y1;
  }


  void Dist(float bx,float by) {
   float d02 = dist(x,y,bx,by)/10;
   float rot02 = atan2(-by+y,-bx+x);
   float r02=(a+c+(c-a)*cos(rot02))/2;
   d = (float[])append(d , d02);
   plus = (float[])append(plus , 0);
   rot = (float[])append(rot , rot02);
   r = (float[])append(r , r02);
  }
  
   void Distkousin(float bx,float by) {
   float d02 = dist(x,y,bx,by)/10;
   float rot02 = atan2(-by+y,-bx+x);
   float r02=(a+c+(c-a)*cos(rot02))/2;
   if(d.length > 0){
   d[d.length-1] =  d02;
   rot[rot.length-1] = rot02;
   r[r.length-1]=r02;

   }
  }

  void drawMe() {
    fill(130,255,255, 150);
    pushMatrix();
    translate(mouseX,mouseY);
    for(int k=0;k<d.length;k++){
    rotate(rot[k]);
    translate((d[k]*10+5*sin(d[k]+plus[k]))*sqrt((r[k]*r[k]+b*b/4*cos(rot[k])*cos(rot[k]))),0);
    plus[k]-=0.6;
    }
    rect(0,0,5,5);
    popMatrix();
  }
}


