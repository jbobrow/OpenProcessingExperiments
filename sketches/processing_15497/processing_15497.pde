
/*
Welcome to Fish Storm!
In this retro 8-bit-looking game, you play as a hungry penguin.  
For some reason it's raining fish, so try to catch as many fish in your bowl as you can 
before time runs out and the storm ends.
CONTROLS: Use the left and right arrow keys to maneuver the penguin
Gray fish are worth 10 points
Orange fish are worth 15 points
Purple fish are worth 20 poins
But watch out, the more points they're worth, the faster they fall!
*/

PShape penguinR; //this is the player character
PShape ground; //this is the ground image
PShape fish; //this is the fish image for the first series
PShape fish2; //this is the fish image for the second series
PShape fish3; //this is the fish image for the third series
PFont score_font; //this is the font we'll use for the score and everything else 
int score_num; //this is the score counter 
int player_locX; //this is the horizontal player location
int player_locY; //this is the vertical player location
float fish_locX; //this is the horizontal location of the first series of fish
float fish_locY; //this is the vertical location of the first series of fish
float fish_locX2; //this is the horizontal location of the second series of fish
float fish_locY2; //this is the vertical location of the second series of fish
float fish_locX3; //this is the horizontal location of the third series of fish
float fish_locY3; //this is the vertical location of the third series of fish
int timer; //this is the timer that will count down
int start_time; //this is the where the timer starts
int delay_time; //this is the amount of time that needs to elapse before something happens

void setup() {
  size(800,600); //setting the size to 800 x 600
  score_font = loadFont ("M01_CPS-20.vlw"); //loading the font 
  penguinR = loadShape ("penguinR.svg"); //loading the penuguin image for the player character 
  ground = loadShape ("ground.svg"); //loading the ground image
  fish = loadShape ("fish.svg"); //loading the gray fish image for the first series
  fish2 = loadShape("fish2.svg"); //loading the orange fish image for the second series
  fish3 = loadShape("fish3.svg"); //loading the purple fish image for the third series
  score_num = 0; //the score counter starts at 0
  player_locX = 400; //starting the penguin in the middle horizontally speaking
  player_locY = 400; //the penguin is going to stay at this vertical position, two-thirds of the way down the screen
  fish_locY = 0; //starting the first series of fish at the top of the screen
  fish_locY2 = -200; //starting the second series of fish off screen vertically so they will stagger 
  fish_locY3 = -150; //starting the third series of fish off screen vertically so they will stagger 
  timer = 60; //starting the timer at 60 seconds
  delay_time = 1000; //setting the delay time to 1000 [which will translate to 1 second when we set up the timer]
  start_time = millis(); //setting the start time to match Processing's internal counter
}

void draw(){
 //this first section of calls sets everything up that will show on every frame, regardless of game status
 smooth();
 background(0, 136, 142); //clears the screen with a new background every time draw runs [60x per second]
 shape (ground, 0, 500); //this is the ice base ground image at the bottom of the screen
 textFont (score_font); // setting the font to the cool, retro font i found
 text("SCORE:", 450, 25);  //this is the text that reads "score" towards the upper right
 text (score_num, 600, 25); //this is the actual score
 text("TIME:", 150, 25); //this is the text that reads "time" towards the upper left 
 text(timer, 275, 25);  //displays the timer countdown
 
 //if the timer hits zero, the game ends (in terms of the code, if the timer is zero, the game doesn't start!)
 if (timer == 0){
   text("GAME OVER", 310, 275);
   text("PRESS ENTER TO RESET", 200, 320);
    if (keyPressed && (key == ENTER || key == RETURN)){
    timer = 60;
    score_num = 0;
  }
 } 
  
 
 //if the timer is not at zero... the game actually gets going here
 else{
   
   //this is the timer function, every 1 second [because delay_time = 1000] the timer count drops by one  
   if (millis()-start_time >= delay_time){
     start_time = millis();
     timer--;
   }
   
    //whenever the first series of fish is about to start dropping...
   if(fish_locY == 0){
     fish_locX = random (40,770); //each fish starts at a random horizontal location 
                                  //[with a buffer at each side of the screen]
   }
 
      //whenever the second series of fish is about to start dropping...
   if(fish_locY2 == 0){
     fish_locX2 = random (40,770); //each fish starts at a random horizontal location 
                                  //[with a buffer at each side of the screen]
   }
   
     //whenever the third series of fish is about to start dropping...
   if(fish_locY3 == 0){
     fish_locX3 = random (40,770); //each fish starts at a random horizontal location 
                                  //[with a buffer at each side of the screen]
   }
 
    //this is how the player controls the penguin, this first bit just ensures the penguin still shows up
    //when no keys are being pressed
    if (keyPressed == false){
      shape (penguinR, player_locX, player_locY);
    }
    if (keyPressed && (key == CODED)) { // If a coded key is being pressed

      if (keyCode == RIGHT) { //specifically the right arrow
         player_locX+=2; // then the penguin moves right!
         shape (penguinR, player_locX, player_locY); 
      }
      if (keyCode == LEFT) { // If it’s the left arrow being pressed
        player_locX-=2;  //then the penguin moves left!
        shape (penguinR, player_locX, player_locY); 
      } 
      else{
        shape (penguinR, player_locX, player_locY); //if a coded key is pressed other than left or right, 
                                                    // [e.g shift or command] the penguin won't move, but he stays on screen
      }
    } 
    
    shape (fish, fish_locX, fish_locY); //this draws the first series of fish we've already set up at a random horizontal location
    fish_locY+=1.5; //and this is how we make it drop
    
   
      shape (fish2, fish_locX2, fish_locY2);  //this draws the second series of fish we've already set up at a random horizontal location
      fish_locY2+=2;  //let's make the second series drop a little faster
    
    shape (fish3, fish_locX3, fish_locY3);  //this draws the third series of fish we've already set up at a random horizontal location
      fish_locY3+=2.5;  //let's make the third series drop faster still
  
    //if any fish reaches the bottom of what we're considering the active area, 
    //then we'll reset the vertical location [effectively making a new one]  
    if (fish_locY > 410){ 
    fish_locY = 0;
    }
    
    if (fish_locY2 > 410){ 
    fish_locY2 = 0;
    }
    
     if (fish_locY3 > 410){ 
    fish_locY3 = 0;
    }
    
    //this is the where the scoring takes place.  the fish's horizontal locations need to be offset on both sides so that 
    //the "scoring area" is the bowl in the penguin image
    
    //if the first series of fish [gray] is caught in the bowl, then it scores 10 points!
    if ((player_locX > fish_locX-65) && (player_locX < fish_locX-35) && fish_locY == 409.5){
    score_num +=10;
    }
    
    //if the second series of fish [orange] is caught in the bowl, then it scores 15 points!
    if ((player_locX > fish_locX2-65) && (player_locX < fish_locX2-35) && fish_locY2 == 410){
    score_num +=15;
    }
    
     //if the third series of fish [purple] is caught in the bowl, then it scores 20 points!
    if ((player_locX > fish_locX3-65) && (player_locX < fish_locX3-35) && fish_locY3 == 410){
    score_num +=20;
    }
    
    //this just ensures that the penguin can't be moved off of the left side of the screen
    if (player_locX < -5){
      player_locX+=2;
    }
    
    //this just ensures that the penguin can't be moved off of the right side of the screen
    if (player_locX > 725){
      player_locX-=2;
    }

  }
 
}

  
  
  


