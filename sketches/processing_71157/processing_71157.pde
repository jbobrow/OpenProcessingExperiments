
class Body {
  float h;
  float orbitCenterX;
  float orbitCenterY;
  float orbitRadius;
  float xPos;
  float yPos;
  float bodySize;
  float angle;
  float counter;
  float counterIncriment;
  Body[] motherPlanets;
  
  Body(float inputOrbitRadius, float inputBodySize, float inputCounterIncriment){
    orbitCenterX = width/2;
    orbitCenterY = height/2;
    orbitRadius = inputOrbitRadius;
    bodySize = inputBodySize;
    counterIncriment = inputCounterIncriment;
    counter = 0;
    motherPlanets = new Body[0];
    h = random(0, 35);
    
  }

  void move(){
    xPos = sin(counter)*orbitRadius;
    yPos = cos(counter)*orbitRadius;
    angle = atan2(xPos, yPos);
  }
  
  void display(){
    fill(h, 255, 255);
    pushMatrix();
    translate(orbitCenterX + xPos, orbitCenterY + yPos);
    rotate(angle);
    ellipse(0, 0, bodySize, 1.5*bodySize);
    popMatrix(); 
    counter+=counterIncriment;
  }


}

