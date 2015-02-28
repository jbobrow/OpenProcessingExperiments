
class BlindSerpent{
  Position myPos;
  Position lastPos;
  Position nextPos;
  Position[] interpolationArray;
  Position[] lastPositions;
  double lastProgressInQuadrant;
  boolean middleChange;
  float progressionInQuadrant;
  
  int timePerQuadrant = 3000;
  
  BlindSerpent(){
    myPos = new Position(width/2+1, height/2+1);
    lastProgressInQuadrant = 0;
    middleChange = false;
    
    interpolationArray = new Position[8];
    updateInterpolationArray();
    nextPos = getRandomPointInNextQuadrant(interpolationArray[interpolationArray.length-1]);
    progressionInQuadrant = 0;
    lastPositions = new Position[8];
    for(int i = 0; i<lastPositions.length; i++){
      lastPositions[i] = new Position(width/2+1, height/2+1);
    }
  }
  
  void update(){
    strokeWeight(25);
    for(int i = 0; i<lastPositions.length; i++){
      stroke(color(hue(white),saturation(white),brightness(white), i*(255/lastPositions.length)));
      point(lastPositions[i].posX, lastPositions[i].posY);
    }
    strokeWeight(25);
    stroke(white);
    point(myPos.posX, myPos.posY);
    strokeWeight(15);
    stroke(arrayOfUsableColors[idColorInUse]);
    point(myPos.posX, myPos.posY);
  }
  
  void move(int deltaTime){
    
    /**
    *Compute Next Position
    */
    progressionInQuadrant += (float)deltaTime/(float)timePerQuadrant;
    
    if(progressionInQuadrant > 0.15 ){
      updateInterpolArrayProgressive();
      progressionInQuadrant = 0;
    }
    /**if(lastProgressInQuadrant > 0.8){
      progressionInQuadrant = 0;
      nextPos = getRandomPointInNextQuadrant(interpolationArray[interpolationArray.length-1]);
      updateInterpolArrayProgressive();
    }else{
      modifyInterpolationArray(progressionInQuadrant);
    }else if(lastProgressInQuadrant > progressionInQuadrant){
      updateInterpolationArray();
      println("Change Quadrant");
      middleChange = false;
    }**/
    lastProgressInQuadrant = progressionInQuadrant;
    
    Position newPos = new Position(lastPos.posX, lastPos.posY);
    float multiplier = pow((1-progressionInQuadrant), interpolationArray.length);
    float checkMult = multiplier;
    newPos.multiply(multiplier);
    for(int i = 0; i<interpolationArray.length; i++){
      int pascalFactorAbove = 1;
      int pascalFactorUnder = 1;
      for(int j = 1; j<interpolationArray.length+1; j++){
        pascalFactorAbove *= j;
      }
      for(int j = 1; j<(interpolationArray.length+1) - (i + 1); j++){
        pascalFactorUnder *= j;
      }
      for(int j = 1; j<i+2; j++){
        pascalFactorUnder *= j;
      }
      //print (interpolationArray.length-(i+1)+ "-"+ (i+1) + " ");
      multiplier = (pascalFactorAbove/pascalFactorUnder) * pow((1-progressionInQuadrant), interpolationArray.length-i-1)*pow(progressionInQuadrant, i+1);
      checkMult += multiplier;
      newPos.posX += multiplier*interpolationArray[i].posX;
      newPos.posY += multiplier*interpolationArray[i].posY;
    }
    
    /**
    *Upgrade Position
    */
    for(int i = 0; i<lastPositions.length-1; i++){
      lastPositions[i] = lastPositions[i+1];
    }
    lastPositions[lastPositions.length-1] = myPos.clone();
    myPos = newPos;
    //println(checkMult + " -- " + progressionInQuadrant);
  }
  
  void modifyInterpolationArray(float progress){
    interpolationArray[interpolationArray.length-1].multiply(1-progressionInQuadrant);
    Position toAdd = new Position();
    toAdd.addPos(nextPos);
    toAdd.multiply(progressionInQuadrant);
    interpolationArray[interpolationArray.length-1].addPos(toAdd);
  }
  
  void updateInterpolationArray(){
    for(int i = 0; i<interpolationArray.length; i++){
      interpolationArray[i] =  getRandomPointInNextQuadrant(myPos);
    }
    lastPos = new Position(myPos.posX, myPos.posY);
  }
  
  void updateInterpolArrayProgressive(){
    lastPos = new Position(myPos.posX, myPos.posY);
    for(int i = 0; i<interpolationArray.length-1; i++){
      interpolationArray[i] =  interpolationArray[i+1];
    }
    interpolationArray[interpolationArray.length-1] = getRandomPointInNextQuadrant(interpolationArray[0]);
  }
  
  Position getRandomPointInNextQuadrant(Position actual){
    Position toReturn = new Position((int) random(width/3),(int) random(height/3));
    if(actual.posX < width/2){
      if(actual.posY < height/2){
        //Quadrant 1 => 2
        println("Q1");
        toReturn.posX += 2*width/3;
        toReturn.posY += 2*height/3;
      }else{
        //Quadrant 3 => 4
        println("Q3");
        toReturn.posX += 2*width/3;
      }
    }else{
      if(actual.posY < height/2){
        //Quadrant 4 => 1
        println("Q4");
      }else{
        //Quadrant 2
        println("Q2");
        toReturn.posY += 2*height/3;
      }
    }
    return toReturn;
  }
}

class BlindSerpentLosange extends BlindSerpent{
  
  BlindSerpentLosange(){
    
  }
  
  Position getRandomPointInNextQuadrant(Position actual){
    Position toReturn = new Position((int) random(width/3),(int) random(height/3));
    if(actual.posY < height/4){
        //Quadrant 1 => 4
        println("Q1");
        toReturn.posX += 2*width/3;
        toReturn.posY += height/4;
      
    }else if(actual.posY > 3*height/4){
        //Quadrant 2 => 3
        println("Q2");
        toReturn.posY += height/4;
      
    }else{
      if(actual.posX < width/2){
        //Quadrant 3 => 4
        println("Q3");
        toReturn.posX += 2*width/3;
        toReturn.posY += height/4;
      }else{
        //Quadrant 4 => 3
        println("Q4");
        toReturn.posY += height/4;
      }
    }
    return toReturn;
  }
}

