
class Player { 
  
  float x; 
  float y; 
  float speed = 15; 

  Player() {
    x = width/2-10; 
    y = height-40;
  }

  void update() {
    if(leftPressed) x-=speed; 
    else if(rightPressed) x+=speed;   
      
    fill(14, 129, 88);
    rect (x, y, 130, 20);
  }
}
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




