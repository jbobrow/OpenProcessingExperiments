
/**
 *  
 *  Glissano
 *  By Prita Priscilla Hasjim
 *  Project for ICAM 101 at UCSD
 *
 **/

PImage stripe;       // Image used for sound waves
PImage tbone;        // Image used for the trombone
PImage slide;        // Image used for the slide
PImage def;          // Image used for the definition
PImage bg;           // Parchment background image
PImage slidebg;      // Parchment background image under slide
float x = 320;       // Current x-coordinate
float y = 75;        // Current y-coordinate
float beginX = 320;       // Beginning x-coordinate
float beginY = 75;        // Beginning y-coordinate
float radian = 0.0;  // Radian degree used to determine different positions
float distX;         // X-axis distance to move
float distY;         // Y-axis distance to move
float pct = 0.0;     // Percentage traveled (0.0 to 1.0)
int count = 0;       // Counter
float exponent = 4;  // Determines the curve
float step = 0.005;   // Size of each step along the path

int tboneX = 20;
int tboneY = 50;
int slideX = 250;
int slideY = 156;
int MIN_slideX = 250;
int MAX_slideX = 406;

// Used for color combinations
int a = 0;
int b = 50;
int c = 100;
int d = 150;
int e = 200;
int f = 255;

// Used as RGB values
int rCol = 255;
int gCol = 0;
int bCol = 0;

/*
 * Slide Pos  Notes  Frequency (Hz)   Color Code
 * 1	      F**	698.46	      red (255, 0, 0)
 * 2	      E		659.26	      orange (255, 50, 0)
 * 3	      Eb	622.25	      yellow-orange (255, 150, 0)
 * 4	      D		587.33	      yellow (255, 255, 0)
 * 5	      Db	554.37	      lime green (150, 255, 0)
 * 6	      C		523.25	      green (0, 200, 0)
 * 7	      B (Cb)	493.88	      aqua (0, 150, 200)
 *
 * **The F two lines above the staff
 */

/*
 * Default setup() method that declares all of the initial variables
 *
 */
void setup(){
  size(800, 400);
  noStroke();
  smooth();
  background(255);

  // Defines the trombone, slide, defition, and background images
  //tbone = loadImage("/imgs/trombone.png");
  slide = loadImage("/imgs/slide.png");
  slidebg = loadImage("/imgs/slidebg.png");
  def = loadImage("/imgs/def.png");
  bg = loadImage("/imgs/trombonebg.png");

  // Draws the background image to the screen at coordinate (0,0)
  // and the def image to (-0, 200)
  image(bg,0,0);
  image(def,-10,200);


}

/*
 * Default draw() loop that is continuously throughout the entirety of the
 * program
 *
 */
void draw(){
  tint(#ffffff, 10);
  image(bg,0,0);
  image(def,-10,200);


  tint(#ffffff, 100);
  soundWaves(beginX, beginY, width, rCol, gCol, bCol);
  
  if(mousePressed){
    tint(#ffffff, 100);
    changeColors();
    
    tint(#ffffff, 255);
    image(slidebg,246,153);
    
    tint(#ffffff, 255);
    moveSlide();
  }
  else{
    image(slide,slideX,slideY);
  }
}

/*
 * moveSlide() moves the slide so it is attached to the mouse
 */
void moveSlide(){
  if((mouseX-30) >= MIN_slideX && (mouseX-30) <= MAX_slideX){
    slideX = mouseX-30;
  }
  
  image(slide,slideX,slideY);

}

/*
 * changeColors() changes the RGB values of the sound wave
 */
void changeColors(){
  // 1st Position
  if((mouseX-30) < MIN_slideX){
    rCol = 255;
    gCol = 0;
    bCol = 0;
  }
  
  // 2nd Position
  if((mouseX-30) >= MIN_slideX && (mouseX-30) < (MIN_slideX+20)){
    rCol = 255;
    gCol = 50;
    bCol = 0;
  }
    
  // 3rd Position
  if((mouseX-30) >= (MIN_slideX+20) && (mouseX-30) < (MIN_slideX+50)){
    rCol = 255;
    gCol = 150;
    bCol = 0;
  }
    
  // 4th Position
  if((mouseX-30) >= (MIN_slideX+50) && (mouseX-30) < (MIN_slideX+70)){
    rCol = 255;
    gCol = 255;
    bCol = 0;
  }
  
  // 5th Position
  if((mouseX-30) >= (MIN_slideX+70) && (mouseX-30) < (MIN_slideX+100)){
    rCol = 100;
    gCol = 255;
    bCol = 0;
  }
  
  // 6th Position
  if((mouseX-30) >= (MIN_slideX+100) && (mouseX-30) < (MIN_slideX+130)){
    rCol = 0;
    gCol = 255;
    bCol = 0;
  }
  
  // 7th Position
  if((mouseX-30) >= (MIN_slideX+130)){
    rCol = 0;
    gCol = 150;
    bCol = 200;
  }
}

/*
 * soundWaves() declares the mathematical equations used for the soundwaves
 * being projected out of the trombone
 *
 * Parameters:  float beginX - starting x-coordinate location
 *              float beginY - starting y-coordinate location
 *              float endX - ending X-coordinate location
 *
 */
void soundWaves(float beginX, float beginY, float endX,
                int rColor, int gColor, int bColor){

  // Resets the coordinates, so it would continuously go back to its
  // starting position
  if (x >= width){
        x = beginX;
        y = beginY;
        radian = 0.0;
        pct = 0.0;
  }
  
  else{
      x += pct; // Changes the x-coordinate
      radian += 20;
      y = 85 + 30*sin(radian*30); // Changes the y-coordinate
      
      pct += step;
  }

  
  fill(rColor, gColor, bColor, 90);
  rect(x, y, 4, 39);
  stripe = loadImage("/imgs/stripe.gif");
  image(stripe, x, y);

}

/*
 * resetCoords() resets the coordinates for the sound waves
 *//*
void mouseReleased(){
  x = beginX;
  y = beginY;
  radian = 0.0;
  pct = 0.0;
}*/

