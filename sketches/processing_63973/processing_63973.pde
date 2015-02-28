


class Fish {


  float positionx;
  float positiony;
  float X; 
  float Y; 
  float targetX;  
  float targetY; 
  float mySize;
  float easingSpeed = .1;  
  color myColor;
  boolean pointsSubtracted;



  Fish(int positionX, int positionY) { 
    X = positionX;
    Y = positionY;
    targetX = X;
    targetY = Y;   
    mySize = 60;
    myColor = color(255);
    pointsSubtracted = false;
    whichFish = fishright;
  }




  void display() { 

    if (pmouseX < mouseX) {

      whichFish = fishright;
    } 
    else if (pmouseX > mouseX) {

      whichFish = fishleft;
      
    }
//    println(mySize);
//    ellipse(X,Y,mySize/2.0,mySize/2.0);
    image(whichFish, X, Y, mySize, mySize);
    
//    saveFrame("data/output/####fishieGame.png");  
  } 






  void update() { 
    targetX = mouseX; 
    targetY = mouseY; 

    X = X + (targetX - X ) * easingSpeed;
    Y = Y + (targetY - Y ) * easingSpeed;

    if ( hitByTrash( trash1 ) || hitByTrash( trash2 ) || hitByTrash( trash3 ) || 
      hitByTrash( trash4 ) || hitByTrash( trash5 ) || hitByTrash( trash6 ) ) { 

//      trash1.X = random (100, 700);
//      trash1.Y = height + mySize; 

      if ( pointsSubtracted == false ) {
        println("I gotz hit"); 

        score -= 2;
        pointsSubtracted = true;
      }
    } 
    else {
      pointsSubtracted = false;
    }



    if ( eatFood( food1 )) {
      food1.X = random (100, 700);
      food1.Y = height + mySize;
      println("Yumm!"); 
      myColor = color(#AAFFFA);
      score += 2;
      mySize = mySize + 4;
    }

    if ( eatFood( food2 )) {
      food2.X = random (100, 700);
      food2.Y = height + mySize; 
      println("Yumm!"); 
      myColor = color(#AAFFFA);
      score += 2;
      mySize = mySize + 4;
    }


    if ( eatFood( food3 )) {
      food3.X = random (100, 700);
      food3.Y = height + mySize; 
      println("Yumm!"); 
      myColor = color(#AAFFFA);
      score += 2;
      mySize = mySize + 4;
    }


    text("score: "+ score, 50, 40);

    if (score < 1) {
      mySize = 60;
    }
  }


  boolean hitByTrash( Trash t ) {

    if ( dist(X, Y, t.X, t.Y) <=  mySize *.5   + t.mySize * .5   ) {
      return true;
    } 
    else {
      return false;
    }
  }

  boolean eatFood( Food f ) {

    if ( dist(X, Y, f.X, f.Y) <=  (mySize *.5 * .20 + f.mySize * .5)  ) {
      return true;
    } 
    else {
      return false;
    }
  }
}


