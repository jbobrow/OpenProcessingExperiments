
//This is Kenneth Thieu's final project for APCS @ Balboa High

//In the future, plan to use this idea/concept for a more complex game

Circle c;
boolean gameOn;
boolean gameEnd;
boolean mouseclick;
boolean boardEmpty;
int combo;
int totalScore;
int time;
PImage over;
 
void setup() {
  size(500,300);
  background(255);
  totalScore = 0;
  mouseclick = false;
  boardEmpty = true;
  combo = 0;
  gameOn = false;
  frameRate(30);
  time = 0;
  gameEnd = false;
  over = loadImage("miku chibi.jpg");
}
 
void draw() {
  if(gameOn == true && time / 30 == 30) { //check to see if time is up
     gameOn = false;
     gameEnd = true;
     mouseclick = false;
    }
  if(gameEnd == true && gameOn == false) { //End of the game
     background(255);
     textSize(25);
     fill(0,255,255);
     text("Total Score is : " + totalScore, width/2, height / 2 + 100);
     image(over ,0,0);
  }
  if (gameOn == false && gameEnd == false) { //Title Screen
 
   textSize(50);
   background(0);
   fill(0, 0, 255);
   text("Random Dot Game" , 0, height/2);
   textSize(15);
   text("Click anywhere to begin the game. You have 30 seconds", 0, height / 2 + 40);
  }
   
 if(mouseclick == true && gameOn == false) {
   background(255);
   gameOn = true;
     
 }
  
 if(gameOn == true) { //Game initialized; frameCount begins counting...
  time = frameCount;
  textSize(40);
  text("Score: " + totalScore + ", Combo: " + combo,  0 , 50);
  
 if(boardEmpty) {
   c = new Circle();
   boardEmpty = false;
  }
    
  }
 
}
void mouseClicked() {
  if(mouseclick == false && gameEnd == false) { //Prevents errors when clicking on the Title Screen
     mouseclick = true;
  } else if(gameOn == true) {
    float r = c.getRadius();
  if (mouseX < c.getXLoc() + r && mouseX > c.getXLoc() - r
  && mouseY < c.getYLoc() + r && mouseY > c.getYLoc() - r) {
    if (combo >= 1) { //insures score isn't multiplied by a combo of zero
       totalScore += combo * score();
       combo++;
    } else {
       totalScore += score();
      combo++; // add to totalScore the points that the current circle on the screen is worth
       } } else {
       totalScore -= 10 * score();
       combo = 0;// miss and you lost five times the points the circle is worth
       }
       
        background(255);
        boardEmpty = true;
 }
  
}
  
  
int score() { //Scores for the appropriate circle based on the radius
  int score = 0;
 float r = c.getRadius();
 if(r >= 10 && r <= 15) {
   score = 5;
 } else if(r >= 16 && r <= 25) {
   score = 4;
 } else if(r >= 26 && r <= 35) {
   score =  3;
 } else if(r >= 36 && r <= 45) {
   score =  2;
 } else {
   score = 1;
 }
 return score;
}
 
 
class Circle {
  PVector location;
//PVector velocity;
   
   
  Circle c;
  
  float rSize;
   
  Circle() {
     
    location = new PVector(random(width), random(51, height));
    //velocity = new PVector(random(10, 50), random(5, 25)); //might use later
    rSize = random(20,120);
    stroke(0);
    fill(255, 0 ,0); //red circles
    checkSpawnLeft();
    checkSpawnRight();
    checkSpawnAbove();
    checkSpawnBelow();
    ellipse(location.x, location.y, rSize, rSize);
     
    }
    /*
    void update() {
      location.add(velocity);
    }
    */
     //Following makes sure the circles don't generate off screen or with parts of the circle not within the frame
    void checkSpawnLeft() {
     if(location.x - getRadius() <= 0) {
      location.x += random(getRadius() * 2, width/2);
      }
    }
    void checkSpawnRight() {
     if(location.x + getRadius() >=width) {
        location.x -= random(getRadius() * 2, width/2);
     }
   }
   void checkSpawnAbove() {
      if(location.y - getRadius() <= 50) {
         location.y += random(getRadius() * 2, height/2);
      }
   }
   void checkSpawnBelow() {
      if(location.y + getRadius() >= height) {
         location.y -= random(getRadius() * 2, height/2);
      }
   }
    
     
     
    float getRadius() {
      return rSize / 2;
    }
    float getXLoc() {
     return location.x;
    }
    float getYLoc() {
     return location.y;
    }
   
  
   
}

