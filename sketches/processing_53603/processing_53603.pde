
class Goal {
  //variables
  PImage mtnDew;
  int goalX;
  int goalY;
   
   
   
  //constructor
   Goal() {
     //ellipseMode(CENTER);
     //strokeWeight(2);
     goalX = width/2;
     goalY = height/2;
     mtnDew = loadImage ("dew.png");
   }
    
 
   
  //method
  void display() {
    imageMode (CENTER);
    image(mtnDew,goalX, goalY);
  }
   
}

