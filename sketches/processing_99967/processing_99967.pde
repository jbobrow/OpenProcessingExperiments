
//variables
Ball brendan;
Paddle player;
float scoreModifier;
boolean upPressed, downPressed; //buttons
int gameState, score; //0 = pregame, 1 = in game, 2 = k/o
PImage Ian, openingBrendan, ending;
PFont sexy;

void setup() {
  stroke(255, 0, 0);
  fill(0, 255, 0);
  sexy = loadFont("gameFont.vlw");
  size(800,500);
  gameState = 0;
  scoreModifier = 1;
  score = 0;
  openingBrendan = loadImage("jungle.jpg");
  Ian = loadImage("Ian.jpg");
  brendan = new Ball();
  player = new Paddle();
}

void draw() {
  background(0);
  if ( gameState == 0 ) {
    image(openingBrendan, width/2 - 80, height/2);
    textFont(sexy, 40);
    text("PROTECT BRENDAN FRASER", 140, 150);
    textFont(sexy, 25);
    text("PRESS ENTER TO BRAVE THE PIT OF SIR IAN", 140, 200);
    if (keyPressed && key == ENTER ) {
      gameState = 1;
    }
  }
  
  if ( gameState == 1 ) {
    printScore();
    showIan();
    brendan.bounce();
    brendan.move();
    brendan.show(); 
    //player.keyPressed();
    player.show();  
  }  
  
  if ( gameState == 2 ) {
     ending = loadImage("ending.jpg");
     textFont(sexy, 25);
     text("IAN MCKELLEN IS HAVING HIS WAY WITH BRENDAN!!!", 100, height/2 - 150); 
     text("YOUR SCORE: " + score, 100, height/2 - 100);
     text("PRESS ENTER TO PLAY AGAIN", 100, height/2 - 50 );
     image(ending, 100, height/2);
     if ( keyPressed && key == ENTER ) {
        setup();
        gameState = 1; 
     }  
  }  
  
}

void showIan() {
  for ( int i = 0 ; i <= height ; i += 100 ) {
    image(Ian, width - 90, i); 
  }
} 

void printScore() {
   text("" + score, 40, 40);
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
    if (posX < 0) {
      right=true;
    }
    if (posX > width - 40) {
      right=false;
    }
    if (posY < 0) {
      up=true;
    }
    if (posY > height - 60) {
      up=false;
    }
    if ( posX > player.posX - 35 && posY > player.posY - 80 && 
    posY < player.posY + 80 && right) {
           velocity *= 1.05;
           right = false;   
           score += (int)scoreModifier;
           scoreModifier *= 1.5;
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
    velocity = 5;
  }
  
  void show() {
    posY = mouseY - 50;
    rect(posX, posY, 10, 100);
  }  
}

