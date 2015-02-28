
/*The John and Dotti class consists of:
- The visual appearance of both of them
- the movement for both of them
- a heart and a failed collision function*/

class JohnDottie {
  
  //variables for John, the x/y indicates position
  int johnX;
  int johnY = height/2 - 30;
  int johnWidth;
  float johnVelocity = 1;
  
  //variables for Dottie
  int dottieX = width;
  int dottieY = height/2 - 30;
  int dottieWidth;
  float dottieVelocity = 1;
  
  //variable for the heart
  int heartSize = 50;
  
  JohnDottie() {
  }
  
  
  // function for displaying the heart in the middle of the screen
  //consists of two identical ellipses and a triangle
  void displayHeart() {
    fill(255);
    ellipse(width/2 - heartSize/2, height/2 - 50, heartSize, heartSize);
    ellipse(width/2 + heartSize/2, height/2 - 50, heartSize, heartSize);
    triangle(width/2, height/2+20, width/2 - heartSize, height/2 - 45, width/2 + heartSize, height/2 - 45);
  }
  
  //the collision boolean which doesn't work, but it doesn't break the program either, so I've left it in here
  boolean collision() {
    
    //calculating the distance between john and dottie's positions
    float collisionDist = dist(johnX, johnY, dottieX, dottieY);
    
    //if the distance between them is less that their width added (which means that they are touching)
    //the boolean returns true (or should return true)
    if (collisionDist < johnWidth + dottieWidth) {
      println("Collision is true");
      return true;
    }
    else {
      println("collision is false");
      return false;
    }
  }
  
  //displaying john by using some old code spiked up with times 2 in order to make him bigger
  void displayJohn() {
    johnWidth = 10;
    
    noStroke();
    
    //the hair
    fill (0);
    rect(johnX,johnY,johnWidth*2,5*2);
    
    //the face
    fill(255);
    rect(johnX,johnY+5*2,johnWidth*2,10*2);
    
    //the body
    fill(150);
    rect(johnX,johnY+15*2,johnWidth*2,15*2);
    
    //the legs
    fill(200);
    rect(johnX,johnY+30*2,johnWidth*2,20*2);
  }
  
  //moves John closer to Dottie, which is to say moves him to the right of the screen
  void moveJohnCloser() {
    johnX += johnVelocity;
  }
  
  //moves John towards the left of the screen
  void moveJohnAway() {
    if (johnX > 0) {
      johnX -= johnVelocity;
    }
  }
  
  //Displaying Dottie by using John's display code, but modified into ellipses instead
  void displayDottie() {
     noStroke();
     
     dottieWidth = 10;
     
     //the legs
     fill(200);
     ellipse(dottieX,dottieY+30*2,dottieWidth+20*2,20*2);
     
     //the body
     fill(150);
     ellipse(dottieX,dottieY+15*2,dottieWidth*2,15*2);
     ellipse(dottieX-5, dottieY+13*2, dottieWidth*2, 7*2);
     
     //the face
     fill(255);
     ellipse(dottieX,dottieY+5*2,dottieWidth*2,10*2);
     
     //the hair
     fill (0);
     ellipse(dottieX,dottieY,dottieWidth + 10*2,5*2);     
     ellipse(dottieX+7,dottieY+15,dottieWidth*2,20*2);   
  }
  
  //function that moves Dottie towards the right of the screen
  void moveDottieCloser() {
      dottieX -= dottieVelocity;
  }
  
  //moves dottie towards the left of the screen
  void moveDottieAway() {
    if (dottieX < width) {
      dottieX += dottieVelocity;
    }
  }
}

