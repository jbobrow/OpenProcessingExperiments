
PImage stick1, stick2, stick3, stick4, stick5, stick6, stick7,stick8,stick9,stick10,player1,player2;
PFont font, font2,font4,font5,font6;
int boxwidth = 120;                              // width of command box
int fixY = 75;                                   // fixed position of command box on y axis
int boxheight = 80;                              //  height of command box 
float angle = 0.0;                               //for animating text 
float offset = 550;                              // for all text animations 
float scalar = 60;                               //for all text animations
float speed = 0.05;                              //general speed for text and other    
int frame = 0;                                   // common frame start for all animation sequences    
int numFrames = 5;                               // The number of frames in the animation 
PImage[] images = new PImage[numFrames];
PImage[] images3 = new PImage[numFrames];
PImage[] images4 = new PImage[numFrames];
int numFrames2 = 16;                             // The number of frames in the animation2
PImage[] images2 = new PImage[numFrames2];


void setup() {

  size(1366, 768);
  smooth();
  stick1 = loadImage("stickman4.png");
  stick2 = loadImage("stickmanhello.png");
  stick3 = loadImage("stickblah.png");
  stick4 = loadImage("stick4.png");
  stick5 =loadImage("stick5.png");
  stick6 = loadImage("sticksad.png");
  stick7 = loadImage("shout.png");
  stick8 = loadImage("fat.png");
  stick9 = loadImage("stickmanhello2.png");
  stick10 = loadImage("stick1.png");
  player1 = loadImage("playerimage.png");
  player2 = loadImage("playerimage2.png");
  font = loadFont("Broadway-48.vlw");
  font2 = loadFont("KristenITC-Regular-48.vlw");
  font4 = loadFont("Daniel-38.vlw");
  font5 = loadFont("Vibe-48.vlw");
  font6 = loadFont("Originally_compiled_by_Jon_Bernhardt.-38.vlw");
  for (int i = 0; i < numFrames; i++) {
    String imageName = "stickman" + nf(i, 0) + ".png";
    images[i] = loadImage(imageName);
  }
  for (int i = 0; i < numFrames2; i++) {
    String imageName = "dance" + nf(i, 0) + ".png";
    images2[i] = loadImage(imageName);
  }
  for (int i = 0; i < numFrames; i++) {
    String imageName = "laugh" + nf(i, 0) + ".png";
    images3[i] = loadImage(imageName);
  }
  for (int i = 0; i < numFrames; i++) {
    String imageName = "death" + nf(i, 0) + ".png";
    images4[i] = loadImage(imageName);
  }
}



void draw() { 
  frameRate(50);                               // general framerate
 // println( mouseX + "  " + mouseY);
  cursor(HAND);                               // cursor hand type instead of arrow
  toprow();                                   // calling function for commands in the top row      
  downrow();                                  // calling function for commands in the down row
  leftrightrow();                             // calling function for commands in the left and right rows
}


