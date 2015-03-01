
Player p1 = new Player( 100, 190 );
boolean[] keys = new boolean[7];
PImage[] sprites = new PImage[26];
String lastKey;
PImage bg;
void setup(){
  imageMode(CENTER);
  lastKey = "RIGHT";
  frameRate(30);
  size( 511, 231 );
  keys[0] = false;
  keys[1] = false;
  keys[2] = false;
  keys[3] = false;
  keys[4] = false;
  // BACKGROUND
  bg = loadImage( "bg.png" );
  
  // LEFT IDLE
  sprites[0] = loadImage( "0.png" );
  
  //LEFT WALKING
  sprites[1] = loadImage( "1.png" );
  sprites[2] = loadImage( "2.png" );
  sprites[3] = loadImage( "3.png" );
  sprites[4] = loadImage( "4.png" );
  sprites[5] = loadImage( "5.png" );
  sprites[6] = loadImage( "6.png" );
  sprites[7] = loadImage( "7.png" );
  sprites[8] = loadImage( "8.png" );
  sprites[9] = loadImage( "9.png" );
  sprites[10] = loadImage( "10.png" );  
  sprites[11] = loadImage( "11.png" );
  sprites[12] = loadImage( "12.png" );
  
  // RIGHT IDLE
  sprites[13] = loadImage( "0r.png" );
  
  //RIGHT WALKING
  sprites[14] = loadImage( "1r.png" );
  sprites[15] = loadImage( "2r.png" );
  sprites[16] = loadImage( "3r.png" );
  sprites[17] = loadImage( "4r.png" );
  sprites[18] = loadImage( "5r.png" );
  sprites[19] = loadImage( "6r.png" );
  sprites[20] = loadImage( "7r.png" );
  sprites[21] = loadImage( "8r.png" );
  sprites[22] = loadImage( "9r.png" );
  sprites[23] = loadImage( "10r.png" );  
  sprites[24] = loadImage( "11r.png" );
  sprites[25] = loadImage( "12r.png" );
}

void draw(){
  background(0);
  image( bg, width/2, height/2 );
  p1.drawPlayer();
  p1.loopFrame();
  p1.movePlayer();
  p1.constrainPlayer();
}

class Player{
  PVector location, velocity;
  String state;
  int frame = 1;
  Player( float x, float y ){
    location = new PVector( x, y );
    velocity = new PVector( 0, 0 );
  }
  void drawPlayer(){
    image( sprites[frame], location.x, location.y );
  }
  void movePlayer(){
    if( keys[2] == true ){
      velocity.x = -3;
    } else if( keys[3] == true ){
        velocity.x = 3;
      } else {
          velocity.x = 0;
        }    
    location.add(velocity);
  }
  void constrainPlayer(){
    location.x = constrain(location.x, 10, width - 10);
  }  
  String playerState(){
    /*
    IDLELEFT*
    IDLERIGHT*
    WALKINGLEFT*
    WALKINGRIGHT*
    ATTACKING
    BLOCKING
    JUMPING
    DEATH
    */
    if( keys[2] == false && keys[3] == false && lastKey == "LEFT" ){
      state = "IDLELEFT";
    } else if( keys[2] == false && keys[3] == false && lastKey == "RIGHT" ){
        state = "IDLERIGHT";
      }
    if( keys[2] == true ){
      state = "WALKINGLEFT";
    } else if( keys[3] == true ){
        state = "WALKINGRIGHT";
      }
    /*
    if( keys[4] == true ){
      // set the current state to ATTACKING but hold us here for however long it takes for the ATTACKING animation to finish.
    }
    */
    return state;
  }
  void loopFrame(){
    frame += 1;
    if( playerState() == "WALKINGLEFT" ){
      if( frame >= 12 ){
        frame = 1;
      }
    }
    if( playerState() == "WALKINGRIGHT" ){
      if( frame <= 13 ){
        frame = 14;
      }
      if( frame >= 25 ){
        frame = 14;
      }  
    }
    if( playerState() == "IDLELEFT" ){
      frame = 0;
    }
    if( playerState() == "IDLERIGHT" ){
      frame = 13;
    }
  }
}
void keyPressed(){
  if( key == CODED ){
    if( keyCode == UP ){
      keys[0] = true;
    }
    if( keyCode == DOWN ){
      keys[1] = true;
    }
    if( keyCode == LEFT ){
      keys[2] = true;
      lastKey = "LEFT";
    }
    if( keyCode == RIGHT ){
      keys[3] = true;
      lastKey = "RIGHT";
    }
  }
  if( key == 'z' ){
    keys[4] = true;
  }
  if( key == 'x' ){
    keys[5] = true;
  }
  if( key == 'c' ){
    keys[6] = true;
  }
}

void keyReleased(){
  if(key == CODED){
    if(keyCode == UP){
      keys[0] = false;
    }
    if(keyCode == DOWN){
      keys[1] = false;
    }
    if(keyCode == LEFT){
      keys[2] = false;
    }
    if(keyCode == RIGHT){
      keys[3] = false;
    }
  }
  if( key == 'z' ){
    keys[4] = false; // Attack
  }
  if( key == 'x' ){
    keys[5] = false; // Jump
  }
  if( key == 'c' ){
    keys[6] = false;
  }
}




