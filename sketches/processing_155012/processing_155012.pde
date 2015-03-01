
/*
//  Sketch to test locating the reentry point on an ellipse given heading provided
//
//  Thanks to David Leslie Williams (lessketch_140716b)
//    for most excellent and invaluable assistance with providing, then solving,
//    and then coding line quadratic and line functions for the reentry points.
//
*/

ellipticalSurface wordBuilder;
float startPointAngle;
float exitAngle, reEntryAngle;

coordinate[] reentryPoints;

PVector pointPos;

void setup() {
  size(700, 700);
  colorMode(HSB,360,100,100);

  PVector wordCentre = new PVector();
  wordCentre.x = width/2;
  wordCentre.y = height/2;  
  wordBuilder = new ellipticalSurface(wordCentre, min(height,width)/2, min(height,width)/3,100,"porous");

  randomiseAngles();

  reentryPoints=new coordinate[2];
  
  pointPos=new PVector();  
}


void draw(){
  background(0,0,50);
  
  fill (100,0,100);
  wordBuilder.draw();
  
  pointPos=wordBuilder.getParametricPoint(startPointAngle);
  drawExitPoint(pointPos, wordBuilder.startPosition, exitAngle, 360);
    
  reentryPoints = wordBuilder.getReentryPoints(pointPos, reEntryAngle);
  drawReentryPoint(reentryPoints, wordBuilder.startPosition, 100);  
}


void keyPressed() {
 randomiseAngles();
}  




void randomiseAngles(){
  startPointAngle = random(TWO_PI);

  exitAngle = random(TWO_PI);          // PI / 12 radians = 15 degrees
 
  reEntryAngle = wordBuilder.getReentryAngle(exitAngle);  
}


void drawExitPoint(PVector pointPos_, PVector originPos_, float exitAngle_, float col_) {
  pushMatrix();
    translate(originPos_.x, originPos_.y);
    fill(col_,100,100);    
    ellipse(pointPos_.x, pointPos_.y, 8,8);

    line(pointPos_.x, pointPos.y, pointPos.x+(40*cos(exitAngle)),pointPos.y+(40*sin(exitAngle)));
  popMatrix();    
}


void drawReentryPoint(coordinate[] reentryPoints_, PVector originPos, float col_){
  pushMatrix();
    translate(originPos.x, originPos.y);
  
    fill(col_,100,100);  
    ellipse(reentryPoints_[0].x, reentryPoints_[0].y, 8,8);
    line(pointPos.x, pointPos.y, reentryPoints_[0].x, reentryPoints_[0].y);
  
    ellipse(reentryPoints_[1].x, reentryPoints_[1].y, 8,8);
    line(pointPos.x, pointPos.y, reentryPoints_[1].x, reentryPoints_[1].y);    
  popMatrix();  
}
class coordinate {
  float x;
  float y;
  
  coordinate(float x_, float y_) {
    this.x = x_;
    this.y = y_;
  }
}
    
/*
parameters:
  startx/y      the root location of the surface
  edgeHardness  an index from 1-100 with 100 being hard and 1 being spongy
                spongy edges absorb energe, hard ones reflect, >100 is elastic
  edgeQuality   porous or solid (a porous edge allow a shape to pass through and enter from the other side                
*/

class surface {
  PVector startPosition;
  float edgeHardness;
  String edgeQuality;

    
  surface(PVector startPosition_, float edgeHardness_, String edgeQuality_) {
    this.startPosition = startPosition_;   
    this.edgeHardness=edgeHardness_;
    this.edgeQuality=edgeQuality_;
    
  }    
}



class ellipticalSurface extends surface {
  float majorAxis, minorAxis;
  
  ellipticalSurface(PVector centre_, float height_, float width_, float edgeHardness_, String edgeQuality_) {
    super(centre_, edgeHardness_, edgeQuality_);
    this.majorAxis=height_;
    this.minorAxis=width_;
  }

  boolean isOnSurface(PVector position_) {
    boolean retval;
    //println(sq(position_.x-startPosition.x)/sq(majorAxis/2)+sq(position_.y-startPosition.y)/sq(minorAxis/2));
    retval = (sq(position_.x-startPosition.x)/sq(majorAxis/2)+sq(position_.y-startPosition.y)/sq(minorAxis/2) < 1) ? true : false;
    return retval;
  }
  
  void draw(){
    pushMatrix();
      translate(startPosition.x, startPosition.y);
      ellipse(0, 0, majorAxis,minorAxis);
    popMatrix();
  }

  void outOfBounds(PVector oob_, float thetax_, float thetay_){
    //use PVector for positions and heading
    if (!isOnSurface(oob_)) {
      if (edgeQuality=="porous") {
        //determine angle and location of incidence and calculate point of reentry of entry
        //((sq(minorAxis) * sq(majorAxis)) + (x * sq(b) * startX * (-1)) + (y * sq(a) * startY * (-1)))
        //y=mx+c
        //subtract th minor axis
        



        return;
      }
      if (edgeQuality=="solid"){
        //rebound
        //angle of incidence = angle of reflection
        //energy absorbed according to wall type
        return;
      }
    }
  }


  float getReentryAngle(float exitAngle_){
    float reEntryAngle_ = (TWO_PI - exitAngle_);
  
    //and just correct where > 360  
    reEntryAngle_ = (reEntryAngle_ > TWO_PI) ? (reEntryAngle_ - TWO_PI) : reEntryAngle_;
    return reEntryAngle_;    
  }      


  //use parametric
  PVector getParametricPoint(float theta_){
    PVector gppPos = new PVector();
  
    gppPos.x=(this.majorAxis/2)*cos(theta_);
    gppPos.y=(this.minorAxis/2)*sin(theta_);
  
    return gppPos;    
  } 


  coordinate[] getReentryPoints(PVector pointPos_, float theta_){
    coordinate[] resultpos = new coordinate[2];
    
    float xa_=pointPos.x;
    float ya_=pointPos.y;

    float m_ = -tan(theta_);
    float c_ = ya_ - (xa_ * m_);
  
  
    float A_ = (sq(this.minorAxis/2) / sq(this.majorAxis/2)) + sq(m_);
    float B_ = 2 * m_ * c_;
    float C_ = (c_ * c_) - sq(this.minorAxis/2);
      
    float xb1_ = (-B_ + sqrt(sq(B_) - (4 * A_ * C_)) )/ (2 * A_);
    float yb1_ = ((m_ * xb1_) + ya_ - (m_ * xa_));    //plug in to line formula 
    resultpos[0] = new coordinate(xb1_, yb1_);
    
    float xb2_ = (-B_ - sqrt(sq(B_) - (4 * A_ * C_)) )/ (2 * A_);
    float yb2_ = ((m_ * xb2_ ) + ya_ - (m_ * xa_));    //plug in to line formula
    resultpos[1] = new coordinate(xb2_, yb2_);
           
    return resultpos;
  }  
   
}  
  
    


