
Player jim; 

boolean upPressed = false; 
boolean downPressed = false; 
boolean leftPressed = false; 
boolean rightPressed = false; 


void setup() { 
  size(400, 400);  
  smooth(); 

  jim = new Player();
}

void draw() { 

  background(0); 
  jim.update();
}

class Player { 

  float x; 
  float y; 

  float speed = 4; 

  Player() {
    x = width/2; 
    y = height/2;
  }

  void update() {

    if(leftPressed) x-=speed; 
    else if(rightPressed) x+=speed;   
    
    if (upPressed) y-=speed; 
    else if (downPressed) y+=speed;   


    fill(28, 116, 111);
    ellipse(x, y, 30, 30);
  }
}

void keyPressed() { 

  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = true;
    } 
    else if (keyCode == DOWN) { 
      downPressed = true;
    } 
    else if (keyCode == LEFT) {
      leftPressed = true;
    } 
    else if (keyCode == RIGHT) { 
      rightPressed = true;
    }
  }
}

void keyReleased() { 

  if (key == CODED) {
    if (keyCode == UP) {
      upPressed = false;
    } 
    else if (keyCode == DOWN) { 
      downPressed = false;
    }
    else if (keyCode == LEFT) {
      leftPressed = false;
    } 
    else if (keyCode == RIGHT) { 
      rightPressed = false;
    }
  }
}
                
