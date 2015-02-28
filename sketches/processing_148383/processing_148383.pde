
boolean rectangle_collision(float PosX, float PosY, float Pwidth, float Pheight, float BoxX, float BoxY, float BoxWidth, float BoxHeight){
  return !(PosX > BoxX+BoxWidth || PosX+Pwidth < BoxX || PosY > BoxY+BoxHeight || PosY+Pheight < BoxY);
} //collision

// iterator to take care of the player's bullets 
import java.util.Iterator; 
import ddf.minim.*;

//music
Minim minim;
AudioPlayer menu;
AudioPlayer menu2;
AudioPlayer menu3;

// creating an array for the enemy's bullets
ArrayList particles;
ArrayList particles1;
ArrayList particles2;

// creating an array for the player's bullets 
ArrayList<Bullet> bullets; 

// images
PImage fondostart;        // title screen
PImage perdiste;
PImage ganaste;
PImage ganatodo;

PImage arriba;             // player related images 

PImage heart1;     // damage damage hit 

PImage espada;    // enemy bullet
PImage fuego;       // player bullet

PImage FONDO_1;        // background 

PImage rey; //enemy

// declaring a player
Player dragon; 

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


// tells the game whether the player has the ability to shoot or not
boolean canShoot; 

// used to facilitate the rate at which the player fires bullets 
int t_1;
int t_2; 

//level
int lvl = 0;

int bossX = 10;


int dir;
int num; //pantalla

//                S E T  U P                  
void setup(){
  size (600,1000); 
  dir = 0; 
  num = 1;
// this is put in here just to make sure that images are placed using corners; 
// because collision is dependent on rectangles, this is a just in case piece of code 
  imageMode (CORNERS); 
  
// load images

  fondostart = loadImage ("MENU-P.png"); 
  perdiste = loadImage ("Perdiste.png");
  ganaste = loadImage ("Ganaste.png");
  ganatodo = loadImage ("ganaotodo.png");
 
  arriba = loadImage ("Dragon.png"); 
  
  heart1 = loadImage ("heart1.png"); 
  
  espada = loadImage ("Espada.png"); 
  fuego = loadImage ("Fuego.png"); 
  
  FONDO_1 = loadImage ("FONDO_1.png"); 
  

   rey = loadImage ("Rey.png");
   
   minim = new Minim(this);
   menu = minim.loadFile("intro_menu_juego.mp3");
   menu2 = minim.loadFile("juego.mp3");
   menu3 = minim.loadFile("perder_juego.mp3");

   
// enemy bullets;
  particles = new ArrayList();
  particles1 = new ArrayList();
  particles2 = new ArrayList();

// setting up player bullets 
  bullets = new ArrayList<Bullet>();
  canShoot = false; 
  
// sets up the player and her default speed 
  dragon = new Player (width/2, 500); 
  x = dragon.x;
  y = dragon.y;
  speed = 4; 
  
// enemy health   
  boxHealth = 1000; 
  
 
}


//        P L A Y E R  M O V E M E N T   

void movePlayer(){
  if (keyRight) dragon.x += speed; 
  if (keyLeft) dragon.x -= speed; 
  if (keyDown) dragon.y += speed; 
  if (keyUp) dragon.y -= speed; 
  
  if (slowMo) {
    speed = 2; 
  }
    else if (slowMo == false){
      speed = 4;
    }
           

 if (dragon.x > width) {
   dragon.x = 0; 
 }
 
 else if (dragon.x < 0) {
   dragon.x = width; 
 }

 if (dragon.y > height) {
   dragon.y = 0;
 }
 
 else if (dragon.y < 0) {
   dragon. y = height; 
 }

}

//                   D R A W                   

void draw(){
switch(num)
    {
      case 1:
              pantalla_uno();
              break;
      case 2:
              pantalla_dos();
              break;
      case 3:
              pantalla_tres();
              break;     
      case 4: 
              pantalla_cuatro();
              break;   
      case 5: 
              pantalla_cinco();
              break;   
    }
   if( bossX >= 10 && bossX <= 500 && dir == 0)
     bossX++;
   if( bossX >= 10 && bossX <= 500 && dir == 1)
     bossX--;  
   if( bossX > 500)
   {
     dir = 1;
     bossX--;
   }  
   if( bossX < 10)
   {
     dir = 0;
     bossX++;
   }
   

}
void pantalla_uno()
{
  menu.play();
  background (fondostart);
  if (mousePressed && (mouseButton == LEFT))
  {
    if(mouseX<400 && mouseX>200 && mouseY<651 && mouseY>546){
    num = 2;
    menu.close();
    }
  }
  
}

void pantalla_dos()
{
 menu2.play();
 background (FONDO_1);
 dragon.display(); 
 movePlayer(); 
 
 
/////////////////// E N E M Y  B U L L E T S
 if (lvl == 0)
 {
  //  display the enemy gif
    image (rey, bossX + 15, 75); 
   
  particles.add(new Particle()); 
  
    for (int i = 0; i < particles.size(); i++ ){ 
      Particle p = (Particle) particles.get(i);
      p.run();
      p.gravity();
      p.display();
    }


  if (particles.size() > 500){
    for(int i=0; i < 200; i++)
    particles.remove(i);
     
  }  
 }
 
 else if (lvl == 1)
  {
     image (rey, bossX, 75);
  particles1.add(new Particle()); 
  
    for (int i = 0; i < particles1.size(); i++ ){ 
      Particle p = (Particle) particles1.get(i);
      p.run();
      p.gravity();
      p.display();
    }

// enemy bullets; if there are more than 1000 enemy bullets, they begin to be removed.
  if (particles1.size() > 500){
    for(int i=0; i < 100; i++)
    particles1.remove(i); 
  }  
 }
 else if (lvl == 2)
  {
     image (rey, bossX, 75);
  particles2.add(new Particle()); 
  
    for (int i = 0; i < particles2.size(); i++ ){ 
      Particle p = (Particle) particles2.get(i);
      p.run();
      p.gravity();
      p.display();
    }
 }

////////////////// P L A Y E R  B U L L E T S 

  if (canShoot == true) {
      t_1 = millis();            
      if (t_1 - t_2 > 100) {
        for (int i = 0; i < 1; i++) {
          bullets.add (new Bullet (x = dragon.x, y = dragon.y - 30) );
        }
        
        t_2 = t_1;
      }
    }
 
 for (Iterator iterator = bullets.iterator(); iterator.hasNext();){
   Bullet s = (Bullet) iterator.next();
   s.show();
   if (s.y < 0)
   iterator.remove(); 
 }


///////////////////  U I 

// enemy health bar   
    noStroke();
    fill (142, 20, 20);
    rect (8, 5, 95, 15); 
    fill (240, 36, 74); 
    rect (8, 5, .095 * boxHealth, 15); 
   
    fill (255);
    text("rey ", 8, 18);
    
// player health bar  
    noStroke(); 
    fill (34, 127, 175); 
    rect (5, 535, 50, 15); 
    fill(27, 170, 245); 
    rect (5, 535, dragon.health, 15); 
    
    fill(255);
    text ("dragon" , 8, 547); 

// number of lives
    fill (255);
    text("Lives: " + lives, 5, height- 5);
    
///////////////////  E N E M Y  D I S P L A Y   
    
    
////////////////// C O L L I S I O N   

//  if the player touches the hitbox of the enemy, they lose health
    if (rectangle_collision(dragon.x+2, dragon.y+12, 3, 3, width/2, 5, 50, 50) == true)
    {
      dragon.health --;
    }

//  enemy bullet damage to player; detects the player's hitbox and also removes bullets
//  when it is hit 

    for (Iterator iterator = particles.iterator(); iterator.hasNext();) {
      Particle s = (Particle) iterator.next();
      s.GetRectX(x);
      s.GetRectY(y);
      enemybulletX = s.GetRectX(x) - 5;
      enemybulletY = s.GetRectY(y) - 5;
      if (rectangle_collision(enemybulletX, enemybulletY, 10, 10, dragon.x +25, dragon.y+8, 3, 3) == true)
      {
        image (heart1, dragon.x, dragon.y); //  when the player is hit, a flash of red affords to a hit 
        dragon.health = dragon.health - 5;
        if (rectangle_collision(enemybulletX, enemybulletY, 10, 10, dragon.x + 25, dragon.y+8, 3, 3) == true)   iterator.remove();
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
      if (rectangle_collision(bulletX, bulletY, 3, 10, bossX + 25, 60, 50, 50) == true)
      { image (heart1, bossX + 25, 75); //  when the enemy is hit, a flash of blue affords to a hit
        boxHealth = boxHealth - 5;
        if (rectangle_collision(bulletX, bulletY, 3, 10, bossX + 25, 60, 50, 50) == true)   iterator.remove();
      }
    }

/////////////////// P L A Y E R  L I V E S 

//  when the player loses all of their health, they lose a life; this resets
//  lives (and the player's position) so that the player can have multiple lives

    if (dragon.health == 0 || dragon.health < 0)
    {
      lives = lives - 1;
      dragon.x = width/2;
      dragon.y = 500;
      dragon.health = 50;
    }
    if (lives == 0)
    {
      menu2.close();
      particles.clear();
      num = 3;
    }
     if (boxHealth == 0)  
    {
      if (lvl == 2){
      menu2.close();
      particles.clear();
      num=5;
      }
      if (lvl < 2){
      menu2.close();
      particles.clear();
      num = 4;
      }
      
     }
 
}
void pantalla_tres()
{
  menu3.play();
  background(perdiste);
  if (mousePressed && (mouseButton == LEFT) )
  {
    if(mouseX>148 && mouseX<460 && mouseY>500 && mouseY<600){
       num = 2;
       menu3.close();
       lives = 3;
       boxHealth = 1000;
    }
    if(mouseX>39 && mouseX<562 && mouseY>710 && mouseY<798){
    num = 1;
    menu3.close();
    lvl = 0;
    }
  }
}
void pantalla_cuatro()
{
  menu.play();
  background(ganaste);
  if (mousePressed && (mouseButton == LEFT) )
  {
    if(mouseX>30 && mouseX<573 && mouseY>457 && mouseY<548){
      num = 2;
      menu.close();
      if (lvl  < 2)
      lvl = lvl +1;
    }
    if(mouseX>30 && mouseX<573 && mouseY>658 && mouseY<749){
      num = 1;
      menu.close();
      lvl = 0;
    }
    
}
}
void pantalla_cinco()
{
  menu.play();
  background(ganatodo);
  if(mouseX>150 && mouseX<438 && mouseY>553 && mouseY<656){
      num = 2;
      menu.close();
      lvl = 0;
    }
    if(mouseX>35 && mouseX<563 && mouseY>761 && mouseY<855){
      num = 1;
      menu.close();
      lvl = 0;
    }
}
//the player's bullet

class Bullet {
  float x, y;
 
  Bullet(float x,float y) {
    this.x = x;
    this.y = y;
  }
 
 
   void move() {
    y = y - 10; 
    }
    
    
  void show() {

     image (fuego, x, y);
     move();  

  }
   
//this code deals with collision and makes sure the player's
//bullets hit the enemy 
  float GetRectX(float bulletX) {
    bulletX = x;
    return bulletX;
  }
  
  float GetRectY(float bulletY) {
    bulletY = y;
    return bulletY;
  }   
    
}
// a particle class so that the enemy rains down bullets pretty randomly 
class Particle {
  
  float x;
  float y;
  float xspeed;
  float yspeed;
  
  Particle() {
    x = bossX + 25;
    y = 70;
    xspeed = random(-1,1);
    yspeed = random(-2,0);
  }
  
  void run() {
    x = x + xspeed;
    y = y + yspeed;
  }
  
  void gravity() {
    yspeed += .01;
  }
  
  void display() {
    
    image (espada, x, y); 
  }
  
  
  //the code below deals with collision and makes sure
  //the enemy bullets hit the player 
  float GetRectX(float bulletX) {
    bulletX = x;
    return bulletX;
  }
  
  float GetRectY(float bulletY) {
    bulletY = y;
    return bulletY;
  }  
  
}
//player movement 

boolean keyRight, keyLeft, keyDown, keyUp;
boolean slowMo; 

void keyPressed(){
  
  if (keyCode == 'Z') canShoot = true; 
  if (keyCode == LEFT)  keyLeft = true;
  if (keyCode == RIGHT) keyRight = true;
  if (keyCode == DOWN) keyDown = true;
  if (keyCode == UP) keyUp = true;
  
  if (keyCode == SHIFT) slowMo = true; 

}
  
void keyReleased(){
  
  if (keyCode == LEFT)  keyLeft = false;
  if (keyCode == RIGHT) keyRight = false;
  if (keyCode == DOWN) keyDown = false;
  if (keyCode == UP) keyUp = false;
  
  if (keyCode == SHIFT) slowMo = false; 
  
  if (keyCode == 'Z') canShoot = false;
  
}


class Player
{
  float x, y;
  int s;
  int health = 50; 
     
  Player(float x, float y)
  {
    this.x = x;
    this.y = y;
  }
 
  void display()
  {     
     if (keyLeft == true) {
       image (arriba, x, y); 
     }
     else if (keyRight == true) {
    image (arriba, x, y);
     }    
     else
     {
       image (arriba, x, y);
     }
}
  
  void health(){
  }
  
}


