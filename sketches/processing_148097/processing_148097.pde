
DodgePlayer one;
DodgePlayer two;
boolean active = true;
PImage startBackGround;
boolean ONEVSONE = false;
dodgeBall ball;
int numPlayersAlive;
int realTime;
int startTime = 61;
int visualTime;
int restartTime = 0;
 
void setup() {
  frameRate(60);
  size(600, 455);
  String bg = "http://i589.photobucket.com/albums/ss335/rumblefighter87/Crunchers_Dodgeball_800x600.jpg";
  startBackGround = loadImage(bg);
  String playerOneImage = "http://i589.photobucket.com/albums/ss335/rumblefighter87/Super_Dodge_Ball_player_big-2.png";
  String playerTwoImage = "http://i589.photobucket.com/albums/ss335/rumblefighter87/player.png";
  String dodgeBall = "http://i589.photobucket.com/albums/ss335/rumblefighter87/81203dff-8be2-4e74-b71f-4c856e21991b.png";
  ball = new dodgeBall(width/2, height/2, 0, loadImage(dodgeBall));
  one = new DodgePlayer(5, 165, 3, loadImage(playerOneImage), 1);
  two = new DodgePlayer(555, 165, 3, loadImage(playerTwoImage), 2);
  
}
 
 
void draw() {
    realTime = millis()/1000;
    visualTime = startTime - ( realTime - restartTime );
  if (active) { //game starts
    
    //load image background
    image(startBackGround, 0, 0);
 
    // One Versus One
    fill(92, 227, 236);
    rect(180, 50, 250, 50, 10, 10, 10, 10);
    textSize(30);
    fill(76, 140, 250);
    text("One Versus One", 188, 85);
 
    // Two Versus Two
    fill(92, 227, 236);
    rect(180, 120, 250, 50, 10, 10, 10, 10);
    textSize(30);
    fill(76, 140, 250);
    text("Two Versus Two", 188, 155);
 
    // Instructions
    fill(92, 227, 236);
    rect(180, 360, 250, 50, 10, 10, 10, 10);
    textSize(33);
    fill(260, 20, 20);
    text("HOW TO PLAY", 193, 400);
 
    //check if mouse hoover over the "One Versus One"
    if ( mouseX > 180 && mouseX < 430 && mouseY > 50 && mouseY < 100 ) {
      fill(117, 242, 253);
      rect(180, 50, 250, 50, 10, 10, 10, 10);
      textSize(30);
      fill(76, 140, 250);
      text("One Versus One", 195, 85);
 
      if ( mousePressed ) {
        restartTime = realTime;
        visualTime = startTime;
        ONEVSONE = true;
        active = false;
      }
      // check if mouse hoover over the "Two Versus Two"
    }
    else if ( mouseX > 180 && mouseX < 430 && mouseY > 120 && mouseY < 170 ) {
      fill(117, 242, 253);
      rect(180, 120, 250, 50, 10, 10, 10, 10);
      textSize(30);
      fill(76, 140, 250);
      text("Two Versus Two", 195, 155);
      // check if the mouse hoover over the "HOW TO PLAY"
    }
    else if ( mouseX > 180 && mouseX < 430 && mouseY > 360 && mouseY < 410 ) {
      fill(117, 242, 253);
      rect(180, 360, 250, 50, 10, 10, 10, 10);
      textSize(33);
      fill(260, 20, 20);
      text("HOW TO PLAY", 200, 400);
    }
  }
  
  if ( ONEVSONE && !active ) {
    background(31, 183, 4);
    one.display();
    two.display();
    strokeWeight(5);
    line(290, 0, 290, 550);
    stroke(255, 255, 255);
    strokeWeight(2);
    line(3, 0, 3, 550);
    stroke(255, 255, 255);
    strokeWeight(2);
    line(3, 0, 3, 550);
    stroke(255, 255, 255);
    strokeWeight(3);
    line(596, 0, 596, 550);
    stroke(255, 255, 255);
    ball.display();
    textSize(65);
    fill(248,114,114);
    text(visualTime,width/2-51,70);
    
    if ( visualTime == 0 ) {
      exit();  
    }
    
    if ( ball.speed <= 0 ) {
      
      if ( ball.collision(one.x, one.y) ) {
        one.theBall = ball;
      
      } else if ( ball.collision(two.x, two.y) ) {
        two.theBall = ball;
      }
      
    } else if ( ball.speed > 0 ) {
      
      if ( 1000-millis() == 0 && one.theBall != ball && ball.collision(one.x, one.y) ) {
        one.die();
      
      } else if ( 1000-millis() == 0 && two.theBall != ball && ball.collision(two.x, two.y) ) {
        two.die();
      }
      
    }
    
  }
}
 
class DodgePlayer {
  int x; // x coordinate
  int y; // y coordinate
  int speed; // movement speed of the player
  PImage imagePlayer;
  int playerType;
  dodgeBall theBall;
 
  DodgePlayer(int leftOrRight, int upOrDown, int s, PImage pl, int type ) {
    x = leftOrRight;
    y = upOrDown;
    speed = s;
    imagePlayer = pl;
    playerType = type;
  }
 
  void display() {
    move();
    image(imagePlayer, x, y);
    if ( theBall != null ) {
      if ( playerType == 1) {
        ball.x = x+13;
        ball.y = y+18;
      }
      else if ( playerType == 2 ) {
        ball.x = x-10;
        ball.y = y+18;
      }
    }
  }
  
  void die() {
    x = 1500;
    speed = 0;  
    
  }
 
  void move() {
    if ( keyPressed == true ) {
      if ( playerType == 1) {
        if ( key == 'w' && y > 10 ) {
          y -= speed;
        }
        else if ( key == 's' && y < 394   ) {
          y += speed;
        }
        else if ( key == 'a' && x > 10 ) {
          x -= speed;
        }
        else if ( key == 'd' && x < 250  ) {
          x += speed;
        }
        else if ( key == 'x' && theBall != null ) {
          theBall = null;
          ball.speed = 6;
          //thrownRight = true;
        }
      } else if ( playerType == 2  ) {
        System.out.println(theBall);
        if ( keyCode == UP && y > 10 ) {
          y -= speed;
        }
        else if ( keyCode == DOWN && y < 394   ) {
          y += speed;
        }
        else if ( keyCode == LEFT && x > 294 ) {
          x -= speed;
        }
        else if ( keyCode == RIGHT && x < 555  ) {
          x += speed;
        }
        else if ( key == '1' && theBall != null ) {
          theBall = null;
          ball.speed = -6;
          //thrownRight = false;
          System.out.println("player two thrown");
        }
      }
    }
  }
}
 
class dodgeBall {
  int x;
  int y;
  int speed;
  PImage ball;
 
  dodgeBall ( int leftOrRight, int upOrDown, int s, PImage b ) {
    x = leftOrRight-25; 
    y = upOrDown-25;
    speed = s;
    ball = b;
  }
 
  void display() {
    move();
    image(ball, x, y);
  }
 
  void move() {
    x += speed;
  }
 
 
  boolean collision(int h, int v) {
    if ( h > x - ball.width-5 && h < x + ball.width-5 && v > y - ball.height-5 && v < y + ball.height-5 ) {
      return true;
    }
    return false;
  }
}
