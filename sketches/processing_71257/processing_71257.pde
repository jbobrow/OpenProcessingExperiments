
class Ant { 
  int numberOfAnts = 15;
  float thisGroupOfAntsColor;
  float[] antAngle = new float[numberOfAnts];
  float[] antX = new float[numberOfAnts];
  float[] antY = new float[numberOfAnts];
  float[] antXVel = new float[numberOfAnts];
  float[] antYVel = new float[numberOfAnts];
  float[] antColor = new float[numberOfAnts];

  Ant(float mousePressedX, float mousePressedY){
    thisGroupOfAntsColor = random(0, 80);
    if(thisGroupOfAntsColor > 75){
      thisGroupOfAntsColor = 175;
    }
    for(int i = 0; i < numberOfAnts; i++){
      antXVel[i] = random(-2, 2);
      antYVel[i] = random(-2, 2);
      antAngle[i] = atan2(antYVel[i], antXVel[i]);
      antColor[i] = thisGroupOfAntsColor;
    }
    for(int i = 0; i < numberOfAnts; i++){
      antX[i] = mousePressedX;
      antY[i] = mousePressedY;
    } 
  }
  
  


  void display(){
    //draw each ant with appropriate angle and location
    stroke(thisGroupOfAntsColor, 0, 0);
    strokeWeight(1);
    fill(thisGroupOfAntsColor, 0, 0);
    for(int i = 0; i < numberOfAnts; i++){
      pushMatrix();
      translate(antX[i], antY[i]);
      rotate(antAngle[i]);
      ellipse(0, 0, 10, 5);
      ellipse(8, 0, 5, 5);
      line(-3, -5, -3, 5);
      line(0, -5, 0, 5);
      line(3, -5, 3, 5);
      line(8, 0, 12, -4);
      line(8, 0, 12, 4);
      popMatrix(); 
    }
  }
  
  void move(){
    for(int i = 0; i < numberOfAnts; i++){
      //move ants by individual velocities
      antX[i] += antXVel[i];
      antY[i] += antYVel[i];
      //make them stay inside the walls
      if(antX[i] > width || antX[i] < 0){
        antXVel[i] *= -1;
        antAngle[i] = atan2(antYVel[i], antXVel[i]);
      }
      if(antY[i] > width || antY[i] < 0){
        antYVel[i] *= -1;
        antAngle[i] = atan2(antYVel[i], antXVel[i]);
      }
    }
  }
}

