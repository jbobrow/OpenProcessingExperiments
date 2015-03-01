
cycloid mainWheel;
cycloid[] subWheel;
float mainTheta=0;
float mainStep;
int balls = 8;
float ballDiameter=20.0;


void setup(){
  size(600,600);
  mainWheel = new cycloid(height/8,0.0,10.0,false,0);
  mainStep = 3;
  
  subWheel = new cycloid[balls];
  for (int i = 0; i < balls; i++) {    
    subWheel[i] = new cycloid(height/8,i * (360.0/float(balls)),ballDiameter,true,i+1);
  }  
  
}

void draw(){
  background(0);
  fill(100,100,100);
  ellipse(width/2,height/2,width/2+ballDiameter, height/2+ballDiameter);
  mainTheta = ((mainTheta + mainStep)>360)? 0: mainTheta + mainStep;
  
  mainWheel.draw(width/2,height/2,mainTheta);
  
  for (int i = 0; i < balls; i++) {    
    subWheel[i].draw(mainWheel.currentX,mainWheel.currentY,(360 - mainTheta));
  }
}



class cycloid{
  float centreX, centreY;
  float currentX, currentY;
  float radius;
  float pointSize;
  float startAngle, currentAngle;
  int cid;
  boolean visiblePoint;
  
  cycloid(float radius_,float startAngle_, float pointSize_, boolean visiblePoint_, int cid_){
    this.radius = radius_;
    this.pointSize = pointSize_;
    this.startAngle = startAngle_;
    this.visiblePoint = visiblePoint_;
    this.cid=cid_;    
  }
  
  void draw(float centreX_, float centreY_, float theta_){
    this.centreX = centreX_;
    this.centreY = centreY_;
    this.currentAngle = (startAngle+theta_>360) ? this.startAngle+theta_ : (this.startAngle+theta_-360);
    
    currentX = centreX + (sin(radians(currentAngle))*this.radius);
    currentY = centreY + (cos(radians(currentAngle))*this.radius);
      
    if (visiblePoint) {
      fill(200);
      ellipse(currentX, currentY,pointSize,pointSize);
    }                  
  }  
}


