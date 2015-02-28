
class Creature{
  float objectSize;
  PVector location; 
  float rSize; 
  color fillColor = color(240, 222, 200);
  float leftEyeX = -25.0;
  float leftEyeY = -15.0; 
  float rightEyeX = 25.0;  
  float rightEyeY = -15.0;
//  boolean alive;
  
  Creature(){
    objectSize = 1.5;
    location = new PVector(450, 350);
    rSize = 100;
  }
  
  void drawMe(){    
    pushMatrix();
    translate(location.x, location.y);
    scale(objectSize);

    // draw creature
    noStroke();
    fill(fillColor);
    ellipse(0, 0, rSize, rSize);
    triangle(-45, -20, -50, -50, -10, -35);
    triangle(10, -35, 50, -50, 45, -20);
    fill(242, 164, 193);
    triangle(-42, -27, -45, -45, -32, -38);
    triangle(42, -27, 45, -45, 32, -38);
    //hands, feet
    fill(fillColor);
    noStroke();
    ellipse(-45, 10, 25, 10);
    ellipse(45, 10, 25, 10);
    ellipse(-10, 45, 13, 28);
    ellipse(12, 45, 13, 28);  

    popMatrix();
  }
  
  void catFace(boolean angry){
    pushMatrix();   
    translate(location.x, location.y);
    scale(objectSize);
    if(angry){
      //eyewhites
      fill(255);
      ellipse(-25, -15, 23, 23);
      fill(255);
      ellipse(25, -15, 23, 23);        
      //mouth line
      stroke(0);
      line(-30, 2, 30, 2);
    }
    else{
      //eyewhites
      fill(255);
      ellipse(-25, -15, 23, 23);
      ellipse(25, -15, 23, 23);
      //pupils
      fill(0);
      ellipse(leftEyeX, leftEyeY, 11, 11);
      fill(0);
      ellipse(rightEyeX, rightEyeY, 11, 11);
      //big mouth
      fill(0);
      arc(0, 0, 60, 30, 0, PI);
    }
    popMatrix();
  }
  
  void blush(){
    pushMatrix();   
    translate(location.x, location.y);
    scale(objectSize);
    //cheeks blush
    fill(211, 137, 164);
    noStroke();
    smooth();
    rect(-40, -5, 4, 4);
    rect(37, -5, 4, 4);  
    popMatrix();  
  }
  
  
  void update(){
    
  }

  
  float getCatBody(){
    return rSize;
  }
  
  float getXLoc(){
    return location.x;
  }
  
  float getYLoc(){
    return location.y;
  }
  

  
  
  
  
  
}

