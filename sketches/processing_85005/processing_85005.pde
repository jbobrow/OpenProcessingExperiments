

//variables.
int score = 0; // starts my score as 0
float speed = 2; //speed set at 2
float bottleSpeed = 2; //speed of bottle set at 2
float rectY = 280; //y axis of cat set at 280. this changes throughout the game, but he will start in 280
float rectX = 100; //x axis of cat set at 100 
float ballSpeed = 5; // yarnballs speed
float distance = 5; // a variable Ive used to move the cat distancedistance
float rectW = 100; //a variable Ive set up to keep the cats width
float rectH = 60; //a variable set up to keep the cats height


player cat; //initalise cat

 //a list of booleans that will be used later.
boolean gameOver;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;


//images
// setting up my image names to be imported later
PImage catimage;
PImage yarnimage;
PImage milkbottleimage;
PImage spaceBG;

//Arrays
YarnBall[] balls = new YarnBall[0]; //set an array for a yarnball and it will start at 0
MilkBottle[] bottles = new MilkBottle[0]; //setting an array for the milkbottles and will start at 0


void setup () {
  size (1000, 600); //canvas size
  
  cat = new player (); //creating the cat as a 'new object' called player
  frameRate(60); //framerate set to 60 
  
  //loading images
  catimage=loadImage ("FlyingKitty.png"); //cat image loaded from delared in PImage
  yarnimage= loadImage ("Yarn.png"); //yarn image loaded from declared in PImage
  milkbottleimage= loadImage ("milkbottle.png"); //milkbottle image loaded from declared in PImage
  spaceBG= loadImage ("spacebg.jpeg"); //spacebackground image loaded from declared in PImage
  
 
}
void draw () {
  background (0); //background set to black
  image(spaceBG, 0, 0, 1000, 600); //space background image set to x+y to zero, and same size of the canvas
  
  cat.update(); //the cat image and its position is updated.
  
  fill(255); 
  textSize (15);
  textAlign(CENTER);
  text("score." + score, 40, 30); //a white text is inserted saying score.
  
  //update game
  updateBottles(); //updates the positon and amount of bottles
  updateYarn(); //updates the postions and amount of yarnballs
}

//restart game if mouse pressed

void mousePressed() { //mouseclick comands...
  
  if(gameOver) { // .. IF the game is over...
     
    resetGame(); //...then the game is reset
    
    
  }  
}

void resetGame() { //the follow command start as soon as you click to restart the game.
        //loop through the balls, resetting their positions off screen
   for(int i = 0; i < balls.length; i++) { //loop through each of the balls
     balls[i].x = -100; //move each individual ball to an X pos of -100 (off screen)
   }
     
       // loop through the bottles, resetting their positions off screen
   for (int b = 0; b <bottles.length; b++) { // //loop through each of the bottles
     bottles[b].x = -100;  //move each individual bottle to an x pos of -100
   }
   
   score = 0; //reset score to 0
   image(catimage, rectX, rectY);  //starting postiton for the cat
   gameOver = false; //reset game state
   
   
}
 
 //player keyboard command
void keyPressed() { // this function is fired when a key is pressed
 if (key == CODED) { //this is so that we can use keycodes
   if (keyCode == UP){ //if the 'up' arrow is pressed 
     upPressed = true; //by setting the upPressed as true, it is telling the programme the up arrow has been pressed. the rest follow the same pattern.
   }
   else if (keyCode == DOWN) { 
     downPressed = true;
   }
   else if (keyCode == LEFT) {
     leftPressed = true;
   }
   else if (keyCode == RIGHT){
     rightPressed = true;
   }
 }
}

void keyReleased() {
 if (key == CODED) {
   if (keyCode == UP){ //if the key is released
     upPressed = false; //this is resetting the values for the keyPressed variables which will make the player stop moving once key is released
   }
   else if (keyCode == DOWN) {
     downPressed = false;
   }
   else if (keyCode == LEFT) {
     leftPressed = false;
   }
   else if (keyCode == RIGHT){
     rightPressed = false;
   }
 }
}

//function for updating the balls of yarn
void updateYarn() {
  //once a second add a new yarn ball
  if(frameCount % 40 == 0) { // since there are 60fps this will evaluate as true and happen once a second.
    YarnBall ball = new YarnBall();// creating a new yarnball object assigned to the variable ball 
    balls = (YarnBall[]) append(balls, ball); //the append command is useful here as it 'Expands an array by one element and adds data to the new position*'
                                              //             *file:///Applications/Processing.app/Contents/Resources/Java/modes/java/reference/append_.html
    ballSpeed +=0.05; //the ball speed is increased by 0.05.
  }
  //if more than 10 yarn balls, get rid of the oldest one.
  if (balls.length>10){ //if there are more than 10 balls in the length of screen...
    balls = (YarnBall[]) subset(balls, 1); //...then remove the first and begin from the next number.
  }
  
  for (int i = 0; i<balls.length; i++) { // there are less than 10 add more.
    balls[i].update(); //update the balls
  }
}


void updateBottles() { //this works the same as the previous updateYarn function
  if (frameCount % 40 == 0) {
    MilkBottle bottle = new MilkBottle();
    bottles= (MilkBottle[]) append(bottles, bottle);
    speed +=0.01;
  }
  
  if (bottles.length >10) { 
    bottles = (MilkBottle[]) subset(bottles, 1);
  }
  for(int i = 0; i<bottles.length; i++) {
    bottles[i].update();
  }
}


class player {  //making the class player now.
  float x; //i am setting the x position as a float to make it more accurate
  float y; // and also the y.
  float speed = 4; //the speed is set to 4
  

  void update() { 

   
    if (leftPressed) { //if the left button is pressed then...
      rectX-=speed; //...my predeclared rectX -2 bringing it back on X axis
    } 
    else if (rightPressed) {
      rectX+=speed; //rectX +2 moving it along the X axis
    }

    if (upPressed) {
      rectY-=speed; //rectY -2 moving down y axis 
    } 
    else if (downPressed) {
      rectY+=speed; //rectY +2 moving up Y axis
    }
    image(catimage, rectX, rectY); 
    // this next section is to keep the player in the screen using its boundries 
    if (rectY<0) {
      rectY+=distance; //if the y of cat is less than 0 then add 5 to keep it in
    }
    if (rectX< 0) {
      rectX +=distance; //if the x of the cat is less than 0 then that +5 aswell
    }

    if (rectY>height - rectH) {
      rectY-=distance; //if the Y is greater than the hight minus the size of the image height, then - a further 5.
   
    }
    
   if (rectY>width - rectW) {
     rectY -= distance; //if the Y is greater than the width of screen minus the declared width of the image then, - another 5
   }
   
     

     for (int i = 0; i<bottles.length; i++) { //everytime the player is updated loop through the bottles
        MilkBottle bottle = bottles[i];
       
        
        //the if statement determines weither the cat has touched the bottle.
            //IF the front of the cat is further right than the back of the bottle...
            // and the back of the cat is left of the front of the bottle...
            //and top of the cat is below the top of the bottle...
            //and the top of the cat is above the bottom of the bottle...
        if ((rectX+rectW>bottle.x) && (rectX<bottle.x) && (rectY>bottle.y-bottle.h) && (rectY<bottle.y+bottle.h)) { 
          bottle.alive = false; // collects bottle, sets alive to false which will make it disappear.
          bottle.velX = 50; // moves at a speed of 50
          score++; //add value of 1 to score
          
        
       }
      //if the cat touches the ball its game over
      
      //if..
      if (!gameOver) { //if gameover state is set
        for (int b = 0; b<balls.length; b++) { //loop through each of the balls 
          YarnBall ball = balls[b]; //assign the variable ball to each one
          //IF the front of the cat is further right than the back of the ball...
          // and the back of the cat is left of the front of the ball...
          //and top of the cat is below the top of the ball...
          //and the top of the cat is above the bottom of the ball...
          if ((rectX+rectW>ball.x) && (rectX<ball.x + ball.w) && (rectY>ball.y-ball.h) && (rectY<ball.y+ball.h)) {
            gameOver = true;
          }
        }
      }
      
      else if (gameOver == true) { //if game over state is true then the following commands happen...
  
        textAlign(CENTER); //text is set to center
        textSize(40); // sized at 40
        fill(255); //font colour is white 
        text("Score:" + score, width/2, height/2-50); //text reads 'score, plus the value of score at half the width and half the heigh

        textSize(60); //text set to 60
        fill(255); //set to white
        text("SPLAT!", width/2, height/2); //the word splat is center screen 
        
        textSize(40);// text set to 40
        fill(255); //white font
        text("CLICK MOUSE TO TRY AGAIN", width/2, height/2 +150); //click mouse to try again is set half width half height add 150 
      }
    } // for loop end
  }
}
// setting a list of floats and boolean for my 'YarnBall' class.
class YarnBall {
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  float velback;
  boolean alive;

  YarnBall() {
    
    y = random(0, height*0.7); //setting the starting y postion i set at 0.7 so it wouldnt be a whole
    w = 50; //set to 50 as its the size stated in the png file
    x = width + (w/2); //when you create new ball, create off screen 
    h = 48; // has a height of 48
    velX = -ballSpeed; //its speed is -5
    alive = true; //alive set to true
  } 

  void update() { //this function is called everytime the ball updates
    //dont update the balls in game over state
    if (!gameOver) { // if its not game over...
    
      x+=velX; // increase x by -5, in other words, move the ball to the left 5 pixels
      
      if (alive) { // if alive
        fill(255, 0, 0); 
        image(yarnimage, x, y, w, h);
      } else {
        fill(130, 0); 
        noStroke();
      }
    }
  }
}
   
   //milkbottle class. These follow the conventions for the bottle...
class MilkBottle { 
  float x;
  float y;
  float w;
  float h;
  float velX;
  float velY;
  float velback;
  boolean alive;

  MilkBottle() {

    y = random(0, height*0.9); 
    w = 40;
    x = width + (w/2);
    h = 40;
    velX = -speed;
    velback = +100;
    alive = true;
  } 

  void update() {
    x+=velX;
    
    if (gameOver == false) {

    if (alive) {
      fill(255, 0, 0);
      image(milkbottleimage, x, y, w, h);
    } else {
      fill(255, 0); 
      noStroke();
      
    }
    }
  }
}


