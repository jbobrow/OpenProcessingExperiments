
class Agent {
  int posX, posY;
  float angle, speed;

  PImage[] imgList;
  int imgIndexToDraw;
  final int sign_sum = 12;
  int num =  (int)random (1, 12);
      int w= 0;

  int millis_NextNeedForMatch;
  int millis_GameOver;
  int millis_NextRethink;
  int myMood;
  final int MOOD_STANDING =0;
  final int MOOD_WANDERING =1;//
  final int MOOD_SEEK_BUDDY = 2; //
  final int MOOD_DANCING = 3;// SPINNING AROUND
  final int MOOD_HATING = 4;//AVOID EACH OTHER
  final int MOOD_FIND_LOVER = 5;//BECOME STAR

  Agent myBuddy = null, myEnemy = null, myLover = null;
  int posX_wasHere = 0, posY_wasHere = 0;

  boolean isGrabbedByMouse = false;
  boolean iamLover = false;

  Agent() {
    posX = mouseX;
    posY = mouseY;
    angle = random (0.0, TWO_PI);
    speed = random(0.5, 1.5);
    millis_NextRethink = millis()+3000;
    myMood = MOOD_WANDERING;
    millis_NextNeedForMatch = millis()+1000;
  }

  void AI() {

    isGrabbedByMouse = mousePressed && (dist(mouseX, mouseY, posX, posY) <100.0);
    if (isGrabbedByMouse) {
      posX = mouseX;
      posY = mouseY;
      return;
    } 

    if (true) {
      millis_NextRethink = millis() + (int)random(5000, 10000);

      float baseBehaviorOn = random(0, 20);

      if (baseBehaviorOn <1.0) {
        myMood = MOOD_STANDING;
      }
      else if (baseBehaviorOn<8.0) {
        myMood = MOOD_WANDERING;
      }
      else if (baseBehaviorOn<15.0) {
        myMood = MOOD_SEEK_BUDDY;

        myBuddy = null;
        myEnemy = null;
        myLover = null;
        float distToNearestBuddy = 200.0;
        for (int i=0; i<agents.size(); i++) {
          Agent oneAgent = (Agent)agents.get(i);
          if ( oneAgent != this && dist(oneAgent.posX, oneAgent.posY, posX, posY) < distToNearestBuddy ) {
            distToNearestBuddy = dist(oneAgent.posX, oneAgent.posY, posX, posY);

            if ((oneAgent.num ==3 && this.num ==5)||(oneAgent.num ==12 && this.num ==1)||(oneAgent.num ==9 && this.num ==11)||
              (oneAgent.num ==5 && this.num ==7)||(oneAgent.num ==1 && this.num ==12)||(oneAgent.num ==11 && this.num ==2)||
              (oneAgent.num ==7 && this.num ==4)||(oneAgent.num ==4 && this.num ==8)||(oneAgent.num ==2 && this.num ==6)||
              (oneAgent.num ==10 && this.num ==3)||(oneAgent.num ==8 && this.num ==4)||(oneAgent.num ==6 && this.num ==9)) {
              myEnemy = oneAgent;
              myMood = MOOD_HATING;
            }
            else if ((oneAgent.num ==3 && this.num ==1)||(oneAgent.num ==12 && this.num ==4)||(oneAgent.num ==9 && this.num ==8)||
              (oneAgent.num ==5 && this.num ==6)||(oneAgent.num ==1 && this.num ==2)||(oneAgent.num ==11 && this.num ==12)||
              (oneAgent.num ==7 && this.num ==9)||(oneAgent.num ==4 && this.num ==5)||(oneAgent.num ==2 && this.num ==1)||
              (oneAgent.num ==10 && this.num ==11)||(oneAgent.num ==8 && this.num ==7)||(oneAgent.num ==6 && this.num ==4)) {
              myLover = oneAgent;
              myMood = MOOD_FIND_LOVER;
            }
            else
              myBuddy = oneAgent;
          }//end of if (dist closer)
        }//end of for agents.size
      }
      else {
        myMood = MOOD_FIND_LOVER;
      }//end of find love
    }//end of else

    switch(myMood) {
    case MOOD_STANDING:
      speed = 0.0;
      break;
    case MOOD_WANDERING:
      if (num>0 && num <4) {
        speed = 12.0;
      }
      else if (num>3 && num <7) {
        speed = 7.0;
      }
      else if (num>6 && num <10) {
        speed = 5.0;
        angle = 30.0;
      }
      else {
        speed = 3.0;
      }
      break;
    case MOOD_DANCING:
      speed = 50.0;
      angle +=15.0;
      break;
    case MOOD_SEEK_BUDDY:
      if (myBuddy != null) {
        angle = atan2(myBuddy.posY-posY, myBuddy.posX-posX);
        speed = 30.0;
        if ( dist(myBuddy.posX, myBuddy.posY, posX, posY) <40.0) {
          myBuddy.myMood = MOOD_DANCING;
          myMood = MOOD_DANCING;
          myBuddy.millis_NextRethink = millis() + 3000;
          millis_NextRethink = millis() + 3000;
        }
      } 
      else if (myEnemy != null) {
      }
      else if (myLover !=null) {
      }
      else {
        myMood = MOOD_STANDING;
      }
      break;
    case MOOD_HATING:

      break;
    case MOOD_FIND_LOVER:

      break;
    }
  }//end of AI

  boolean tooLonely() {
    return(millis_NextNeedForMatch +15000< millis());
  }

  void drawAndMove() {

    AI();
    posX_wasHere = posX;
    posY_wasHere = posY;
    posX += speed * sin(angle);
    posY += speed * cos(angle);
    boundsCheck();

    imgList = new PImage[sign_sum];
    for (int i =0;i<sign_sum;i++) {

      imgList[i] = loadImage("sign"+num+".png");
    }
    image(imgList[imgIndexToDraw], posX, posY);

    if (myEnemy != null) {
      fill(0);
      stroke(96, 213, 219, 180);
      strokeWeight(10);
      int dist_long = (int)dist(posX+40, posY+40, myEnemy.posX+40, myEnemy.posY+40);
      int dots = dist_long/10;
      int dist_X = ((myEnemy.posX+40)-(posX+40))/10;
      int dist_Y = ((myEnemy.posY+40)-(posY+40))/10;
    
      for(int p =1;p< dots; p++){
       
      point(posX+40+dist_X*(p-1),posY+40+dist_Y*(p-1));}
    }

    if (myLover !=null) {
      fill(0);
      stroke(255, 174, 201, 120);
      strokeWeight(6);

      line(posX+40, posY+40, myLover.posX+40, myLover.posY+40);

      float avg_posX = (posX+ myLover.posX)/2.0;
      float avg_posY = (posY+ myLover.posY)/2.0;

      posX =(int)avg_posX;
      posY =(int)avg_posY;

if(w<5){
w++;}else{
      iamLover = true;
}
      star ++;      
    }
  }

  void boundsCheck() {

    if ( theWorld.isThereAWallHere(posX, posY) ) {
      posX = posX_wasHere;
    }

    if ( theWorld.isThereAWallHere(posX, posY) ) {
      posY = posY_wasHere;
    }

    if (posX < 0) {
      posX =0;
    }
    if (posX+80 >= width) {
      posX = width-80;
    }
    if (posY < 0) {
      posY =0;
    }
    if (posY+80 >= height) {
      posY =height-80;
    }
  }
}


