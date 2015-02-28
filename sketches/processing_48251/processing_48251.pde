

int _maxShapes=40;
int _numShapes=_maxShapes;
 
int _width=900;
int _height=900;
int MAXRAD=300;
int counter=1;
 
int _skip=0;
int _count=0;
 
float centre_x1=-_width/2;
float centre_y1=_height/2;
 
float centre_x2=1;
float centre_y2=_height/2;
float centre_x3=_width/2;
float centre_y3=_height/2;
float centre_x4=_width;
float centre_y4=_height/2;
float centre_x5=3*_width/2;
float centre_y5=_height/2;
boolean clearscreen=false;
 
int increment=1;
 
myShape [] _myShapes = new myShape[_numShapes];
 
void setup(){
 
  size (_width,_height);
  background (255);
  frameRate(60);
 
 

  strokeWeight(0);
  smooth();
 
  for(int i=0; i<_numShapes; i++) {
    _myShapes[i] = new myShape(i);
  }
 
}
 
 
void draw() {
 
 
 
 
  for(int i=0; i<_numShapes; i++) {
//    _myShapes[i].drawShape();
    _myShapes[i].moveShape();
  }
 
  if (_count<_skip){
    _count++;
  } else {
    
    if (clearscreen){
      background(255);
    }
    
    _count=0;
 
    // Check for shapes crossing
    for (int i=0; i<_numShapes; i++){
      float x1=_myShapes[i].getx();
      float y1=_myShapes[i].gety();
      float r1=_myShapes[i].getrad();
  
      for (int k=0; k<_numShapes; k++){
 
        // don't check the same shape
        if (i==k) { continue;}
 
        float x2=_myShapes[k].getx();
        float y2=_myShapes[k].gety();
        float r2=_myShapes[k].getrad();
 
        // no need to check for shapes of the same size with the same centre
        if (x1==x2 && y1==y2 && r2==r1) {continue;}    
     
        float d=dist(x1,y1,x2,y2);
 
        // if further apart than the sum of the two radii then dont bother either
        if (d>(r2+r1)) {continue;}    
     
        float K=sqrt((((r1+r2)*(r1+r2))-d*d)*(d*d-((r1-r2)*(r1-r2))))/4;
    
        float Tx1=(x2+x1)/2;
        float Tx2=((x2-x1)*(r1*r1-r2*r2))/(d*d*2);
        float Tx3=(2*(y2-y1)*K)/(d*d);
 
        float Ty1=(y2+y1)/2;
        float Ty2=((y2-y1)*(r1*r1-r2*r2))/(d*d*2);
        float Ty3=(2*(x2-x1)*K)/(d*d);
 
        float X1=Tx1+Tx2+Tx3;
        float X2=Tx1+Tx2-Tx3;
        float Y1=Ty1+Ty2+Ty3;
        float Y2=Ty1+Ty2-Ty3;
 
        // Do something at the point of interaction

        if(counter>=1 && counter<=1200){
          
          drawLines_1(X1,Y1,X2,Y2); 
          
        } else if (counter>1200 && counter<=2400){

          drawShapes_1(X1,Y1,X2,Y2);

        } else if (counter>2400 && counter<=3600){

          drawCircles_1(X1,Y1,X2,Y2);

        } else if (counter>3600 && counter<=4800){

          drawCirclesLines_1(X1,Y1,X2,Y2);

        } else if (counter>4800 && counter<=6000){

          drawCirclesLines_2(X1,Y1,X2,Y2,x1,y1,x2,y2);

        } else if (counter>6000 && counter<=7200){

          drawLines_2(X1,Y1,X2,Y2,x1,y1,x2,y2);

        } 
      }
    }
  }

//  if (counter%1200==0) {saveFrame();}

    
  counter++;
  if (counter>7200){background(255);counter=1;}

  // increment the counter for moving line ends across the screen  
  drawLines_inc_1();
}



//---------------------------------------------------------------
void drawLines_2(float X1,float Y1,float X2,float Y2,float x1,float y1,float x2,float y2) {

  _numShapes=15;
  clearscreen=false;     

  stroke(0,0,150,5);
  line(x1,y1,X1,Y1);
  line(x2,y2,X2,Y2);
  line(x2,y2,X1,Y1);
  line(x1,y1,X2,Y2);
}
//---------------------------------------------------------------
void drawCirclesLines_2(float X1,float Y1,float X2,float Y2,float x1,float y1,float x2,float y2) {

  _numShapes=30;

  clearscreen=true;     
  fill(0,0,150,100);
  strokeWeight(0.25);
  stroke(0,0,150,30);
  float da=dist(X1,Y1,X2,Y2);
  ellipse(X1,Y1,da/2,da/2);
  stroke(0,0,150,100);
  fill(0,0,150,100);
  ellipse(X2,Y2,da/20,da/20);

  stroke(0,0,150,50);
  line(x1,y1,X1,Y1);
  line(x2,y2,X2,Y2);
  line(x2,y2,X1,Y1);
  line(x1,y1,X2,Y2);
}
//---------------------------------------------------------------
void drawCirclesLines_1(float X1,float Y1,float X2,float Y2) {
  _numShapes=20;
  
  clearscreen=true;     
  fill(0,0,150,100);
  strokeWeight(0.25);
  stroke(0,0,150,30);
  float da=dist(X1,Y1,X2,Y2);
  ellipse(X1,Y1,da/2,da/2);
  stroke(0,0,150,100);
  fill(0,0,150,100);
  ellipse(X2,Y2,da/20,da/20);

  stroke(0,0,150,10);
  line(centre_x2,centre_y2,X1,Y1);
  line(centre_x2,centre_y2,X2,Y2);
  line(centre_x3,centre_y3,X1,Y1);
  line(centre_x3,centre_y3,X2,Y2);
}
//---------------------------------------------------------------
void drawCircles_1(float X1,float Y1,float X2,float Y2) {
  _numShapes=20;
  
  clearscreen=true;     
  fill(0,0,150,100);
  strokeWeight(0.25);
  stroke(0,0,150,30);
  float da=dist(X1,Y1,X2,Y2);
  ellipse(X1,Y1,da/2,da/2);
  stroke(0,0,150,100);
  fill(0,0,150,100);
  ellipse(X2,Y2,da/20,da/20);
}
//---------------------------------------------------------------
void drawLines_1(float X1,float Y1,float X2,float Y2) {
  
  _numShapes=10;
  clearscreen=false;
  
  stroke(0,0,150,5);
  line(centre_x2,centre_y2,X1,Y1);
  line(centre_x2,centre_y2,X2,Y2);
  line(centre_x3,centre_y3,X1,Y1);
  line(centre_x3,centre_y3,X2,Y2);
}

void drawLines_inc_1(){
  centre_x2+=increment;
  centre_x3+=increment;
  if (int(centre_x2)<=0){increment=1;}
  if (int(centre_x3)>=width){increment=-1;}
}
//---------------------------------------------------------------
void drawShapes_1(float X1,float Y1,float X2,float Y2) {
  _numShapes=_maxShapes;
  clearscreen=true;
  fill(0,0,0,0);
  strokeWeight(0.5);
  stroke(125,0,0);
  ellipse(X1,Y1,10,10);
  line(X1,Y1,X1+(random(200)),Y1);
     
  stroke(0,0,125);
  ellipse(X2,Y2,10,10);
  line(X2,Y2,X2,Y2-random(100));
}
//---------------------------------------------------------------

void mousePressed() {
  // Save the image to a file
  saveFrame();
}
 
void keyPressed() {
  saveFrame();
}
 
//---------------------------------------------------------------
class myShape{
  int _id;
  float _diam;
  float _diammax;
  float _opac;
  PVector _loc;
  PVector _vel;
 
  myShape(int Id) {
    _id=Id;
    initSelf();
  }
 
  void initSelf() {
    _diammax=random(MAXRAD);
    _diam=_diammax;
    println(_diam);
    _opac=random(100);
    _loc=new PVector(_diam/2+random(width-_diam),_diam/2+random(height-_diam));
    _vel=new PVector(random(-1,+1),random(-1,+1));
  }
 
  void drawShape(){
    fill(150,150,150,50);
    ellipse(_loc.x,_loc.y,_diam,_diam);
 
  }
 
  void moveShape(){
    // centre point
 
    _loc.add(_vel);
 
    _vel.x=_vel.x+random(-0.1,0.1);
    _vel.y=_vel.y+random(-0.1,0.1);
 
    if((_loc.x>(width-_diam/2)) || (_loc.x<(0+_diam/2))) {
      _vel.x*=-1;
    }
    if((_loc.y>(height-_diam/2)) || (_loc.y<(0+_diam/2))) {
      _vel.y*=-1;
    }
  }
 
float getx(){
    return _loc.x;
  }
  float gety(){
    return _loc.y;
  }
  float getrad(){
    return _diam/2;
  }
 
 
} // myShape

