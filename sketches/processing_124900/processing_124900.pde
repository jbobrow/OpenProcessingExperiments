
import ddf.minim.*;
import java.util.Random;

class Timer {
  int savedTime; // When Timer started
  int totalTime; // How long Timer should last
  
  Timer(int tempTotalTime) {
    totalTime = tempTotalTime;
  }
  
  // Starting the timer
  void start() {
    // When the timer starts it stores the current time in milliseconds.
    savedTime = millis(); 
  }
  
  // The function isFinished() returns true if "totalTime" has passed. 
  // The work of the timer is farmed out to this method.
  boolean isFinished() { 
    // Check how much time has passed
    int passedTime = millis()- savedTime;
    if (passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
}

//-----------------------------------------//

class GameCursor {
  PImage cursor;
  float x, y;           // Location.
  
  GameCursor() {
    cursor = loadImage( "pic_mouse_cursor.png");
  }
  
  void setLocation( float aX, float aY ) {
    x = aX;
    y = aY;
  }
  
  void drawCursor() {
    image( cursor, x, y );
  }
}

//-----------------------------------------//

class Space {
  PImage backgroundSpace;
  float y;
  
  Space( PImage pic) {
    backgroundSpace = pic;
    y = 0;
  }
  
  void chageBackground() {
      backgroundSpace = loadImage( "pic_background_space.jpg" );
  }
  
  void showSpace() {
    image( backgroundSpace, 0, y );
    image( backgroundSpace, 0, y - 800 );
    y += 1;   
    if ( y > 800 ) {
      y = 0;
    }
  }
}

//-----------------------------------------//
//  Class for SpaceShip that defends Earth.
class SpaceShip {
  
  PImage type;          // Type of SpaceShip.
  float diagSpaceShip;  // Diagonal of SpaceShip.
  float x, y;           // Location of SpaceShip.
  
  // Constructor for SpaceShip.
  SpaceShip( PImage aType ) {
    type = aType;
    x = 0;
    y = 0;
    diagSpaceShip = sqrt( pow( type.width, 2 ) + pow( type.height, 2 ) );
  }
  
  // Set location of SpaceShip on the screen.
  void setLocation( float aX, float aY ) {
    x = aX;
    y = aY;
  }
  
  // Draw SpaceShip.
  void drawSpaceShip() {
    image( type, x, y );
  }
  
  // Retutn true if SpaceShip intersected with enemy.
  boolean intersect( Enemy d ) {
    
    // Calculate current distance.
    float distance = dist( x, y, d.x, d.y );
    
    // Compare distance to sum of radii and k.
    if ( distance < (diagSpaceShip + d.diagEnemy) / 3 ) {
      return true;
    } else {
      return false;
    }
  }
}
//-----------------------------------------//
class Enemy {
  float x,y;        // Variables for location of raindrop
  float speed;      // Speed of raindrop
  PImage type;      // Type of Enemy.
  PImage boom;
  float diagEnemy;  // Diagonal of Enemy.

  Enemy( ) {
    Random rand = new Random();
    int typeTemp = rand.nextInt( 9 ) + 1;
    switch ( typeTemp ) {
      case 1: 
        type = loadImage( "pic_enemy_type_one.png" );
        break;
      case 2:
        type = loadImage( "pic_enemy_type_two.png" );
        break;
      case 3: 
        type = loadImage( "pic_enemy_type_three.png" );
        break;
      case 4:
        type = loadImage( "pic_enemy_type_four.png" );
        break;
      case 5: 
        type = loadImage( "pic_enemy_type_five.png" );
        break;
      case 6:
        type = loadImage( "pic_enemy_type_six.png" );
        break;
      case 7: 
        type = loadImage( "pic_enemy_type_seven.png" );
        break;
      case 8:
        type = loadImage( "pic_enemy_type_two.png" );
        break;
      case 9:
        type = loadImage( "pic_enemy_type_two.png" );
        break;
    }
    
    boom = loadImage( "pic_boom.png" );
    diagEnemy = sqrt( pow( type.width, 2 ) + pow( type.height, 2 ) );
    x = random( width - diagEnemy);     // Start with a random x location.
    y = -diagEnemy * 4;                 // Start above the window.
    speed = random(1,5);   // Pick a random speed
  }

  // Move the raindrop down
  void move() {
    // Increment by speed
    y += speed; 
  }

  // Check if it hits the bottom
  boolean reachedBottom() {
    // If we go a little beyond the bottom
    if ( y > height ) { 
      return true;
    } else {
      return false;
    }
  }

  // Display the raindrop
  void display() {
    image( type, x, y );  
  }

  // If the drop is caught
  void caught() {
    // Stop it from moving by setting speed equal to zero
    speed = 0; 
    // Set the location to somewhere way off-screen
    float tY = y;
    y = -1000;
    image( boom, x, tY );
  }
}

SpaceShip ship;     
Timer timer;        
Space spaceGame;
Space spaceMenu;
Enemy[] enemies; 

boolean menu;
GameCursor cursor;

int totalDrops = 0; 

Minim minim;
AudioPlayer hit;
AudioPlayer gameOver;
AudioPlayer menuMusic;
AudioPlayer spaceMusic;

int passed = 0;

void setup() {
  
  // Game starting with menu.
  menu = true;
  
  minim = new Minim( this );
  hit = minim.loadFile( "sound_hit.wav" );
  menuMusic = minim.loadFile( "sound_menu.wav" );
  spaceMusic = minim.loadFile( "sound_space.wav" );
  
  size( 800, 800 );
  smooth();
  
  noCursor();
  cursor = new GameCursor();
  
  PImage  type = loadImage( "pic_ship_type_one.png" );  
  ship = new SpaceShip( type ); 
  
  
  PImage sMenu = loadImage( "pic_background_menu_space.jpg" );
  PImage sGame = loadImage( "pic_background_space.jpg" );
  spaceGame = new Space( sGame ); 
  spaceMenu = new Space( sMenu );
  
  enemies = new Enemy[1000];   
  timer = new Timer(300);   
  timer.start();     
  
}

void draw() {
    
  if ( menu ) {
    
    spaceMusic.pause();
    spaceMusic.rewind();
    menuMusic.play();
    
    
    spaceMenu.showSpace();
    
    stroke( #585738 );
    
    noFill();
    strokeWeight( 20 );
    
    if ( mouseX > 200 && mouseX < 200+400 && 
         mouseY > 200 && mouseY < 200+150 ) { 
            stroke( #C43131 );
         }
    rect( 200, 200, 400, 150, 10 );
    stroke( #585738 );
    
    if ( mouseX > 200 && mouseX < 200+400 && 
         mouseY > 400 && mouseY < 400+150 ) { 
            stroke( #C43131 );
         }
          
    rect( 200, 400, 400, 150, 10 );  
    
    textSize( 82 );
    fill( 0, 102, 153 );
    text( "PLAY", 300, 300 );
    text( "EXIT", 320, 500 );
    
    fill( 255, 255, 255 );
    textSize( 50 );
    text( "Space Collector Game", 130, 80 );
    
    textSize( 20 );
    text( "Press S for screenshot.", 70, 700 );
    text( "Press Esc for exit.", 70, 750 );
  
    cursor.setLocation( mouseX, mouseY ); 
    cursor.drawCursor();  
      
  } else {
    
    passed = 0;
    
    menuMusic.pause(); 
    menuMusic.rewind();
    spaceMusic.play();
    
    spaceGame.showSpace();
    
     // Set SpaceShip location and dispaly it.
    ship.setLocation( mouseX, mouseY ); 
    ship.drawSpaceShip(); 
    
    // Check the timer
    if ( timer.isFinished() ) {
      // Deal with raindrops
      // Initialize one drop
      enemies[totalDrops] = new Enemy();
      // Increment totalDrops
      totalDrops ++ ;
      // If we hit the end of the array
      if (totalDrops >= enemies.length) {
        totalDrops = 0; // Start over
      }
      timer.start();
    }  
    // Move and display all Enemies.
    for ( int i = 0; i < totalDrops; i++ ) {
      enemies[i].move();
      enemies[i].display();
      if ( ship.intersect( enemies[i] ) ) {
        hit.play();
        hit.rewind();
        enemies[i].caught();
      }
      if ( enemies[i].reachedBottom() ) {
        passed++;
      }
    }
    noFill();
    strokeWeight( 5 );
    stroke(#C43131);
    line( 10, 10, 10, 30 );
    line( 20, 10, 20, 30 );
    
    textSize( 20 );
    fill( 255, 255, 255 );
    text( "Passed: " + passed, 500, 30 );
  }
}

void keyPressed() {
    if( key == 's' || key == 'S') {
      saveFrame("screenshot.png");
    }
 } 
 
 void mousePressed() {
  if( menu ) {
    if ( mouseX > 200 && mouseX < 200+400 && 
         mouseY > 200 && mouseY < 200+150 ) { 
      menu = false;       
    }
    if ( mouseX > 200 && mouseX < 200+400 && 
         mouseY > 400 && mouseY < 400+150 ) { 
      exit();       
    }
  } else {
    if ( mouseX > 5 && mouseX < 25 && 
         mouseY > 5 && mouseY < 35 ) { 
      menu = true;      
    }    
  }
}

