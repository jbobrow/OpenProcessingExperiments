
//**************************************
//********* by Gareth Dyson ************
//**************************************
import ddf.minim.*;
float margin;
float shapeSize;

Flake[] flakes;

Minim m;
float level;
String frameCountStr;
float fcsw;

void setup()
{
  size(500, 500);

  // always start Minim first!
  m = new Minim(this);

  float x = 0.0;
  float y = -20.0;
  
  // create font manager.
  FontManager fontManager = new FontManager();
  
  // load flake objects
  flakes = new Flake[7];
  flakes[0] = new Flake(fontManager, "soft.wav", "Soft");
  flakes[1] = new Flake(fontManager, "glow.wav", "Glow");
  flakes[2] = new Flake(fontManager, "electric.wav", "Electric");
  flakes[3] = new Flake(fontManager, "sex.wav", "Sex");
  flakes[4] = new Flake(fontManager, "gleaming.wav", "Gleaming");
  flakes[5] = new Flake(fontManager, "inthewi.wav", "in the");
  flakes[6] = new Flake(fontManager, "window.wav", "Window");

  textAlign(CENTER, CENTER);
  
  frameRate(24);
  fill(0);

}

void draw() {

  background(255);
  
  for (int i = 0; i < flakes.length; i++) {
    if (flakes[i].mouseOver()) {
      fill(255, 0, 0);
    } else {
      fill(0);
    }
    flakes[i].drawFlake();
    flakes[i].updatePosition();
  }
}

class FontManager {
  PFont[] font;
  
  FontManager() {
    // load fonts
    font = new PFont[5];
    font[0] = loadFont("CooperBlack-12.vlw");
    font[1] = loadFont("CooperBlack-24.vlw");
    font[2] = loadFont("CooperBlack-36.vlw");
    font[3] = loadFont("CooperBlack-48.vlw");
    font[4] = loadFont("CooperBlack-60.vlw");
  }
  
  PFont getFontForSpeed(int speed) {
     int i = speed-1;
     return font[i];
  }
}

class Flake {
  
  FontManager fontManager;
  int fontSize;
  AudioPlayer song;
  float x;
  float y;
  int speed;
  boolean playing;
  String soundWord;
  String drawText;
  
  Flake(FontManager fontManager, String audioFile, String soundWord) {
    this.fontManager = fontManager;
    song = m.loadFile(audioFile, 1024);
    setStartPosition();
    playing = false;
    this.soundWord = soundWord;
  }
 
   void drawFlake() {
     textFont(fontManager.getFontForSpeed(speed));
     text(drawText, x, y);
   }
 
   void updatePosition() {
     y+=speed;
     if (y > height+fontSize) {
        setStartPosition();
     }
   }
  
    void setStartPosition() {
      x = random(width);
      y = random(-40.0, -20.0);
      speed = round(random(1, 5));
      fontSize = 12 * speed;
      //println("speed: "+speed+", fontSize: "+fontSize);
    }
   
   boolean mouseOver() {
     boolean over = false;
     float range = 20.0;
     float minX = x - range;
     float maxX = x + range;
     float minY = y - range;
     float maxY = y + range;
     if (mouseX >= minX && mouseX <= maxX &&
         mouseY >= minY && mouseY <= maxY) {
           if (playing == false) {
             playing = true;
             song.play(0);
           }
           drawText = soundWord;
           over = true;
     } else {
       drawText = "*";
     }
    checkForEnd();
    return over; 
   }
   
   void stop() {
     song.close();
   }
   
  void checkForEnd() {
  //println("song length: "+song.length()+"song position: "+song.position());
    if (song.length() - song.position() < 30) {
    //  println("End of track.");
      song.pause();
      playing = false;
    }
  }
}




// clean up Minim before exiting
void stop()
{
  for (int i = 0; i < flakes.length; i++) {
    flakes[i].stop();
  }
  super.stop();
}




