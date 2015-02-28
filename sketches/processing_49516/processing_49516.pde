
class Player { 
  
  float Player;
  float PlayerX; 
  float PlayerY; 
  float PlayerW; //width of player/paddle
  float PlayerH; //height of player/paddle
  float speed = 15;  //speed that the paddle travels left/right


  Player() { //setting the player/paddle
    PlayerX = width/2-10; 
    PlayerY = height-40;
    PlayerW = 130;
    PlayerH = 20;
  }

  void update() {
    if(leftPressed) PlayerX-=speed; 
    else if(rightPressed) PlayerX+=speed;  
    
    fill(14, 129, 88);
    rect (PlayerX, PlayerY, PlayerW, PlayerH);
   

   
    if ( (PlayerX < 0) || (PlayerX > (width-PlayerW))) {
     speed = -speed;
   }
     
   } 
      
}   //adding the left/right key press to move paddle/player.

void keyPressed() { 
  
  if (key == CODED) {
    
   
    if (keyCode == LEFT) {
      leftPressed = true;
    } 
    else if (keyCode == RIGHT) { 
      rightPressed = true;

    }

  }

}
void keyReleased() { 
  
 
    if (keyCode == LEFT) {
      leftPressed = false;
    } 
    else if (keyCode == RIGHT) { 
      rightPressed = false;


  }

}




