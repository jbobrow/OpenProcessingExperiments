
class CircleGroup {
  ArrayList<Circle> circles;
  PVector centerOffset;
  PVector rotation;
  PVector rotation_rate_rpms;  //radians per ms
  long lastTicTime;
  
  CircleGroup( int numcircles, float divisor, float multiplyer, int rad_, PVector rotation_rate_) {
    PVector newSpherePos = new PVector(0,0,0);
    PVector lastSpherePos = new PVector(0,0,0);
    float previousAngle = 0;
    circles = new ArrayList<Circle>();
    
    println(numcircles + "/" + divisor + "/" + multiplyer);
  
    for (int i = 0; i <= numcircles + 1; i++) {
      if (i == 0) {
        PVector rotrate = new PVector(PI/(i), PI/(i),0);
        
        //println("creating rotrate=" + rotrate.x + "," + rotrate.y);
        
        circles.add(new Circle(lastSpherePos, rotrate , rad_));
      
      } else {
      
        previousAngle += PI * divisor;
      
        lastSpherePos = circles.get(circles.size()-1).location;
      
        newSpherePos.x = cos(previousAngle) * rad_*multiplyer + rad_;
        newSpherePos.y = sin(previousAngle) * rad_*multiplyer + rad_;
        
        //newSpherePos.x = lastSpherePos.x + cos(previousAngle) * rad*multiplyer + rad;
        //newSpherePos.y = lastSpherePos.y + sin(previousAngle) * rad*multiplyer + rad;
        PVector rotrate = new PVector(PI*i, PI*i,0);
        //println("creating rotrate=" + rotrate.x + "," + rotrate.y);
        circles.add(new Circle(newSpherePos, rotrate , rad_));
        
        lastSpherePos = newSpherePos;
      
        //println("creating " + newSpherePos.x + "," + newSpherePos.y);
      }
    }
    
    circles.remove(0);
    findCenter();

    rotation_rate_rpms = new PVector();
    rotation = new PVector();
    
    rotation_rate_rpms.x = (float) rotation_rate_.x / 60 / 1000;
    rotation_rate_rpms.y = (float) rotation_rate_.y / 60 / 1000;
    
  }
  
  void findCenter() {
    PVector sum = new PVector(0,0,0);
    PVector avg = new PVector(0,0,0);
    int num=0;
    for (int i = 0; i < circles.size() - 1; i++) {
      Circle circle = circles.get(i);
      num++;
      sum.x += circle.location.x;
      sum.y += circle.location.y;
      sum.z += circle.location.z;
    }
    avg.x = (float)sum.x / num;
    avg.y = (float)sum.y / num;
    avg.z = (float)sum.z / num;
  
    centerOffset = new PVector(avg.x,avg.y,avg.z);
  }
  
  void tic() {
    long elapsed_time = millis() - lastTicTime;
    
    rotation.x = rotation.x + (float) rotation_rate_rpms.x * elapsed_time;
    rotation.y = rotation.y + (float) rotation_rate_rpms.y * elapsed_time;
    
    rotation.x = rotation.x % (PI * 2);
    rotation.y = rotation.y % (PI * 2);
    
    lastTicTime = millis();
    
    //println("rotation.x=" + rotation.x);
    for (int i = 0; i < circles.size() - 1; i++) {
        Circle circle = circles.get(i);
        circle.tic();
    }
    println("time: " + millis());
  }
  
  void draw() {
    pushMatrix();
//      translate(-centerOffset.x, -centerOffset.y, -centerOffset.z);
      translate(0,0,0);
      //println("drawing circlegroup at " + centerOffset.x + "," + centerOffset.y);
      
      rotateX(rotation.x);
      rotateY(rotation.y);
      for (int i = 0; i < circles.size() - 1; i++) {
        Circle circle = circles.get(i);
        circle.draw(centerOffset);
      }
    popMatrix();
  }
}





class Circle {
  PVector location;
  PVector rotation;
  PVector rotation_rate_rpms;  //radians per ms
  long lastTicTime;
  int rad;                     //radians
  int dia;                     //diameter
  
  Circle(PVector location_, PVector rotation_rate_, int rad_) {
    // rotation_rate_ is specified in radians per min to allow for reasonably long rotation speeds
    
    println("   creating circle at " + location_.x + "," + location_.y + " rotationrate=" + rotation_rate_.x);
    
    location = new PVector(location_.x, location_.y, location_.z);
    rotation = new PVector(0,0,0);
    rotation_rate_rpms = new PVector();
    
    rotation_rate_rpms.x = (float)rotation_rate_.x / 60 / 1000;
    rotation_rate_rpms.y = (float)rotation_rate_.y / 60 / 1000;
    lastTicTime = 0;
    
    rad = rad_;
    dia = rad*2;
  }
  
  void tic() {
    long elapsed_time = millis() - lastTicTime;
    
    rotation.x = rotation.x + (float) rotation_rate_rpms.x * elapsed_time;
    rotation.y = rotation.y + (float) rotation_rate_rpms.y * elapsed_time;
    
    rotation.x = rotation.x % (PI * 2);
    rotation.y = rotation.y % (PI * 2);
    
    //if (rotation.x > PI*2) rotation.x -= PI*2;
    //if (rotation.y > PI*2) rotation.y -= PI*2;
    
    lastTicTime = millis();
  }
  
  void draw(PVector offset) {
    pushMatrix();
      translate(location.x-offset.x,location.y-offset.y,location.z-offset.z);
      //println("   drawing circle at " + location.x + "," + location.y);
      
      rotateX(rotation.x);
      rotateY(rotation.y);
      ellipse(0,0,rad*2,rad*2);
    popMatrix();
  }
}

