
   

PShape climber1; //this is the player character
PImage bkgrnd; //this is the background image
PImage title; //this is the title screen
PImage title2;
PShape vulture; //this is the vulture image
PShape rock; //this is the rock image
PShape vulture2; //this is the vulture image
PShape rock2; //this is the rock image #2
PShape rock3; //this is the rock image #3
PShape ohno; //this is the oh no text
PShape winner; //this is the win text
int player_locX; //this is the horizontal player location
int player_locY; //this is the vertical player location
float player_sizeX; //this is the player size (horizontal axis)
float player_sizeY; //this is the player size (vertical axis)
float vulture_locX; //this is the horizontal vulture location
float vulture_locY; //this is the vertical vulture location
float vulture2_locX; //this is the horizontal vulture location
float vulture2_locY; //this is the vertical vulture location
float rock_locX; //this is the horizontal rock location
float rock_locY; //this is the vertical rock location
float rock_sizeX;
float rock_sizeY;
float rock2_locX; //this is the horizontal rock location
float rock2_locY; //this is the vertical rock location
float rock2_sizeX;
float rock2_sizeY;
float rock3_locX; //this is the horizontal rock location
float rock3_locY; //this is the vertical rock location
float rock3_sizeX;
float rock3_sizeY;
int gameStatus;

void setup() {
  size(800,600); //setting the size to 800 x 600
  climber1 = loadShape ("climber1.svg"); //loading the climber image for the player character
  bkgrnd = loadImage ("bkgrnd.jpg"); //loading the background image
  vulture = loadShape ("vulture.svg"); //loading the vulture image for the first series
  vulture2 = loadShape ("vulture.svg"); //loading the vulture image for the first series  
  rock = loadShape ("rock.svg"); //loading the rock image
  rock2 = loadShape ("rock.svg"); //loading the rock image
  rock3 = loadShape ("rock.svg"); //loading the rock image
  title = loadImage ("title.jpg"); //loading the title screen
  title2 = loadImage ("title2.jpg");
  ohno = loadShape ("ohno.svg");
  winner = loadShape ("winner.svg");
  player_locX = 600; //starting the climber's horizontal location
  player_locY = 550; //starting the climber's vertical location
  player_sizeX = 150; ; //starting the climber's size (horizontal axis)
  player_sizeY = 150; //starting the climber's size (vertical axis)
  vulture_locX = 850; //starting the vulture's horizontal location 
  vulture_locY = 0; //starting the vulture's horizontal location 
  vulture2_locX = 850; //starting the vulture's horizontal location 
  vulture2_locY = 0; //starting the vulture's horizontal location 
  rock_locX = 0;
  rock_locY = 50;
  rock_sizeX = 20;
  rock_sizeY = 20;
  rock2_locX = 0;
  rock2_locY = 50;
  rock2_sizeX = 20;
  rock2_sizeY = 20;
  rock3_locX = 0;
  rock3_locY = 50;
  rock3_sizeX = 20;
  rock3_sizeY = 20;
  gameStatus= 1; //we will use this integer to determine whether to run the game or end the game, etc.
}

void titleScreen(){
   smooth();
   image (title2, 0, 0); //this is the background image
 
   if (keyPressed && (key == ENTER || key == RETURN)){
    gameStatus = 2;
  }
}

//this is the game over function
void endGameLose(){
  smooth();
  image (bkgrnd, 0, 0); //this is the background image
  shape (climber1, player_locX, player_locY, player_sizeX, player_sizeY);
  player_locY+=8;
  player_sizeX+=2;
  player_sizeY+=2;
  shape (ohno, width/4+20, height/2-100);
  if (keyPressed && (key == ENTER || key == RETURN)){
    setup();
    gameStatus = 2;
  }
}

void endGameWin(){
  smooth();
  image (bkgrnd, 0, 0); //this is the background image
  shape (climber1, player_locX, player_locY, player_sizeX, player_sizeY);
shape (winner, width/4+20, height/2-100);
    if (keyPressed && (key == ENTER || key == RETURN)){
    setup();
    gameStatus = 2;
  }
  
}

void runGame(){
 smooth();
 image (bkgrnd, 0, 0); //this is the background image
 // text (lifeCounter, 600, 25);
  
    //whenever the first vulture is about to start flying across...
   if(vulture_locX == 850){
     vulture_locY = random (100,500); //each vulture starts at a random vertical location 
                                  //[with a buffer at each side of the screen]
   }
   
       //whenever the second vulture is about to start flying across...
   if(vulture2_locX == 850){
     vulture2_locY = random (100,500); //each vulture starts at a random horizontal location 
                                  //[with a buffer at each side of the screen]
   }
 
   if(rock_locY == 50){
     rock_locX = random (180,725); //each rock starts at a random horizontal location 
                                  //[with a buffer at each side of the screen]
   }
   
     if(rock2_locY == 50){
     rock2_locX = random (180,725); //each rock starts at a random horizontal location 
                                  //[with a buffer at each side of the screen]
   }
 
   if(rock3_locY == 50){
     rock3_locX = random (180,725); //each rock starts at a random horizontal location 
                                  //[with a buffer at each side of the screen]
   }
   
    //this is how the player controls the penguin, this first bit just ensures the penguin still shows up
    //when no keys are being pressed
    if (keyPressed == false){
      shape (climber1, player_locX, player_locY, player_sizeX, player_sizeY);
    }
    if (keyPressed && (key == CODED)) { // If a coded key is being pressed

      if (keyCode == RIGHT) { //specifically the right arrow
         player_locX+=2; // then the penguin moves right!
         shape (climber1, player_locX, player_locY, player_sizeX, player_sizeY); 
      }
      if (keyCode == LEFT) { // If it’s the left arrow being pressed
        player_locX-=2;  //then the penguin moves left!
        shape (climber1, player_locX, player_locY, player_sizeX, player_sizeY); 
      } 
      if (keyCode == UP) { // If it’s the left arrow being pressed
        player_locY-=2;  //then the penguin moves left!
        player_sizeX-=.5;
       player_sizeY-=.5; 
        shape (climber1, player_locX, player_locY, player_sizeX, player_sizeY);
       
      } 
      if ((keyCode == DOWN) && (player_locY < 550))  { // If it’s the down arrow being pressed
        player_locY+=2;  //then the climber moves down
         player_sizeX+=.5;
       player_sizeY+=.5; 
        shape (climber1, player_locX, player_locY, player_sizeX, player_sizeY); 
      
      } 
      else{
        shape (climber1, player_locX, player_locY, player_sizeX, player_sizeY); //if a coded key is pressed other than left or right, 
                                                    // [e.g shift or command] the climber won't move, but she stays on screen
      }
    } 
    
    shape (vulture, vulture_locX, vulture_locY); //this draws the vulture we've already set up at a random horizontal location
    vulture_locX-=1.5; //and this is how we make it fly
    
    shape (vulture2, vulture2_locX, vulture2_locY); //this draws the vulture we've already set up at a random horizontal location
    vulture2_locX-=2; //and this is how we make it fly
    
    shape (rock, rock_locX, rock_locY, rock_sizeX, rock_sizeY);
    rock_locY+=2;
    rock_sizeX+=.5;
    rock_sizeY+=.5;
   
       shape (rock2, rock2_locX, rock2_locY, rock2_sizeX, rock2_sizeY);
    rock2_locY+=2.5;
    rock2_sizeX+=.35;
    rock2_sizeY+=.35;
    
       shape (rock3, rock3_locX, rock3_locY, rock3_sizeX, rock3_sizeY);
    rock3_locY+=1.5;
    rock3_sizeX+=.35;
    rock3_sizeY+=.35;
     
  
    //if the vulture reaches the bottom of what we're considering the active area, 
    //then we'll reset the vertical location [effectively making a new one]  
    if (vulture_locX < 180){ 
    vulture_locX = 850;
    }
    
      //if the vulture reaches the bottom of what we're considering the active area, 
    //then we'll reset the vertical location [effectively making a new one]  
    if (vulture2_locX < 180){ 
    vulture2_locX = 850;
    }
    
    if (rock_locY > 600){
      rock_locY = 50;
      rock_sizeX = 20;
      rock_sizeY= 20;
    }

    if (rock2_locY > 600){
      rock2_locY = 50;
      rock2_sizeX = 20;
      rock2_sizeY= 20;
    }
    
    if (rock3_locY > 600){
      rock3_locY = 50;
      rock3_sizeX = 20;
      rock3_sizeY= 20;
    }
    
    //this just ensures that the climber can't be moved off of the left side of the screen
    if (player_locX < 180){
      player_locX+=2;
    }
    
    //this just ensures that the climber can't be moved off of the right side of the screen
    if (player_locX > 725){
      player_locX-=2;
    }

  //this just ensures that the climber can't be moved off of the bottom of the screen
    if (player_locY > 550){
      player_locY-=2;
    }

     //if the climber is hit by a rock, then the endGameLose script runs, and it's a failure
       if((player_locY > rock_locY-rock_sizeY/2+5) && (player_locY < rock_locY+rock_sizeY/2+50) 
       && (player_locX > rock_locX-rock_sizeX/2+5) && (player_locX < rock_locX+rock_sizeX/2+35)){
       gameStatus = 0;
        }
   
       if((player_locY > rock2_locY-rock2_sizeY/2+5) && (player_locY < rock2_locY+rock2_sizeY/2+50) 
       && (player_locX > rock2_locX-rock2_sizeX/2+5) && (player_locX < rock2_locX+rock2_sizeX/2+35)){
       gameStatus = 0;
        }
        
       if((player_locY > rock3_locY-rock3_sizeY/2+5) && (player_locY < rock3_locY+rock3_sizeY/2+50) 
       && (player_locX > rock3_locX-rock3_sizeX/2+5) && (player_locX < rock3_locX+rock3_sizeX/2+35)){
       gameStatus = 0;
        }
        
     //if the climber is hit by a vulture, then the endGameLose script runs, and it's a failure   
       if((player_locY > vulture_locY-50) && (player_locY < vulture_locY+70) &&
        (player_locX > vulture_locX-35) && (player_locX < vulture_locX+50))
       {
       gameStatus = 0;
        }
        
        
       if((player_locY > vulture2_locY-50) && (player_locY < vulture2_locY+70) &&
        (player_locX > vulture2_locX-35) && (player_locX < vulture2_locX+50))
       {
       gameStatus = 0;
        }
        
       if (player_locY < 90){
        gameStatus = 3;
       }
  
  
     

}




void draw(){
  
  if (gameStatus == 1){
    titleScreen();
}
  if (gameStatus == 2){
    runGame();
  }
  
  
  
  if (gameStatus == 0){
    endGameLose();
  }
  
   if (gameStatus == 3){
    endGameWin();
  }
}

  
  
  


