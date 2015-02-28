
GUI gInterface;
Analog analog;

void setup(){
  size(480, 480);
  
  gInterface = new GUI();
  analog = new Analog(new PVector(240, 300));
  gInterface.attachAnalog(analog);
}

void draw(){
  background(#387CBF);
  gInterface.run();
  gInterface.display();
}

class Analog{
  PVector location;
  int outRadius;
  int inRadius;
  boolean dragging;
  float angle;
  
  PVector stickLocation;
  
  Analog(PVector location_){
    outRadius = 100;
    inRadius = 50;
    location = location_;
    stickLocation = new PVector(location.x, location.y);
    dragging = false;
    angle = 0;
  }
  
  void display(){
    ellipseMode(RADIUS);
    stroke(#FFFFFF);
    noFill();
    pushMatrix();
      translate(location.x, location.y);
      ellipse(0, 0, outRadius, outRadius);
    popMatrix();
    pushMatrix();
      if(mouseOver()) fill(#51BFE5);
      translate(stickLocation.x, stickLocation.y);
      ellipse(0, 0, inRadius, inRadius);
    popMatrix();  
  }
  
  void run(){
    float yDist = mouseY - location.y;
    float xDist = mouseX - location.x;
    angle = atan(yDist / xDist);
    
    if(xDist < 0) angle += PI;
    if(angle < 0) angle += 2*PI;
    
    if(mousePressed && mouseOver()){
      dragging = true;
      stickLocation.x = mouseX;
      stickLocation.y = mouseY;
    }else if(!mousePressed){
      stickLocation.x = location.x;
      stickLocation.y = location.y;
      dragging = false;
    }
    if(dragging && !mouseOver()){
      //Moves inner circle to the border tracking the mouse
      stickLocation.x = location.x + outRadius*cos(angle);
      stickLocation.y = location.y + outRadius*sin(angle);
    }
  }
  
  boolean mouseOver(){
    if(dist(location.x, location.y, mouseX, mouseY) <= outRadius){
      return true;
    }else{
      return false;
    }
  }
  
  float getAngle(){
    return angle;
  }
  
  float getStrength(){
    return map(dist(location.x, location.y, stickLocation.x, stickLocation.y), 0, outRadius, 0, 1);
  }
}

class GUI{
  ArrayList <Analog> analogs;
  
  GUI(){
    analogs = new ArrayList <Analog> ();
  }
 
  void display(){
    if(analogs.size() > 0){
      for(Analog analog : analogs){
        analog.display();
        fill(#FFFFFF);
        text("Angulo: " + degrees(analog.getAngle()) + "°", 50, 50);
        text("Intensidad: " + analog.getStrength(), 50, 80);
      }
    }
  }
 
  void run(){
    if(analogs.size() > 0){
      for(Analog analog : analogs){
        analog.run();
      }
    } 
  }
  
  void attachAnalog(Analog analog_){
    analogs.add(analog_);
  }
}
