
/*
Background image credit to sur-mata on deviantart.com 
<http://sur-mata.deviantart.com/art/Mountain-Stairs-212222566>

Character image credit to Tasogare Frontier & Team Shanghai Alice
Sprite from Scarlet Weather Rhapsody 

Music credit to Team Shanghai Alice
"Mysic Oriental Dream ~ Ancient Temple" - Perfect Cherry Blossom

In this prototype, the player successfully moves around the game
space through the arrow keys on the keyboard; if you hold down shift, 
her speed is cut in half.  By pressing 'z' the character can fire
bullets.  
*/

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


///////////////////////////////////////////////////

//                S E T  U P                    //

//////////////////////////////////////////////////

void setup(){
  size (490,570); 
  
//load images
  youmu = loadImage ("youmu_baby.png"); 
  mountainBg = loadImage ("baby_mountain.jpg"); 
  ghostBullet = loadImage ("bullet.png"); 
  snowflake = loadImage ("snowflake.png"); 
  
//set up and load the gif; loops the gif 
  spinningEnemy = new Gif (this, "spinning.gif");
  spinningEnemy.loop(); 
  imageMode (CENTER); 
  
//rotaters for snowflake
  rotaters = new Rotater [30]; 
  
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
  
}


///////////////////////////////////////////////////

//                   D R A W                    //

//////////////////////////////////////////////////

void draw(){
  
  background (mountainBg);
  
//drawing the snowflakes  
  for (int i = 0; i < rotaters.length; i++ ){
    rotaters[i].spin();
    rotaters[i].display();
    rotaters[i].move(); 
  }
  

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
  
//display the enemy gif
  image (spinningEnemy, width/2, 100); 
 
//displaying and allowing the player to move 
 girl.display(); 
 movePlayer(); 
 
//displays the bullets for the player; when the bullets are not on the screen, they are removed  
 for (Iterator iterator = bullets.iterator(); iterator.hasNext();){
   Bullet s = (Bullet) iterator.next();
   s.show();
   if (s.y < 0)
   iterator.remove(); 
 }
 
}

///////////////////////////////////////////////////

//           S T O P  T H E  M U S I C          //

//////////////////////////////////////////////////

void stop () {
  bgMusic.close(); 
  minim.stop(); 
  
  super.stop();
}



