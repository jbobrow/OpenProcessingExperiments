
class Ball {
  
  float tempX;
  float tempY;
  float tempZ;
  float tempSpeed;
  
  Ball(float tempX, float tempY, float tempSpeed) {
    tempX= 100;
    tempY= 0;
    tempZ= 150;
    tempSpeed= 5;
  }
  
  void display() {
    
   fill(175,40);
   noStroke();
   smooth();
   ellipseMode(CENTER);

   
   
   fill (#009be3, 4);
   rect(tempZ*2,tempX,1600,40);
   
   stroke(200,40);
  
   line (random(450),0,tempX+40,tempY);
   line (0,600,tempX,tempY);
   
   ellipse(tempX,tempY,5,5);
   ellipse(tempX+400,tempY,10,10);
   ellipse(tempX+200,tempY,5,5);
   ellipse(tempX+600,tempY,5,5);
   ellipse(tempX+800,tempY,10,10);
   ellipse(tempX+1000,tempY,5,5);
   
   
   fill(#ffc600,1);
   ellipse(450,300,tempX,tempY);
    
  }
  
  
 void move() {
    tempX = tempX +4;
    tempY = tempY + tempSpeed*2;
    tempZ = 150 + tempSpeed;
    tempSpeed = tempSpeed + gravity;
    
 if (tempY>height) {
     tempSpeed = tempSpeed * -0.95;
      
     if ((tempX > width) || (X < 0)) {
       tempX = tempX * -1;
      }
    }
  }
}

