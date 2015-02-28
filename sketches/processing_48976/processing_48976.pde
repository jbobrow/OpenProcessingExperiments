
import java.util.ArrayList;  // maybe needed for openProcessing

int APP_WIDTH;
int APP_HEIGHT;
ArrayList<VectorPointer> vectors;


void setup() {
  APP_WIDTH = 640;
  APP_HEIGHT = 360;
  size(640, 360); // must hardcode for web version.
  frameRate(24);
  background(220);
  smooth();
  
  vectors = new ArrayList<VectorPointer>();
  for( int i = 0; i < APP_WIDTH; i+=20){
    for ( int j = 0; j < APP_HEIGHT; j+=20){
      vectors.add(new VectorPointer(new PVector(i,j)));
    }
  }
}


void draw() { 
  background(220);
  for( VectorPointer vp : vectors){
    vp.display();
  }
  
}

// second tab 

class VectorPointer{
  PVector pos;
  PVector loc1;
  PVector loc2;
  PVector arrowPoint1;
  PVector arrowPoint2;
  PVector origin = new PVector(0,0);
  PVector longestReach = new PVector(APP_WIDTH, APP_HEIGHT);
    
  int _degrees;
  int _distance;
  int _maxDistance;
  
  float amt;
  color arrowColor;
  color distantColor = color(220, 220, 220);
  color closeColor = color(0,0,0);


  VectorPointer(PVector pos){
    this.pos = pos;
    _maxDistance = distance(origin, longestReach)/2;
  } 
  
  
  void display(){
    configArrow();
    drawArrow();
  }
  
  
  void configArrow(){
    detectDistanceFromMouse();
    setColor();
    initDegrees(); 
    setCoordinates();
  }
  
  
  void drawArrow(){
    drawArrowLine();
    drawArrowHead();
  }
  
  
  void detectDistanceFromMouse(){
    _distance = distance(pos, new PVector(mouseX, mouseY)); 
  }
  
  
  void setColor(){
    if (_distance <= _maxDistance) adjustColor();
    else arrowColor = distantColor;
  }
  
  
  void adjustColor(){
    amt = 1 / (_maxDistance / (_distance +0.002));
    arrowColor = lerpColor(closeColor, distantColor, amt); 
  }
  
  
  void drawArrowLine(){
    stroke(arrowColor);
    strokeWeight(1);
    line(loc1.x, loc1.y, loc2.x, loc2.y);
  }
  
  
  void drawArrowHead(){
    fill(arrowColor);
    noStroke();
    beginShape();
      vertex(loc1.x, loc1.y);
      vertex(arrowPoint1.x, arrowPoint1.y);
      vertex(arrowPoint2.x, arrowPoint2.y);    
    endShape(CLOSE);    
  }
  
    
  void setCoordinates(){
    loc1 = getPosFromDegrees(_degrees, 10);
    loc2 = getPosFromDegrees(_degrees+180, 10);
    arrowPoint1 = getPosFromDegrees(_degrees - 50, 3);
    arrowPoint2 = getPosFromDegrees(_degrees + 50, 3);
  }
  
  
  void initDegrees(){
    getAngle();
    adjustDegrees(); 
  }
   
  
  void getAngle(){
    float opposite = (pos.y + 10 - mouseY); 
    float adjacent = (pos.x + 10 - mouseX);
    float hypotenuse = sqrt((opposite*opposite) + (adjacent*adjacent));
    float radianValue = acos(adjacent/hypotenuse);
    _degrees = int(abs(degrees(radianValue)));
  }
  
  
  PVector getPosFromDegrees(int _degrees, int _radius){
    float coordinate_x = ((pos.x + 10) + cos(radians(_degrees))*_radius);
    float coordinate_y = ((pos.y + 10) + sin(radians(_degrees))*_radius);
    return new PVector(coordinate_x, coordinate_y);
  } 

  
  void adjustDegrees(){
    if (pos.x+10 <= mouseX && pos.y+10 <= mouseY){
          _degrees = 180 - _degrees;
    }
    if (pos.x+10 <= mouseX && pos.y+10 > mouseY){
          _degrees = 180 + _degrees;
    }    
    if (pos.x+10 > mouseX && pos.y+10 <= mouseY){
          _degrees = - _degrees + 180;
    }    
    if (pos.x+10 > mouseX && pos.y+10 > mouseY){
          _degrees = _degrees - 180;
    }  
  }


  int distance(PVector pos1, PVector pos2){
    return int(dist(pos1.x, pos1.y, pos2.x, pos2.y));
  } 
  
}


