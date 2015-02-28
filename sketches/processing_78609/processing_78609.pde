
/*
Background image credit to sur-mata on deviantart.com 
< http://sur-mata.deviantart.com/art/Mountain-Stairs-212222566 >

Character sprite image credit to Tasogare Frontier & Team Shanghai Alice
Sprite from Scarlet Weather Rhapsody 

Music credit to Team Shanghai Alice
"Mysic Oriental Dream ~ Ancient Temple" - Perfect Cherry Blossom

Snowflake image credit to GaiaOnline.com 

All other art assets by me.  

And if you're interested, here's a helpful start to rectangular collision!
< http://wiki.processing.org/w/Rect-Rect_intersection >

Special thanks to Chris Lucero and Kyle Bolton for helping me with collision!! 

In this final build, the game is fully functional and playable!!   
*/


///////////////////////////////////////////////////
 
//               C O L L I S I O N              //

//////////////////////////////////////////////////

//  this boolean facilitates collision; it uses rectangles
//  to check for intersections between two objects
//  PosX, PosY, Pwidth, Pheight refer to the player
//  BoxX, BoxY, BoxWidth, BoxHeight refer to the enemy 

boolean rectangle_collision(float PosX, float PosY, float Pwidth, float Pheight, float BoxX, float BoxY, float BoxWidth, float BoxHeight){
  return !(PosX > BoxX+BoxWidth || PosX+Pwidth < BoxX || PosY > BoxY+BoxHeight || PosY+Pheight < BoxY);
}


///////////////////////////////////////////////////
 
//               V A R I A B L E S              //

//////////////////////////////////////////////////

// iterator to take care of the player's bullets 
import java.util.Iterator; 

// gif set up for the enemy 
import gifAnimation.*; 
Gif spinningEnemy;

// creating an array for the enemy's bullets
ArrayList particles;

// creating an array for the player's bullets 
ArrayList<Bullet> bullets; 

// tells the game whether the player has the ability to shoot or not
boolean canShoot; 

// rotater to rotate the bg snowflakes/objects 
Rotater [] rotaters; 

// music
import ddf.minim.*; 
Minim minim;
AudioPlayer bgMusic; 

// images
PImage youmuTitle;        // title screen, win screen, lose screen 
PImage youmuWin;
PImage youmuLose; 

PImage youmu;             // player related images 
PImage youmuLeft;
PImage youmuRight;

PImage damageDisplay;     // damage images; player's damage hit 
PImage enemyTakeDamage;   // enemy's damage hit 

PImage redEnemyBullet;    // enemy bullet
PImage ghostBullet;       // player bullet

PImage mountainBg;        // background 

PImage snowflake;         // snowflake for the rotater_for_bg_objects
PImage flowerPetal;       // flower petal for the win screen 

// declaring a player
Player girl; 

// player variables
float speed; 
float x, y;

// boss health
int boxHealth;

// player's amount of lives
int lives = 3;

// used to receive the position of the player's bullet
float bulletX; 
float bulletY; 

// used to receive the position of the enemy's bullet 
float enemybulletX;
float enemybulletY;

// used to run the game
boolean gamestate = false;

// used to create a title screen before gameplay 
boolean gamestarted = false; 

// used to facilitate the rate at which the player fires bullets 
int t_1;
int t_2; 


///////////////////////////////////////////////////

//                S E T  U P                    //

//////////////////////////////////////////////////

void setup(){
  size (490,570); 

// this is put in here just to make sure that images are placed using corners; 
// because collision is dependent on rectangles, this is a just in case piece of code 
  imageMode (CORNERS); 
  
// load images

  youmuTitle = loadImage ("youmu_title.png"); 
  youmuWin = loadImage ("youmu_win.png"); 
  youmuLose = loadImage ("youmu_lose.png"); 

  youmu = loadImage ("youmu_baby.png"); 
  youmuLeft = loadImage ("youmu_baby_left.png");
  youmuRight = loadImage ("youmu_baby_right.png"); 
  
  damageDisplay = loadImage ("damage.png"); 
  enemyTakeDamage = loadImage ("enemyTakeDamage.png"); 
  
  redEnemyBullet = loadImage ("redEnemyBullet.png"); 
  ghostBullet = loadImage ("bullet.png"); 
  
  mountainBg = loadImage ("baby_mountain.jpg"); 

  snowflake = loadImage ("snowflake.png"); 
  flowerPetal = loadImage ("flower_petal.png"); 
  
// set up and load the gif; loops the gif 
  spinningEnemy = new Gif (this, "spinning.gif");
  spinningEnemy.loop(); 
  
// rotaters for snowflake and amount of snowflakes on screen 
  rotaters = new Rotater [75]; 
  
// enemy bullets; determines the width and height at which the snowflakes are drawn and how fast they spin  
  particles = new ArrayList();
  
   for (int i = 0; i < rotaters.length; i++ ) {
     rotaters[i] = new Rotater(random(width),random(height),random(-.1, .1),random(7));
   }
  
// load music 
  minim = new Minim(this);
  bgMusic = minim.loadFile ("Ancient_Temple.mp3"); 
  bgMusic.loop(); 
  
// setting up player bullets 
  bullets = new ArrayList<Bullet>();
  canShoot = false; 
  
// sets up the player and her default speed 
  girl = new Player (width/2, 500); 
  x = girl.x;
  y = girl.y;
  speed = 4; 
  
// enemy health   
  boxHealth = 5000; 
  
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
  
// this chunk of code allows for a title screen   
  if (gamestarted == false) { 
    
    background (mountainBg);
    
// snowflakes on the title screen
      for (int i = 0; i < rotaters.length; i++ ){
    rotaters[i].spin();
    rotaters[i].display();
    rotaters[i].move(); 
  }
    
// this allows the player to begin playing the game     
    if (keyCode == ENTER) {
      gamestate = true;
      gamestarted = true;
    }
    
    image (youmuTitle, width/2, height/2); 
    
}
  
  
/**********************************

            Main Game  

**********************************/

// this chunk of code initiates the game when the player hits 'ENTER' up on the title screen 
// from here, the game loops 

  else if (gamestate == true && gamestarted == true) {

   
/////////////////// B A C K G R O U N D  S E T U P 

//  draws the background    
  background (mountainBg);
  
//  drawing the snowflakes (this is kept inside of the main game just in case 
//  something besides snowflakes are going to be used!!)  

  for (int i = 0; i < rotaters.length; i++ ){
    rotaters[i].spin();
    rotaters[i].display();
    rotaters[i].move(); 
  }
 
 
/////////////////// P L A Y E R  D I S P L A Y  

//displaying and allowing the player to move 
 girl.display(); 
 movePlayer(); 
 
 
/////////////////// E N E M Y  B U L L E T S

// display enemy bullets; refer to the enemy_bullet class for more info
  particles.add(new Particle()); 
  
    for (int i = 0; i < particles.size(); i++ ){ 
      Particle p = (Particle) particles.get(i);
      p.run();
      p.gravity();
      p.display();
    }

// enemy bullets; if there are more than 1000 enemy bullets, they begin to be removed.
  if (particles.size() > 1000){
    particles.remove(0); 
  }  
 

////////////////// P L A Y E R  B U L L E T S 

// this allows the player's bullets to be spaced
// out and look more natural when 'Z' is held down

  if (canShoot == true) {
      t_1 = millis();            
      if (t_1 - t_2 > 100) {
        for (int i = 0; i < 1; i++) {
          bullets.add (new Bullet (x = girl.x, y = girl.y - 30) );
        }
        
        t_2 = t_1;
      }
    }
 
// displays the bullets for the player; when the bullets are not on the screen, they are removed  
 for (Iterator iterator = bullets.iterator(); iterator.hasNext();){
   Bullet s = (Bullet) iterator.next();
   s.show();
   if (s.y < 0)
   iterator.remove(); 
 }


///////////////////  U I 

// The current UI; denotes the enemy health, the player's health
// and the amount of lives the player has.  
    
// enemy health bar   
    noStroke();
    fill (142, 20, 20);
    rect (8, 5, 475, 15); 
    fill (240, 36, 74); 
    rect (8, 5, .095 * boxHealth, 15); 
   
    fill (255);
    text("Boss ", 8, 18);
    
// player health bar  
    noStroke(); 
    fill (34, 127, 175); 
    rect (5, 535, 100, 15); 
    fill(27, 170, 245); 
    rect (5, 535, girl.health, 15); 
    
    fill(255);
    text ("Youmu" , 8, 547); 

// number of lives
    fill (255);
    text("Lives: " + lives, 5, height- 5);
    
///////////////////  E N E M Y  D I S P L A Y   
    
//  display the enemy gif
    image (spinningEnemy, width/2 + 15, 75); 
    
////////////////// C O L L I S I O N   

//  if the player touches the hitbox of the enemy, they lose health
    if (rectangle_collision(girl.x+2, girl.y+12, 3, 3, width/2, 5, 50, 50) == true)
    {
      girl.health --;
    }
    
//  enemy bullet damage to player; detects the player's hitbox and also removes bullets
//  when it is hit 

    for (Iterator iterator = particles.iterator(); iterator.hasNext();) {
      Particle s = (Particle) iterator.next();
      s.GetRectX(x);
      s.GetRectY(y);
      enemybulletX = s.GetRectX(x) - 5;
      enemybulletY = s.GetRectY(y) - 5;
      if (rectangle_collision(enemybulletX, enemybulletY, 10, 10, girl.x, girl.y+8, 3, 3) == true)
      {
        image (damageDisplay, girl.x, girl.y); //  when the player is hit, a flash of red affords to a hit 
        girl.health = girl.health - 5;
        if (rectangle_collision(enemybulletX, enemybulletY, 10, 10, girl.x, girl.y+8, 3, 3) == true)   iterator.remove();
      }
    }  

//  player bullet damage to enemy; detects enemey's hitbox and also removes bullets
//  when it is hit 

    for (Iterator iterator = bullets.iterator(); iterator.hasNext();) {
      Bullet s = (Bullet) iterator.next();
      s.GetRectX(x);
      s.GetRectY(y);
      bulletX = s.GetRectX(x);
      bulletY = s.GetRectY(y);
      if (rectangle_collision(bulletX, bulletY, 3, 10, width/2 - 25, 60, 50, 50) == true)
      { image (enemyTakeDamage, width/2 + 15, 75); //  when the enemy is hit, a flash of blue affords to a hit
        boxHealth = boxHealth - 5;
        if (rectangle_collision(bulletX, bulletY, 3, 10, width/2 - 25, 60, 50, 50) == true)   iterator.remove();
      }
    }

/////////////////// P L A Y E R  L I V E S 

//  when the player loses all of their health, they lose a life; this resets
//  lives (and the player's position) so that the player can have multiple lives

    if (girl.health == 0 || girl.health < 0)
    {
      lives = lives - 1;
      girl.x = width/2;
      girl.y = 500;
      girl.health = 100;
    }
    
/**********************************

           End of Main Game  

**********************************/  


/**********************************

          Game Over Screen  

**********************************/
    
//  if the player has 0 lives left, the player is greeted with the game over screen 

    if (lives == 0)
    {
      particles.clear();
      background(mountainBg);
      
    for (int i = 0; i < rotaters.length; i++ ){
    rotaters[i].spin();
    rotaters[i].display();
    rotaters[i].move(); 
    }
    
      if (keyCode == ENTER) {
        lives = 3;
        boxHealth = 5000; //this is here just in case the enemy health changes 
      }
      
      image (youmuLose, width/2, height/2); 
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
  
// If the win condition is met and the game loop was completed, it shows this win screen  

  if (boxHealth == 0)  
    {
      background(mountainBg);
      
    for (int i = 0; i < rotaters.length; i++ ){
    rotaters[i].spin();
    rotaters[i].display();
    rotaters[i].move(); 
    }
      
      if (keyCode == ' ') {
        lives = 3;
        boxHealth = 5000;
        girl.health = 100;
        girl.x = width/2;
        girl.y = 500;
        gamestarted = false;
// right now ^ game started goes to false
// because there are no more levels; if there were
// then it would go to true, and the info
// above it regarding the player
// would be more relevant

// resetting the boxHealth here also ensures that when
// the player is taken back to the main screen, the 
// flower petals from the win screen are reset to 
// snowflakes 

      }
      
      image (youmuWin, width/2 , height/2); 
      
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



