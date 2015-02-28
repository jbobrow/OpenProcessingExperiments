
class Car {

  float x;         // car x-coordinate
  float y;         // car y-coordinate
  float speed; 
  float carColor;
 
Car(float tempspeed,float tempcarColor, float tempX, float tempY) {

  
carColor = tempcarColor;
speed = tempspeed;

x = tempX;
y = tempY;
     
}

void move(){
  x=x;
  y=y-1*speed*(30*easing);
  if (y < 0){
    y = 800;
    speed = random(2,6); //speed
}
}
  void display() {
    
  
    fill (carColor);
    rect(x,y, 30,50); //car size
  }



void setSpeed(float newSpeed) {
    speed = newSpeed;
    ;
  }
}







  //  Car(float bc) {
  //    
  //    carcolor = bc;
  //    x = width/2;
  //    y = height/2;
  //   
  //  }
  // 
  //  void move() {
  //    
  //    x += x;}
  //
  ////    if (x < 0);  {
  ////      x = 800
  ////    }
  ////  }
  // 
  //  void setColor (float bc) {
  //    carcolor =bc;
  //  }
  // 
  // //car shape
  //  void display() {
  //    noStroke();
  //    fill(carcolor);
  //    pushMatrix();
  //    translate(x, y);
  //  
  //    rect(160, 492, 220, 492, 220, 474,160,474);
  //    popMatrix();
  //    pushMatrix();
  //    translate(x, y);
  // 
  //    r= random(1,100); //add 
  //    fill(150);
  //  
  //    rect(160, 492, 220, 492, 220, 474,160,474);
  //    popMatrix();
  //  }




  //  void reset() {
  //    x =599;
  //    y =399;
  //  }
  //  void reset2() {
  //    x = 300;
  //    y= 0;
  //  }
  //  void reset3() {
  //    x = 0;
  //    y= 599;
  //  }
  //  }


