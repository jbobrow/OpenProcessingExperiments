
//variables
Ball brendan;
Paddle player;
boolean upPressed, downPressed; //buttons
int gameState, maxscore; //0 = pregame, 1 = in game, 2 = k/o
PImage Ian;

//constants
int p1X, p2X, paddleWidth, paddleHeight, ballSize, playerSpeed;

void showIan() {
     for ( int i = 0 ; i <= height ; i += 100 ) {
       image(Ian, width - 90, i); 
     } 
}  

void setup() {
  size(800,500);
  gameState = 0;
  Ian = loadImage("Ian.jpg");
  brendan = new Ball();
  player = new Paddle();
}

void draw() {
  background(0);

  if ( gameState == 0 ) {
    text("PROTECT BRENDAN", 140, 150);
    text("PRESS ENTER TO PRAY", 140, 200);
    if (keyPressed && key == ENTER ) {
      gameState = 1;
    }
  }
  
  if ( gameState == 1 ) {
    showIan();
    //player.keyPressed();
    player.show(); 
    brendan.bounce();
    brendan.move();
    brendan.show(); 
  }  
  
  if ( gameState == 2 ) {
     text("IAN MCKELLEN IS HAVING HIS WAY WITH BRENDAN!!!", width/2 - 100, height/2); 
     text("PRESS ENTER TO PRAY AGAIN", width/2 -100, height/2 + 50);
     if ( keyPressed && key == ENTER ) {
        setup();
        gameState = 1; 
     }  
  }  
}

class Ball {
  PImage face;
  int posX, posY;
  float velocity;
  boolean right, up;
  Ball() {
    face = loadImage("Brendan.jpg");
    posX = width/2;
    posY = height/2;
    right = true;
    up = true;
    velocity = 5;
  }
  void bounce() {
      if (posX < 0)
    {
      right=true;
    }
    if (posX > width - 40)
    {
      right=false;
    }
    if (posY < 0)
    {
      up=true;
    }
    if (posY > height - 60)
    {
      up=false;
    }
    if ( posX > player.posX - 35 && posY > player.posY - 80 && 
         posY < player.posY + 80 && right) {
           velocity *= 1.15;
           right = false;   
         }
    if ( posX > player.posX ) gameState = 2;  //GAME OVER!!!
    }

  void move() {
    if (up==true)
    {
      posY+= velocity;
    }
    else
    {
      posY-=velocity;
    }
    if (right==true)
    {
      posX+=velocity;
    }
    else
    {
      posX-=velocity;
    }
  }

  void show() {
    image(face, posX, posY);
  }

}

class Paddle {

  final int posX = width - 100;
  int posY;
  float velocity;
  
  Paddle() {
    posY = height/2;
    velocity = 8;
  }

 /* void keyPressed() {
    if (keyPressed && keyCode == UP && posY > 0)
    {
      posY-=velocity;
    }
    if (keyPressed && keyCode ==DOWN && posY < height - 100)
    {
      posY+=velocity;
    }
  }
*/
  void show() {
    stroke(255, 0, 0);
    fill(0, 255, 0);
    posY = mouseY
    rect(posX, posY, 10, 100);
  }  
}

