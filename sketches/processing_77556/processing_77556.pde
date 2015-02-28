
/*
Background image credit to sur-mata on deviantart.com 
< http://sur-mata.deviantart.com/art/Mountain-Stairs-212222566 >

Character image credit to Tasogare Frontier & Team Shanghai Alice
Sprite from Scarlet Weather Rhapsody 

Music credit to Team Shanghai Alice
"Mysic Oriental Dream ~ Ancient Temple" - Perfect Cherry Blossom

And if you're interested, here's a helpful start to rectangular collision!
< http://wiki.processing.org/w/Rect-Rect_intersection >

In this alpha build, the player successfully moves around the game
space through the arrow keys on the keyboard and is constrained to the
screen; holding shift cuts the player's speed in half,  pressing 'z' allows 
the player to rapid fire; the player and the enemy both have collision and health,
and you can actually play the game!! 
*/


///////////////////////////////////////////////////
 
//               C O L L I S I O N              //

//////////////////////////////////////////////////

//this boolean facilitates collision; it uses rectangles
//to check for intersections between two objects
//PosX, PosY, Pwidth, Pheight refer to the player
//BoxX, BoxY, BoxWidth, BoxHeight refer to the enemy 

boolean rectangle_collision(float PosX, float PosY, float Pwidth, float Pheight, float BoxX, float BoxY, float BoxWidth, float BoxHeight){
  return !(PosX > BoxX+BoxWidth || PosX+Pwidth < BoxX || PosY > BoxY+BoxHeight || PosY+Pheight < BoxY);
}


///////////////////////////////////////////////////
 
//               V A R I A B L E S              //

//////////////////////////////////////////////////

// iterator to take care of the player's bullets 
import java.util.Iterator; 

// gif set up
import gifAnimation.*; 
Gif spinningEnemy;

// creating an array for the enemy's bullets
ArrayList particles;

// creating an array for the player's bullets 
ArrayList<Bullet> bullets; 

//tells the game whether the player has the ability to shoot or not
boolean canShoot; 

// rotater to rotate the bg snowflakes
Rotater [] rotaters; 

// music
import ddf.minim.*; 
Minim minim;
AudioPlayer bgMusic; 

//images
PImage youmu; 
PImage mountainBg; 
PImage ghostBullet; 
PImage snowflake; 

//declaring a player
Player girl; 

//variables
float speed; 
float x, y;

// boss health
int boxHealth;

//player's ammount of lives
int lives = 3;

//used to recieve the position of the player's bullet
float bulletX; 
float bulletY; 

//used to recieve the position of the enemy's bullet 
float enemybulletX;
float enemybulletY;

//used to run the game
boolean gamestate = false;

//used to create a title screen before gameplay 
boolean gamestarted = false; 

//used to facilitate the rate at which the player fires bullets 
int t_1;
int t_2; 


///////////////////////////////////////////////////

//                S E T  U P                    //

//////////////////////////////////////////////////

void setup(){
  size (490,570); 
  
  imageMode (CORNERS); 
  
//load images
  youmu = loadImage ("youmu_baby.png"); 
  mountainBg = loadImage ("baby_mountain.jpg"); 
  ghostBullet = loadImage ("bullet.png"); 
  snowflake = loadImage ("snowflake.png"); 
  
//set up and load the gif; loops the gif 
  spinningEnemy = new Gif (this, "spinning.gif");
  spinningEnemy.loop(); 
  
//rotaters for snowflake
  rotaters = new Rotater [50]; 
  
//enemy bullets; determines the width and height at which the snowflakes are drawn and how fast they spin  
   particles = new ArrayList();
  
   for (int i = 0; i < rotaters.length; i++ ) {
     rotaters[i] = new Rotater(random(width),random(height),random(-.1, .1),random(7));
   }
  
//load music 
  minim = new Minim(this);
  bgMusic = minim.loadFile ("Ancient_Temple.mp3"); 
  bgMusic.loop(); 
  
//setting up player bullets 
  bullets = new ArrayList<Bullet>();
  canShoot = false; 
  
//sets up the player and her default speed 
  girl = new Player (210, 400); 
  x = girl.x;
  y = girl.y;
  speed = 4; 
  
//enemy health   
  boxHealth = 1000; 
  
}

///////////////////////////////////////////////////

//        P L A Y E R  M O V E M E N T          //

//////////////////////////////////////////////////

void movePlayer(){
  if (keyRight) girl.x += speed; 
  if (keyLeft) girl.x -= speed; 
  if (keyDown) girl.y += speed; 
  if (keyUp) girl.y -= speed; 
  
// the speed at which the player moves when and only if 'SHIFT' is pressed 
  if (slowMo) {
    speed = 2; 
  }
    else if (slowMo == false){
      speed = 4;
    }
           

// the player is "constrained" to the window; if the player goes
// too far up, down, left, or right, they appear at the other
// side of the screen as if they've wraped around the play space 
 if (girl.x > width) {
   girl.x = 0; 
 }
 
 else if (girl.x < 0) {
   girl.x = width; 
 }

 if (girl.y > height) {
   girl.y = 0;
 }
 
 else if (girl.y < 0) {
   girl. y = height; 
 }

}


///////////////////////////////////////////////////

//                   D R A W                    //

//////////////////////////////////////////////////

void draw(){

/**********************************

           Title Screen   

**********************************/
  
//this chunk of code allows for a title screen   
  if (gamestarted == false) { 
    background (mountainBg);
    
    fill(255);
    text("Nobombs Alpha 3", 330, 450); 
    text("Press Enter to Play", 330, 470);
    text("Press 'Z' to shoot", 10, 500);
    text("Press 'SHIFT' to slow down", 10, 515);
    text("Directional arrows to move", 10, 530); 
    
    //snowflakes on the title screen
      for (int i = 0; i < rotaters.length; i++ ){
    rotaters[i].spin();
    rotaters[i].display();
    rotaters[i].move(); 
  }
    
    if (keyCode == ENTER) {
      gamestate = true;
      gamestarted = true;
    }
    
  }
  
  
/**********************************

            Main Game  

**********************************/

//this chunk of code initiates the game when the player hits 'ENTER'
//from here, the game loops 
  else if (gamestate == true && gamestarted == true) {

   
/////////////////// B A C K G R O U N D  S E T U P 

//draws the background    
  background (mountainBg);
  
//drawing the snowflakes (this is kept inside of the main game just in case 
//something besides snowflakes are going to be used!! 
  for (int i = 0; i < rotaters.length; i++ ){
    rotaters[i].spin();
    rotaters[i].display();
    rotaters[i].move(); 
  }
 
 
///////////////////  E N E M Y  B U L L E T S

//display enemy bullets
  particles.add(new Particle()); 
  
    for (int i = 0; i < particles.size(); i++ ){ 
      Particle p = (Particle) particles.get(i);
      p.run();
      p.gravity();
      p.display();
    }

//Enemy bullets; if there are more than 1000 enemy bullets, they begin to be removed.
  if (particles.size() > 1000){
    particles.remove(0); 
  }  

/////////////////// P L A Y E R  D I S P L A Y  

//displaying and allowing the player to move 
 girl.display(); 
 movePlayer(); 
 

////////////////// P L A Y E R  B U L L E T S 

//this allows the player's bullets to be spaced
//out and look more natural when 'Z' is held down
  if (canShoot == true) {
      t_1 = millis();            
      if (t_1 - t_2 > 100) {
        for (int i = 0; i < 1; i++) {
          bullets.add (new Bullet (x = girl.x, y = girl.y - 30) );
        }
        
        t_2 = t_1;
      }
    }
 
//displays the bullets for the player; when the bullets are not on the screen, they are removed  
 for (Iterator iterator = bullets.iterator(); iterator.hasNext();){
   Bullet s = (Bullet) iterator.next();
   s.show();
   if (s.y < 0)
   iterator.remove(); 
 }


///////////////////  U I 

//The current UI; also works as a debug window (useful for tracking player
//movement, especially if she goes off the screen for some reason)  
 
    //fill (255);
    //text ("Pos: " + girl.x + "   Posy: " + girl.y, 5, height - 10); 
    fill(255);
    text("Health: " + girl.health, 5, height-20);
    fill (255);
    text("Lives: " + lives, 5, height- 35);
    fill (255);
    text("Boss: " + boxHealth, 5, 15);
    
///////////////////  E N E M Y  D I S P L A Y   

    fill(255);
    rect(width/2 - 25, 60, 50, 50);      //This is the BOSS Box
    
//display the enemy gif
//the enemy is displayed here so that the collision box is hidden; it still needs some fixing!!
    image (spinningEnemy, width/2 + 15, 75); 
    
////////////////// C O L L I S I O N   

//if the player touches the hitbox of the enemy, they lose health
    if (rectangle_collision(girl.x, girl.y, 20, 50, width/2, 5, 50, 50) == true)
    {
      girl.health --;
    }
    
//enemy bullet damage to player; detects the player's hitbox and also removes bullets
//when it is hit 
    for (Iterator iterator = particles.iterator(); iterator.hasNext();) {
      Particle s = (Particle) iterator.next();
      s.GetRectX(x);
      s.GetRectY(y);
      enemybulletX = s.GetRectX(x);
      enemybulletY = s.GetRectY(y);
      if (rectangle_collision(enemybulletX, enemybulletY, 10, 10, girl.x, girl.y, 20, 50) == true)
      {
        girl.health = girl.health - 5;
        if (rectangle_collision(enemybulletX, enemybulletY, 10, 10, girl.x, girl.y, 20, 50) == true)   iterator.remove();
      }
    }  

//player bullet damage to enemy; detects enemey's hitbox and also removes bullets
//when it is hit 
    for (Iterator iterator = bullets.iterator(); iterator.hasNext();) {
      Bullet s = (Bullet) iterator.next();
      s.GetRectX(x);
      s.GetRectY(y);
      bulletX = s.GetRectX(x);
      bulletY = s.GetRectY(y);
      if (rectangle_collision(bulletX, bulletY, 3, 10, width/2 - 25, 60, 50, 50) == true)
      {
        boxHealth = boxHealth - 5;
        if (rectangle_collision(bulletX, bulletY, 3, 10, width/2 - 25, 60, 50, 50) == true)   iterator.remove();
      }
    }

/////////////////// P L A Y E R  L I V E S 

    //when the player loses all of their health, they lose a life; this resets
    //lives (and the player's position) so that the player can have multiple lives
    if (girl.health == 0 || girl.health < 0)
    {
      lives = lives - 1;
      girl.x = 210;
      girl.y = 400;
      girl.health = 100;
    }
    
/**********************************

           End of Main Game  

**********************************/  


/**********************************

          Game Over Screen  

**********************************/
    
    //if the player has 0 lives left, the player is greeted with the game over screen 
    if (lives == 0)
    {
      particles.clear();
      background(mountainBg);
      fill(255);
      text("Game Over. Press Enter to Play Again", width/2-100, height/2);
      if (keyCode == ENTER) {
        lives = 3;
        boxHealth = 1000;
      }
    }
    
//////////////////////////////

// this chunk of code checks to see if the enemy was beaten
// it changes the gamestate to false and ends the game loop 

    if (boxHealth == 0)
    {
      gamestate = false;
      particles.clear();
      bullets.clear();
    }
  }
  
/////////////////////////////


/**********************************

            Win Screen   

**********************************/
  
  
  if (boxHealth == 0)   // If the win condition is met and the game loop was completed, it shows this win screen
    {
      background(mountainBg);
      fill(255);
      text("You Win! Press SpaceBar to Continue", width/2-100, height/2);
      
      if (keyCode == ' ') {
        lives = 3;
        boxHealth = 1000;
        girl.health = 100;
        girl.x = 210;
        girl.y = 400;
        gamestarted = false;
      }
    }


// the actual end of void draw  
}


///////////////////////////////////////////////////

//           S T O P  T H E  M U S I C          //

//////////////////////////////////////////////////

void stop () {
  bgMusic.close(); 
  minim.stop(); 
  
  super.stop();
}



