
class Ant { 
  int numberOfAnts;
  float[] antAngle;
  float[] antX;
  float[] antY;
  float[] antXVel;
  float[] antYVel;

  Ant(){
    numberOfAnts = 1;
    antAngle = new float[numberOfAnts];
    antX = new float[numberOfAnts];
    antY = new float[numberOfAnts];
    antXVel = new float[numberOfAnts];
    antYVel = new float[numberOfAnts];
    
  }
  
  void constructor(){
    //set random values for x velocity, y velocity, and set appropriate angle
    for(int i = 0; i < numberOfAnts; i++){
      antXVel[i] = random(-2, 2);
      antYVel[i] = random(-2, 2);
      antAngle[i] = atan2(antYVel[i], antXVel[i]);
    }  
  }
  
  void setLocation(float mousePressedX, float mousePressedY){
    //make the start location of the ants be where the mouse was clicked
    for(int i = 0; i < numberOfAnts; i++){
      antX[i] = mousePressedX;
      antY[i] = mousePressedY;
    }
  }
  
  void drawHole(float holeLocationX, float holeLocationY, boolean drawHole){
    //draw the hole the ants come out of
    if(drawHole == true){
      fill(64, 33, 1);
      strokeWeight(2);
      stroke(32, 16, 1);
      ellipse(holeLocationX, holeLocationY, 25, 25);
    }
  }

  void display(){
    //draw each ant with appropriate angle and location
    stroke(0);
    strokeWeight(1);
    fill(0);
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

