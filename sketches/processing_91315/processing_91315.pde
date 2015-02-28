
// Troll Center--Vehicles
// by Daniel Jovanov
// 25 Feb 2013
// Includes Rage Guy and two types of smiling trolls.

Sprite eat; // the image that will "eat" another
Sprite happy; // the image that "dies of old age"
Sprite grimTroller; // image that shows after death
Sprite WTF; // runs away from "eat"
//Sprite rageMan; // shows when "eaten"

PImage background;
PImage tractorBeamImg; // by Devon Scott-Tunkin

void setup() {
  background = loadImage("background.jpg");
  size(600, 600);
  
  // load sprites--three objects, five images
  eat = new Sprite(int(random(100, 500)), int(random(100, 500)), 
                              100, 100, 4, "eat.jpg");
  WTF = new Sprite(int(random(100, 500)), int(random(100, 500)), 
                              100, 100, 7, 
                              "WTF.jpg", "rageMan.jpg"); // two images for 
                                                         // one object
  happy = new Sprite(int(random(100, 500)), int(random(100, 500)),
                              100, 100, 10, 
                              "happyTilDeath.jpg", "grimTroller.jpg"); } // setup()
  
  

void draw() { // most of the code written by Devon Scott-Tunkin,
              // 20 Feb 2013
  // background to clear screen
  imageMode(CORNER);
  image(background, 0, 0);
  
  // move our sprites
  eat.move();
  WTF.move();
  happy.move();
  
  // check collision
  boolean collided = WTF.collide(eat);
  
  if (happy.age > 60)
    happy.dead = true;
    
  if (collided && WTF.dead != true) // stop colliding when he gets really big
    WTF.dead = true; 
    
    // draw our sprites
    eat.draw();
    WTF.draw();
    happy.draw(); }

// Sprite class written by Devon Scott-Tunkin
// 20 Feb 2013
// Implemented by Daniel Jovanov
class Sprite {
  float x;
  float y;
  float xspeed;
  float yspeed;
  PImage img; // main image
  PImage other; // used in overloaded constructor, DAN J.
  float w;
  float h;
  boolean dead;
  float age;
   
  // main constructor that we call when we do new Sprite
  // (...   assign our variables to what we pass in)
  Sprite(float xx, float yy, float ww, float hh, 
                float sspeed, String imageName) {
    // assign x & y-coordinates, speed variables
    x = xx; y = yy; xspeed = sspeed; yspeed = sspeed;
    // load image
    img = loadImage(imageName);
    // assign width & height variables
    w = ww; h = hh;
    // assign age variable and set "death" mode to false
    dead = false; age = 0; } 
    // new Sprite(xx, yy, ww, hh, sspeed, imageName)
  
  // overloaded Sprite constructor (for images that "die"; 
  // new argument replaces first image with another upon "death")
  // DAN J, 26 Feb 2013
  Sprite(float xx, float yy, float ww, float hh, 
            float sspeed, String imageName, String otherImage) {
    // assign x & y-coordinates, speed variables
    x = xx; y = yy; xspeed = sspeed; yspeed = sspeed; 
    // load images
    img = loadImage(imageName); other = loadImage(otherImage);
    // assign width and height variables
    w = ww; h = hh;
    // assign age variable and set "death" mode to false
    dead = false; age = 0; } 
    // new Sprite(xx, yy, ww, hh, sspeed, imageName, otherImage)
   
  void draw() {
    imageMode(CENTER);
    if (!dead) 
      image(img, x, y, w, h);  // if (!dead), load main image 
    else if (dead)             // otherwise, load the other image
      image(other, x, y, w, h); } // Sprite.draw()
   
  void move() {
    if (!dead) {
      age += 0.167;
      
      // prevent the sprites from leaving the screen, even the sides and corners
      // Approximately, add square root of 2 to the length of each side.   
      if (x >= width - 52 || x <= 52) 
        xspeed = -xspeed;
        
      else if (y >= height - 52 || y <= 52)
        yspeed = -yspeed;
      
      x += xspeed;  y += yspeed; } } // Sprite.move()
   
  boolean collide(Sprite other) {
    if (!dead) {
      float d = dist(x, y, other.x, other.y);
      float maxWidth = max(w, other.w);
         
      if (d < maxWidth)
        return true; } // Sprite.collide(other)
       
    return false; } }
    
// END OF FILE


