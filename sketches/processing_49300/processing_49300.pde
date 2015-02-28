
//key pressed variables
boolean leftPressed = false;
boolean rightPressed = false;
boolean spacePressed = false;

Player myPlayer;
Platform[] platforms = new Platform[2];

void setup() {

  size(500,500);
  smooth();
  noStroke();
  myPlayer = new Player();
  
  for(int i=0; i<platforms.length; i++) {
    platforms[i] = new Platform(random(width),random(height));
  }
}

void draw() {

  background(0);
  for(int i=0; i<platforms.length; i++) {
    platforms[i].update();
  }
  myPlayer.update();
  myPlayer.collisionCheck();
  
}

void keyPressed() {
 
  if (key == CODED) {
    if (keyCode == LEFT) leftPressed = true;
    else if (keyCode == RIGHT) rightPressed = true;
  }
  if (key == ' ') spacePressed = true;//myPlayer.jump();
}
 
void keyReleased() {
 
 if (key == CODED) {
   if (keyCode == LEFT) leftPressed = false;
   else if (keyCode == RIGHT) rightPressed = false; 
 }
}

class Player {
  
  float x;
  float y;
  float xspeed = 6.5;
  float jumpspeed = 25;
  float drag = 0.9;
  
  float playersize;
  float playerbase;
  float gravity = 5.5;
  
  
  Player() {
  
    x = width/2;
    y = height/2;
    playersize = 30;
  }
  
  void jump() {
    
    if(spacePressed) {
     // float jumpspeed = 4;
      // float drag = 0.8;
      
      jumpspeed *= drag;
      y-=jumpspeed;
      println(y);
    }
  }
  
  void update() {
  
    if(leftPressed) x-=xspeed;
    else if(rightPressed) x+=xspeed;
    
    jump();
        
    fill(255);
    rect(x, y, playersize, playersize); 
    y+=gravity;
  }
  
  
  
  void collisionCheck() {
    
    playerbase = y+playersize;
    
    if(playerbase > height ) {
      y = height-playersize;
      //gravity = 0;
    } 
    
    for(int i=0; i<platforms.length; i++) {  
      if(playerbase > platforms[i].y && playerbase < platforms[i].y+platforms[i].blockheight && x > platforms[i].x && x < platforms[i].x+platforms[i].blocklength) {
        //gravity = platforms[i].yvel;
        y = platforms[i].y-playersize+platforms[i].yvel;
        //spacePressed = false;
      } 
      
    }
  }
}

class Platform {

  float x;
  float y;
  float yvel = 2;
  float blocklength = 120;
  float blockheight = 10;
  color c = color((int)random(255), (int)random(255), (int)random(255));

  
  Platform(float xpos, float ypos) {
  
    x = xpos;
    y = ypos;
  }
  
  void update() {
    
    y+=yvel;
    
    if(y+blockheight > height || y < 0) {
    yvel = -yvel;
    }
  
    fill(c);
    //rectMode(CENTER);
    rect(x,y, blocklength, blockheight);
  }

}

