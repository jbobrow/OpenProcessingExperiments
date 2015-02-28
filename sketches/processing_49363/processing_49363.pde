
//key pressed variables
boolean leftPressed = false;
boolean rightPressed = false;
boolean spacePressed = false;

boolean gameover = false;
 
Player myPlayer;
Platform[] platforms = new Platform[20];
 
void setup() {
 
  size(400,800);
  smooth();
  noStroke();
  frameRate(60);
  myPlayer = new Player();
  
  //this sould create teh distace between the platforms and stager them based on i
  for(int i=0; i<platforms.length; i++) {
    if(i%2==0 || i==0) {
    platforms[i] = new Platform(50, i*40);
    } else
    platforms[i] = new Platform(250, i*40);
  }
}
 
void draw() {
 
 if(!gameover) {
    background(0);
    for(int i=0; i<platforms.length; i++) {
      platforms[i].update();
    }
    myPlayer.update();
    //myPlayer.collisionCheck();
    for(int i=0; i<platforms.length; i++) {
      if(platforms[i].collision(myPlayer.x, myPlayer.y, 30, 30)) {
      
        myPlayer.airborne = false;
        break;
      }
    }
  } else {
  text("GAME OVER", width/2, height/2);
  text("press space to play again", width/2, (height/2)+50);
  }
   
}
 
void keyPressed() {
  
  if (key == CODED) {
    if (keyCode == LEFT) leftPressed = true;
    else if (keyCode == RIGHT) rightPressed = true;
  }
  if (key == ' ') {
      spacePressed = true;
      gameover = false;
  }
}
  
void keyReleased() {
  
 if (key == CODED) {
   if (keyCode == LEFT) leftPressed = false;
   else if (keyCode == RIGHT) rightPressed = false;
 }
 if (key == ' ') spacePressed = false;
}

class Platform {
 
  float x;
  float y;
  float startx;
  float starty;
  float yvel = 2;
  float blocklength = random(80,120);;
  float blockheight = 10;
  color c = color((int)random(100,255), (int)random(100,255), (int)random(100,255));
 
   
  Platform(float xpos, float ypos) {
   
    //add a random deviate
    x = xpos;
    y = ypos;
    startx = x;
    starty = y;
  }
  
  void reset(){
   
   x = startx;
   y = 0;
  }
   
  void update() {
     
    y+=yvel;
     
    if(y+blockheight > height) {
    reset();
    }
    
      
    fill(c);
    //rectMode(CENTER);
    rect(x,y, blocklength, blockheight);
  }
  
  boolean collision(float xtemp, float ytemp, float widthtemp, float heighttemp) {
     
    return(x < (xtemp+widthtemp) && (x+blocklength) > xtemp && y < (ytemp+heighttemp) && (y+blockheight) > ytemp);
  } 
 
}

class Player {
   
  float x;
  float y;
  float xspeed = 6.5;
  float jumpspeed;
  float drag;
   
  float playersize;
  float playerbase;
  float gravity = 9;
  
  boolean grounded = false;
  boolean airborne = true;  
   
  Player() {
   
    x = width/2;
    y = 0;
    playersize = 30;
  }
   
  void jump() {
     
    if(spacePressed && grounded) {
      jumpspeed = -150;
      drag = 0.8;
       
      jumpspeed *= drag;
      y+=jumpspeed;
      
      grounded = false;
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
   
   
   
//  void collisionCheck() {
//     
//    playerbase = y+playersize;
//     
//    if(playerbase > height ) {
//      gameover = true;
//      y = 0;
//    }
//    if(x > width) x = 0-playersize;
//    else if(x < 0-playersize) x = width;
//     
//    for(int i=0; i<platforms.length; i++) { 
//      if(playerbase > platforms[i].y && playerbase < platforms[i].y+platforms[i].blockheight && x > platforms[i].x && x < platforms[i].x+platforms[i].blocklength) {
//        //gravity = platforms[i].yvel;
//        y = platforms[i].y-playersize+platforms[i].yvel;
//        //grounded = true;
//        airborne = false;
//      }
//       
//    }
//  }
}

 

                                                                                                                                                                
