
DrivingCircle car;
final int MOVE_INCREMENT = 3;  //move car by this many pixels each key press
ArrayList<RoadBorder> roads;

void setup() {
  size(300,300);
  smooth();
  car = new DrivingCircle(15, width/2, height/2);
  roads = new ArrayList<RoadBorder>();
  initRoads(roads);
}

void initRoads(ArrayList<RoadBorder> r) {
  //edges of screen first
  int a = 4;
  r.add( new RoadBorder(a,a,width-a,a) );
  r.add( new RoadBorder(width-a,a,width-a,height-a) );
  r.add( new RoadBorder(a,height-a,width-a,height-a) );
  r.add( new RoadBorder(a,a,a,height-a) );
  
  r.add( new RoadBorder(width/2 - 3*car.radius, 3*car.radius, width/2 - 3*car.radius, height) );
  r.add( new RoadBorder(width/2 + 3*car.radius, 0, width/2 + 3*car.radius, height-3*car.radius) );
}


void draw() {
  background(0);
  car.render();
  for( RoadBorder border : roads ) {
    border.render();
  }
}

void keyPressed() {
  PVector moveVector = new PVector(0,0);
  switch (keyCode) {
  case UP:
    moveVector.y = -MOVE_INCREMENT;
    break;
  case DOWN:
    moveVector.y = MOVE_INCREMENT;
    break;
  case LEFT:
    moveVector.x = -MOVE_INCREMENT;
    break;
  case RIGHT:
    moveVector.x = MOVE_INCREMENT;
    break;
  }
  car.move( moveVector );
}

class DrivingCircle {
  PVector loc;
  int radius;
  color clr; 

  public DrivingCircle(int r, int x, int y) {
    radius = r;
    loc = new PVector(x,y);
    clr = color(0,0,200);
  }

  public void move(PVector moveVector) {
    loc.add(moveVector);
    //check if collision w/road border
    if ( isCollision() ) {
        loc.sub(moveVector); //undo move
    }
  }
  
  public boolean isCollision() {
    //go through each RoadBorder in roads to see if the circle's distance from the
    //line segment is less than or equal to radius; if so, there's a collision
    //
    //possible ways to strike:  
    //* circle tangent to line somewhere between endpts
    //* circle touches either endpt
    for( RoadBorder seg : roads ) {
      PVector A = seg.ptA;
      PVector B = seg.ptB;
      if ( A.dist(loc) <= radius ) return true;
      if ( B.dist(loc) <= radius ) return true;
      
      //see if closest pt to circle is on segment and if 
      //dist too close
      PVector distResult = getDistance(A.x, A.y, B.x, B.y, loc.x, loc.y);
      PVector closest = new PVector( distResult.x, distResult.y );
      float dist = distResult.z;
      float lesserX = A.x, greaterX = B.x;
      if ( A.x > B.x ) { float tmp = lesserX; lesserX = greaterX; greaterX = tmp; }
      float lesserY = A.y, greaterY = B.y;
      if ( A.y > B.y ) { float tmp = lesserY; lesserY = greaterY; greaterY = tmp; }
      
      if ( closest.x >= lesserX && closest.x <= greaterX 
        && closest.y >= lesserY && closest.y <= greaterY ) {
          //closest pt to circle is on the RoadSegment
          if ( closest.dist(loc) <= radius ) { 
            return true;
          }
       }
       
    } //no segments (RoadBorders) had a collision w/circle
    
    return false;
  }

  void render() {
    fill(clr);
    stroke(255,255,255,0);   
    ellipseMode(CENTER);
    ellipse(loc.x, loc.y, radius*2, radius*2);
  }
}

class RoadBorder {

  PVector ptA, ptB;

  public RoadBorder(int x1, int y1, int x2, int y2) {
    ptA = new PVector(x1,y1);
    ptB = new PVector(x2,y2);
  }

  public void render() {
    stroke(255,0,0);
    line(ptA.x, ptA.y, ptB.x, ptB.y);
  }
}




/**
 * from http://processing.org/discourse/yabb2/YaBB.pl?num=1276644884/4
 *
 * Returns a point on the line (x1,y1) -> (x2,y2) 
 * that is closest to the point (x,y)
 * 
 * The result is a PVector. 
 * result.x and result.y are points on the line. 
 * The result.z variable contains the distance from (x,y) to the line, 
 * just in case you need it :) 
 */
PVector getDistance( float x1, float y1, float x2, float y2, float x, float y ){
  PVector result = new PVector(); 
  
  float dx = x2 - x1; 
  float dy = y2 - y1; 
  float d = sqrt( dx*dx + dy*dy ); 
  float ca = dx/d; // cosine
  float sa = dy/d; // sine 
  
  float mX = (-x1+x)*ca + (-y1+y)*sa; 
  
  if( mX <= 0 ){
    result.x = x1; 
    result.y = y1; 
  }
  else if( mX >= d ){
    result.x = x2; 
    result.y = y2; 
  }
  else{
    result.x = x1 + mX*ca; 
    result.y = y1 + mX*sa; 
  }
  
  dx = x - result.x; 
  dy = y - result.y; 
  result.z = sqrt( dx*dx + dy*dy ); 
  
  return result;   
}


