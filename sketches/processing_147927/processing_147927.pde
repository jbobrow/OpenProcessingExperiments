
DodgePlayer one;
DodgePlayer two;
Timer time;
boolean active = true;
PImage startBackGround;
boolean ONEVSONE = false;
void setup() {
    frameRate(60);
    size(600,455);
    String bg = "http://i589.photobucket.com/albums/ss335/rumblefighter87/Crunchers_Dodgeball_800x600.jpg";
    startBackGround = loadImage(bg);
    String playerOneImage = "http://i589.photobucket.com/albums/ss335/rumblefighter87/Super_Dodge_Ball_player_big-2.png";
    String playerTwoImage = "http://i589.photobucket.com/albums/ss335/rumblefighter87/player.png";
    one = new DodgePlayer(5,165,5,loadImage(playerOneImage),1);
    two = new DodgePlayer(555,165,5,loadImage(playerTwoImage),2);
}
  
  
void draw() {

    if(active) { //game starts
    
    //load image background
      image(startBackGround, 0 , 0);
    
    // One Versus One
      fill(92,227,236);
      rect(180, 50, 250 , 50, 10, 10, 10, 10);
      textSize(30);
      fill(76,140,250);
      text("One Versus One", 188, 85);

    // Two Versus Two
      fill(92,227,236);
      rect(180, 120, 250 , 50, 10, 10, 10, 10);
      textSize(30);
      fill(76,140,250);
      text("Two Versus Two", 188, 155);
    
    // Instruction
      fill(92,227,236);
      rect(180, 360, 250 , 50, 10, 10, 10, 10);
      textSize(33);
      fill(260,20,20);
      text("HOW TO PLAY", 193, 400);
    
    //check if mouse hoover over the "One Versus One"
      if ( mouseX > 180 && mouseX < 430 && mouseY > 50 && mouseY < 100 ) {
        fill(117,242,253);
        rect(180, 50, 250, 50, 10, 10, 10, 10);
        textSize(30);
        fill(76,140,250);
        text("One Versus One", 195, 85);
        
        if ( mousePressed ) {
          ONEVSONE = true;
        }
    // check if mouse hoover over the "Two Versus Two"
      } else if ( mouseX > 180 && mouseX < 430 && mouseY > 120 && mouseY < 170 ) {
        fill(117,242,253);
        rect(180, 120, 250, 50, 10, 10, 10, 10);
        textSize(30);
        fill(76,140,250);
        text("Two Versus Two", 195, 155);
    // check if the mouse hoover over the "HOW TO PLAY"
      } else if ( mouseX > 180 && mouseX < 430 && mouseY > 360 && mouseY < 410 ) {
        fill(117,242,253);
        rect(180, 360, 250, 50, 10, 10, 10, 10);
        textSize(33);
        fill(260,20,20);
        text("HOW TO PLAY", 200, 400);  
      } 
    }
    
    if ( ONEVSONE ) {
      background(31,183,4);
      one.display();
      two.display();
      //time.display();
      strokeWeight(5);
      line(290,0,290,550);
      stroke(255,255,255);
      strokeWeight(2);
      line(3,0,3,550);
      stroke(255,255,255);
      strokeWeight(2);
      line(3,0,3,550);
      stroke(255,255,255);
      strokeWeight(3);
      line(596,0,596,550);
      stroke(255,255,255);
    }

}

class DodgePlayer {
  int x; // x coordinate
  int y; // y coordinate
  int speed; // movement speed of the player
  PImage imagePlayer;
  int playerType;
  
  DodgePlayer(int leftOrRight, int upOrDown, int s, PImage pl, int type ) {
    x = leftOrRight;
    y = upOrDown;
    speed = s;
    imagePlayer = pl;
    playerType = type;
  }
  
  void display() {
    move();
    image(imagePlayer,x,y);
    
  }
  
  void move() {
    if ( keyPressed == true && playerType == 1 ) {
      if ( key == 'w' && y > 10 ) {
        y -= speed;
      } else if ( key == 's' && y < 394   ) {
        y += speed;
      } else if ( key == 'a' && x > 10 ) {
        x -= speed;
      } else if ( key == 'd' && x < 255  ) {
        x += speed;
      }
      
    }
  
    if ( keyPressed == true && playerType == 2 ) {
     if ( keyCode == UP && y > 10 ) {
       y -= speed;
     } else if ( keyCode == DOWN && y < 394   ) {
       y += speed;
     } else if ( keyCode == LEFT && x > 294 ) {
       x -= speed;
     } else if ( keyCode == RIGHT && x < 555  ) {
       x += speed;
     }
      
   }  
      
  }
  
  
  
}

class dodgeBall {
    int x;
    int y;
    int speed;
    PImage ball;
}

class Timer {
    
    void display() {
        for( int a = 60 ; a >= 0 ; a-- ) {
            textSize(32);
            text(a, 10, 30); 
            fill(0, 102, 153);
            text(a, 10, 60);
            fill(0, 102, 153, 51);
            text(a, 10, 90); 
        }
    }
}
