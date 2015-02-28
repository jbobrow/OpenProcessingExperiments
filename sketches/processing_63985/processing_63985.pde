
//import processing.opengl.*;

RDK3D rdk;

void setup(){
  size(400, 300, OPENGL);
  colorMode(HSB, 360, 100, 100);
  background(0);
  ortho(-width/2, width/2, -height/2, height/2, 0, 1200);
  smooth();  
  frameRate(60);
  
  rdk=new RDK3D(13, 0.5, color(360), 0, width/2, height/2, 200);
}

void draw(){
  background(0);
  
  rdk.update();
  rdk.display();
  
}


class RDK3D{
  int     numDots;
  float   speed;
  color   col;
  float   direction;
  float   heading;
  int     cen_x;
  int     cen_y;
  int     diam;
  int     half_diam;
  int     dotSize;
  float[] dotX;
  float[] dotY;
  float[] dotZ;
  RDK3D(int _numDots, float _speed, color _col, float _dir, int x, int y, int _diam){
    numDots=_numDots;
    speed=_speed;
    col=_col;
    direction=_dir; //[rad]
    heading=0;
    cen_x=x;
    cen_y=y;
    diam=_diam;
    half_diam=diam/2;
    dotSize=4;
    init();
  }
  void init(){
    dotX=new float[numDots];
    dotY=new float[numDots];
    dotZ=new float[numDots];
    for(int i=0; i<numDots; i++){
      boolean yet=true;
      float x=0;
      float y=0;
      float z=0;
      while(yet){
        x=random(-diam/2, diam/2);
        y=random(-diam/2, diam/2);
        z=random(-diam/2, diam/2);
        if(x*x+y*y+z*z<=half_diam*half_diam){ yet=false; }
      }
      dotX[i]=x;
      dotY[i]=y;
      dotZ[i]=z;
    }//i
  }
  void update(){
    for(int i=0; i<numDots; i++){
      dotX[i]=dotX[i]+speed;
      if(dotX[i]*dotX[i]+dotY[i]*dotY[i]+dotZ[i]*dotZ[i]>half_diam*half_diam){
        rebirth(i);
      }
    }//i
  }
  void rebirth(int i){
    float a=random(HALF_PI, HALF_PI*3);
    float b=random(-HALF_PI, HALF_PI);
    float x=half_diam*cos(b)*cos(a);
    float y=half_diam*cos(b)*sin(a);
    float z=half_diam*sin(b);
    dotX[i]=x;
    dotY[i]=y;
    dotZ[i]=z;
  }
  void display(){
    stroke(col);
    noFill();
    
    pushMatrix();
    translate(cen_x, cen_y);
    
    strokeWeight(1);
    ellipse(0,0,diam, diam);
    
    rotateZ(direction);
    //rotateY(heading);
    
    rotateY(map(mouseX, 0,width,-PI,PI));
    //rotateZ(map(mouseY, 0,height,PI,-PI));
    
    strokeWeight(dotSize);
    beginShape(POINTS);
    for(int i=0; i<numDots; i++){
      vertex( dotX[i], dotY[i], dotZ[i] );
    }//i
    endShape();
    
    popMatrix();
  }
}
