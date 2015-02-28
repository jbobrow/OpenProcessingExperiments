
// Intro to Computational Arts Project 3
// December 16, 2013

// Casual Juxtapositions
// From the dictionary: Juxtaposition (noun): the fact of two things being 
// seen or placed close together with contrasting effect.

// This is a sketch of a city skyline by night and by day, 
// juxtaposed with a serene beach.
// It also features an audio track with calm classical (Indian) music
// juxtaposed with sound snippets from daily life.

// Overview of features available to the user:
// Move mouse left to right to change the percentage of window lighting.
// Press s or S to save picture to a file called "skyline.png" (with a sound effect).
// Press any other key to change building and window colors (with two sound effects).

// The processing code, background images, and music are entirely my original work.
// The music being played was created by me using Audacity and the ChucK programming language
// The classical music piece is 1 minute 20 seconds long
// Three small royalty-free audio sound snippets were taken from MS Windows distributions.

// Color Palettes
color[] nightColors = {#275686,#DCDE96,#275686,#010D1A,#031427,#BDC14A,#32340B}; 
color[] dayColors = {#95CBD8,#95CBD8,#FFF303,#010D1A,#343333,#0A0801,#C4CED3}; 
color[] palette = dayColors; // start with day pciture

// setup for import of composite background photos created using GIMP
PImage bgrd1, bgrd2;

// setup for playing audio
import ddf.minim.*;
Minim minim;
AudioPlayer music1; // classical music played when displaying picture
AudioPlayer dingSound, tadaSound, saveSound; // three small sound snippets

// declaring a variable for ratio of lighted windows vs non-lighted
int windowRatio;

// basic setup 
void setup() {
   size(800,600);
   textSize(14);
   
   // image setup
   bgrd1 = loadImage("P1050094a.JPG"); // day image
   bgrd2 = loadImage("P1050094b.JPG"); // night image
   windowRatio = 4; // initial ratio of lighted windows; 
                        // later get ratio between 0 and 10 from mouseX
                        
   // audio setup
   minim = new Minim(this);
   music1 = minim.loadFile("music1.wav"); 
   dingSound = minim.loadFile("ding.wav");
   tadaSound = minim.loadFile("tada.wav");
   saveSound = minim.loadFile("recycle.wav");
}

// processing keyboard-related activities
void keyReleased() {
  
  if (key == 's' || key == 'S') {
     saveFrame("skyline.png"); 
     saveSound.rewind(); 
     saveSound.play();
     }  
  
  else { // with any other key pressed/released, toggle or swap palette between night and day
      if (palette[0] == #95CBD8) {
          palette = nightColors; 
          dingSound.rewind(); 
          dingSound.play(); 
          }
      
      else if (palette[0] == #275686) {
               palette = dayColors; 
               tadaSound.rewind(); 
               tadaSound.play(); 
               }
      
   
  } 
}

// drawing the elements of the sketch
void draw() {

  // use mouseX to control the "lighting" of windows (by overall percentage only)
  windowRatio = int(mouseX/80); // get a number between 0 and 10 from mouseX

 
  // choose between night and day backgrounds
  if (palette[0] == #95CBD8) {image(bgrd1,0,0);}
  else {image(bgrd2,0,0);}

  // start the music
  music1.play();
      
  // call drawbuildings function to draw the buildings.    
  drawBuildings();


}

// night or day drawn through the same function
void drawBuildings() {

// strokeweight
strokeWeight(0);

// ground at the bottom of the image (in black)
stroke(#000000);
fill(#000000);
rect(0,400,800,84);

// prepare font for text
textSize(12);
if (palette[0] == #95CBD8) {fill(#0A0801);}
else {fill(#BDC14A);}
  
// present overview of available features to user
text("Move mouse left to right to change the percentage of window lighting.",10,540);
text("Press s or S to save picture to a file called skyline.png (with a sound effect)", 10, 560);
text("Press any other key to change building and window colors (with two sound effects).",10,580);

// draw skyscrapers using skyscraper() function created below
stroke(palette[3]);
strokeWeight(1);
skyscraper(10,420,70,200,10,10);
skyscraper(100,420,70,240,10,10);
skyscraper(190,420,90,320,10,10);
skyscraper(300,420,80,280,10,10);
skyscraper(400,420,80,300,10,10);
skyscraper(500,420,80,320,10,10);
skyscraper(600,420,80,320,10,10);
skyscraper(700,420,70,260,10,10);

}

// skyscraper function to draw skyscraper outline and windows
void skyscraper(int x,int y,int w,int h,int ox,int oh) {
fill(palette[4]);
rect(x,y,w,-h);
quad(x,y-h,x+ox,y-h-oh,x+w+ox,y-h-oh,x+w,y-h);
quad(x+w,y,x+w,y-h,x+w+ox,y-h-oh,x+w+ox,y-oh);

// draw windows for the skyscrapers
  randomSeed(y);
  strokeWeight(1);
  for (int i = x+10; i <= x+w-10; i+=10) {
    for (int j = y-20; j >= y-h+20; j-=20) {
      float r=random(10);
      if (r > windowRatio) {
         fill(palette[5]);
      }
      else {
        fill(palette[6]);
      }
    rect(i,j,6,-15);
    }
  }
}

void stop()
{
  // to close Minim audio classes
  music1.rewind();
  music1.close();

  // stopping Minim
  minim.stop();
}
// end of project 


