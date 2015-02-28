
import arb.soundcipher.*;
SoundCipher sc = new SoundCipher(this);
SoundCipher ex = new SoundCipher(this);
SoundCipher bg = new SoundCipher(this);



int t = 0;
int fps = 100;
int adding = -1;
String newPosition = "";
int playingExample = -1;

color c; // variable to store the current color
//PImage img;

void setup() {
  //img = loadImage ("brushtest.png");
  size (1600, 700);
  smooth();
  frameRate(fps);
  
  // generate piano
  for( int i = 3; i < height / 14 - 3; i++ ) {
    Key k = new Key(i);
  }
  // Instrument 49 is piano
  bg.instrument(21);
  
}

void draw() {
 frameRate(fps);
  // draw ellipse at mouse location with the current color and no stroke
  noStroke();
  fill(c);
  ellipse(mouseX,mouseY,80,80);
  t++;
  
}

public class Key {
  int position;
  
  Key( int p ) {
    position = p;
    registerDraw(this);
  }
  
    void draw() {
    if( mouseX < 1600 && mouseY > position*15 && mouseY < position*15 + 15 ) {
      if( playingExample != position ) {
        if( playingExample >= 0 ) {
          ex.stop();
        }
        ex.playNote(position*4, 60, 1);
        playingExample = position;
      }
      if( mousePressed ) {
        fill(150);
        adding = position;
      } else {
        fill(200); 
      }
    } else {
      fill(255); 
    }
  }
}

public class Sound {
  public int position;
  public int pitch;
  float x, y;
  boolean enabled = true;
  
  Sound( int position_, int pitch_ ) {
    position = position_;
    pitch = pitch_;
    registerDraw(this);
    x = width/2 + 600*sin(radians(position)) + 25;
    y = height/2 + 200*cos(radians(position));
  }
  
  void draw() {
    if( enabled ) {
      boolean hovering = false;
      
      // check if note should be played
      if( t == position ) {
        sc.playNote(pitch, 100, 1);
      }
      fill( pitch*2, pitch*2, pitch*2 );
      
      // check if mouse is pressed
      if( mousePressed && hovering )
      {
        // remove this item
        this.destroy();
      }
    }    
  }
  
  void destroy() {     
     enabled = false;
  }
  
  
}

void keyPressed() {
  if (key == 'b') { c = color(0); } // press b to make the current color black
  if (key == 'w') { c = color(255); } // press w to make current color white
}





