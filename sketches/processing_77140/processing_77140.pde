

/*
J. Dailey Pokemon Ranch
Some code derived from:
- Examples ->Minim Audio ->LoadFile
- Examples ->Animation   ->Sequential
- Processing Book - Section Image 1: Display, Tint
- Prey and Predator Example by Brian Schrank, PhD
*/

// Sound.
import ddf.minim.*;
AudioPlayer garden; Minim minim;

// "Frame rate" for the 3 images.
int frameBu = 0; // Butterfly.
int frameBr = 0; // Bird.
int frameDg = 0; // Dragon.
// Animation values for image frames.
int numFramesBu = 2; // Butterfly
int numFramesBr = 2; // Bird
int numFramesDg = 2; // Dragon
// Coordinate values for monsters.
// Butterfly
float Bu_x = random(10, 190);
float Bu_y = random(10, 190);
// Bird
float Br_x = random(25, 170);
float Br_y = random(25, 170);
// Dragon
float Dg_x = random(45, 155);
float Dg_y = random(45, 155);
// Speed values for the monsters.
float Speed = 3;
// Directional values for the monsters.
// Butterfly.
float dirBu_x = 1;
float dirBu_y = 1;
// Bird.
float dirBr_x = 1;
float dirBr_y = 1;
// Dragon
float dirDg_x = 1;
float dirDg_y = 1;

// Additional animation values for image frames.
PImage[] imagesBu = new PImage[numFramesBu]; //Butterfly.
PImage[] imagesBr = new PImage[numFramesBr]; //Bird.
PImage[] imagesDg = new PImage[numFramesDg]; //Dragon.

// Image for background. Monster "garden."
PImage field;

/*
A Boolean value for the butterfly. Butterfly is scared of dragon.
*/
boolean Bu_isScared = false;

/*
//A WIP. In hopes that the bird will "breed" with the butterfly if
it's attracted to it when butterfly x-stretched(Bu_growthX = 1) & y-stretched(Bu_growthY = 1) values are increased:
(x * Bu_growthX, y * Bu_growthY)
It creates a monster egg, that in which isn't afraid of the Dragon but the Dragon will be 
afraid of the hybrid monster.
boolean Bu_isAttracted = true; //image("image", x, y, x-stretched, y-stretched);
*/

void setup()
{
 background(255);
 //
 size(250, 250);
 field = loadImage("GrassField.PNG"); 
 
 //
 minim = new Minim(this);
 garden = minim.loadFile("Garden.wav", 1024); garden.loop();
 
 frameRate(10); 
 // Butterfly images.
 imagesBu[0]  = loadImage("Butterfly_A.png"); 
 imagesBu[1]  = loadImage("Butterfly_B.png");
 // Bird images.
 imagesBr[0]  = loadImage("Bird_A.png"); 
 imagesBr[1]  = loadImage("Bird_B.png"); 
 // Dragon images.
 imagesDg[0]  = loadImage("Dragon_A.png"); 
 imagesDg[1]  = loadImage("Dragon_B.png");
 // Directional setup for monsters.
 // Butterfly.
 dirBu_x = random(-Speed, Speed); dirBu_y = random(-Speed, Speed);
 // Birds.
 dirBr_x = random(-Speed, Speed); dirBr_y = random(-Speed, Speed);
 // Dragon.
 dirDg_x = random(-Speed, Speed); dirDg_y = random(-Speed, Speed);  
}

void draw()
{
 //
 background(255); image(field, 0, 0, width, height);
 // Butterfly method initialization.
 ButterflyStatus();
 // Bird method initialization.
 BirdStatus();
 // Dragon method initialization.
 DragonStatus();
}


void ButterflyStatus()
{
 // Animation.
 frameBu = frameBu + 1;
 if (frameBu >= numFramesBu) { frameBu = 0; } image(imagesBu[frameBu], Bu_x, Bu_y);
 // Movement.
 Bu_x += dirBu_x * 1.5; Bu_y += dirBu_y * 1.5;
 // Placement to remain on the screen.
 if (Bu_x > 236 || Bu_x < 16) { dirBu_x = -dirBu_x; }
 if (Bu_y > 236 || Bu_y < 16) { dirBu_y = -dirBu_y; }
 
 // Distance check between the Dragon image & Butterfly image.
  if (dist(Dg_x, Dg_y, Bu_x, Bu_y) < 51)
  {
    if (Bu_isScared == false) 
    // Reaction is scared. Inverses direction.
    { dirBu_x = -(dirBu_x); dirBu_y = -(dirBu_y); Bu_isScared  = true; }
  else 
   {
   // 
   Bu_isScared  = false;
   Bu_x += dirBu_x * 1.5; Bu_y += dirBu_y * 1.5;
   }
}
  
 // Distance check between the Bird image & Butterfly image.
  if (dist(Bu_x, Bu_y, Br_x, Br_y) < 51)
  {  
   if ( Bu_x < Br_x)
  {  Bu_x += 1;}
  else
  {  Bu_x -= 1;}
  }
}


// Blank whitespace for above editing.


void BirdStatus()
{
  // Animation.
  frameBr = frameBr + 1;
  if (frameBr >= numFramesBr) { frameBr = 0; } image(imagesBr[frameBr], Br_x, Br_y);
  // Movement.
  Br_x += dirBr_x; Br_y += dirBr_y;
  // Placement to remain on the screen.
  if (Br_x > 236 || Br_x < 16) { dirBr_x = -dirBr_x; }
  if (Br_y > 236 || Br_y < 16) { dirBr_y = -dirBr_y; }
}

void DragonStatus()
{
 // Animation.
 frameDg = frameDg + 1;
 if (frameDg >= numFramesDg) { frameDg = 0; } image(imagesDg[frameDg], Dg_x, Dg_y);
 // Movement
 Dg_x += dirDg_x * 0.5; Dg_y += dirDg_y * 0.5;
 // Placement to remain on the screen.
 if (Dg_x > 236 || Dg_x < 16) { dirDg_x = -dirDg_x; }
 if (Dg_y > 236 || Dg_y < 16) { dirDg_y = -dirDg_y; }
}

