
class Bee {
  float beeSize;
  float xPos;
  float yPos;
  float xVel;
  float yVel;
  float xVelChange;
  float yVelChange;
  float[] beeTrailX;
  float[] beeTrailY;
  float angle;
  float counter;
  float counterIncriment;
  float noiseHolder;
  boolean noiseOn = true;
  
  boolean holdStillBee;
  
  Bee(){
    beeSize = 20;
    xPos = width/2;
    yPos = height/2;
    xVel = random(-5, 5);
    yVel = random(-5, 5);
    beeTrailX = new float[10];
    beeTrailY = new float[10];
    for(int i = 0; i < beeTrailX.length; i++){
      beeTrailX[i] = i;
      beeTrailX[i] = i;
    }
//    counterIncriment = .035;
  }

  void move(boolean holdStill){  
    holdStillBee = holdStill;
    if(holdStillBee == false){
      xPos += xVel;
      yPos += yVel;
      angle = atan2(yVel, xVel);
    }
    
       

    println(holdStill);
//      noiseHolder = noise(counter)*2*PI;   
//      if(xPos > 5 && xPos < width-5 && yPos > 5 && yPos < height-5){
//        counter += counterIncriment;
//        angle = noiseHolder;
//      }
//    }
    
  }

  void display(){
    
    pushMatrix();
    translate(xPos, yPos);
    rotate(angle);
    stroke(0);
    strokeWeight(2);
    line(0, 0, -beeSize*1.25, 0);
    noStroke();
    fill(40, 255, 235);
    ellipse(-beeSize/2, 0, 1.3*beeSize, beeSize);
    fill(0);
    ellipse((-beeSize/2) + beeSize-5, 0, 2*beeSize/3, 2*beeSize/3);
    fill(255, 100);
    stroke(0);
    strokeWeight(3);
    line(-beeSize/2, -beeSize/2, -beeSize/2, beeSize/2);
    line(-beeSize/5, -beeSize/3, -beeSize/5, beeSize/3);
    line(-4*beeSize/5, -beeSize/3, -4*beeSize/5, beeSize/3);
    noStroke();
    ellipse(-beeSize/2, -15, 7*beeSize/8, 1.3*beeSize);
    ellipse(-beeSize/2, 15, 7*beeSize/8, 1.3*beeSize);
    popMatrix(); 
    
  }
  
//  void moveBeeTrail(){
//      beeTrailX[0] = xPos;
//      beeTrailY[0] = yPos;
//    for(int i = 1; i < 10; i++){
//      beeTrailX[i-1] = beeTrailX[i];
//      beeTrailY[i-1] = beeTrailY[i];
//    }
//  }
//  
//  void displayBeeTrail(){
//    
//    for(int i = 1; i < 10; i++){
//      fill(0, 9*(10-i));
//      ellipse(beeTrailX[i], beeTrailY[i], 50, 50);
//    }
//  }
  
  
  void walls(){
    if(xPos < 0 || xPos > width){
      xVel *= -1;
    }
    if(yPos < 0 || yPos > height){
      yVel *= -1;
    }
    
//    if(xPos < 5){
//      xPos = 10;
//      angle += PI;
//      counterIncriment *= -1;
//    }
//    if(xPos > width - 5){
//      xPos = width - 10;
//      angle += PI;
//      counterIncriment *= -1;
//    }
//    if(yPos < 5){
//      yPos = 10;
//      angle += PI;
//      counterIncriment *= -1;
//    }
//    if(yPos > height - 5){
//      yPos = height - 10;
//      angle += PI;
//      counterIncriment *= -1;
//    }
  }
}


