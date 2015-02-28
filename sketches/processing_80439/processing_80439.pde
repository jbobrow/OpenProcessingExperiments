
/* Reference pg 140, 
   Algorithms for Visual Design: using the processing language, 
   Kostas Terzidis
*/

StarNursery star_nursery; // create the star nursery variable
SpriteFactory sprite_factory; // create the sprite factory variable (the sprites are the eyeballs)

void setup() {
  size(displayWidth, displayHeight);  
  smooth();
  background(0);
  cursor(HAND);

  star_nursery = new StarNursery(150); // construct the nursery with the number of stars (an array)
  sprite_factory = new SpriteFactory(); // construct the factory for the sprites (an arraylist)
}

void draw() {
  colorMode(RGB);
  background(0);

  // creates lines using bezier curves that create the appearance of an organism of connected eyeballs.
  stroke(200, 0, 255, 80);
  strokeWeight(0.8);
  noFill();
  for ( int i = 0; i < sprite_factory.getSpriteFamily().size(); i++ ) {
    // when there are five eyeballs, make each eyeball on the screen the coordinates for each anchor and control point
    if ( i + 4 < sprite_factory.getSpriteFamily().size() ) {
      bezier( sprite_factory.getSpriteFamily().get(i+3).xpos, sprite_factory.getSpriteFamily().get(i+3).ypos, 
      sprite_factory.getSpriteFamily().get(i+2).xpos, sprite_factory.getSpriteFamily().get(i+2).ypos, 
      sprite_factory.getSpriteFamily().get(i+1).xpos, sprite_factory.getSpriteFamily().get(i+1).ypos, 
      sprite_factory.getSpriteFamily().get(i).xpos, sprite_factory.getSpriteFamily().get(i).ypos);
    }
  }
  star_nursery.displayNightSky();
  star_nursery.changeStarColor(random(0, 255), random(255, 0));  
  sprite_factory.displayFamily();
  
}

/* When the cursor is a certain distance from an eyeball, 
   the eyeball is 'pushed' by the cursor in the same direction mouse is travelling.
   Mouse moves left, eyeballs go left */
void mouseMoved() {
  for ( Sprite s : sprite_factory.getSpriteFamily() ) {
    if ( dist( mouseX, mouseY, s.xpos, s.ypos) < 70 ) {
      s.friction = .5; // set initial friction, the rate the eyeball slows down by
      
      // force, the difference in the mouse position over time becomes the speed of an eyeball if it is in range
      s.xspeed += (mouseX-pmouseX);
      s.yspeed += (mouseY-pmouseY);
    }
    if ( dist( mouseX, mouseY, s.xpos, s.ypos) < 100 )
      s.flipColour(); // change colour of iris
  }
}

/* When the mouse is clicked and moved, the eyeballs are 'pushed' in the 
   opposite direction to the mouse's direction.
   Mouse goes left, eyeballs go right. */
void mouseDragged() {
  for ( Sprite s : sprite_factory.getSpriteFamily() ) {
    if ( dist( mouseX, mouseY, s.xpos, s.ypos) < 70 ) {
      s.friction = .5;// set initial friction, the rate the eyeball slows down by
      
      // force, the difference in the mouse position over time becomes the speed of an eyeball if it is in range
      s.xspeed += (pmouseX-mouseX);
      s.yspeed += (pmouseY-mouseY);
    }
    if ( dist( mouseX, mouseY, s.xpos, s.ypos) < 100 )
      s.flipColour(); // change colour of iris
  }
}

/* When mouse is pressed, the current eyeballs are placed at the mouse pointer position, 
   new ones still spawn at random position. */
void mousePressed() {
  for ( Sprite s : sprite_factory.getSpriteFamily() ) {
    s.xpos = mouseX;
    s.ypos = mouseY;
  }
}

/* When mouse is released, the eyeballs are nudged so they move faster and in the opposite 
   direction to which they were previously travelling.For example, eyeball going right at 
   a speed of 1, when mouse released, it heads left with a speed of 2. */
void mouseReleased() {
  for ( Sprite s : sprite_factory.getSpriteFamily() ) {
    s.xspeed *= -3;
    s.yspeed *= -3;
  }
}

//-----------------------------------------------------------------------------------------

// Creates eyeball
class Sprite {
  
  float xpos = 0.0, ypos = 0.0; // eyeball position
  float friction = 0.5; // initial amount of friction on eyeball
  float xspeed = 0, yspeed = 0; // eyeball speed
  float xtime, ytime; 
  float increment; // counter
  float a, h, s, b; // colours for eyes
  float pupilSize = 0.6; // initial pupil size
  float age = 1; // initial age of eyeball

  // Constructor
  public Sprite(float h, float s, float b, float a) {  
    this.a = a;
    this.h = h;
    this.s = s;
    this.b = b;
    
    this.xspeed = random(-2, 2);
    this.yspeed = random(-2, 2);
    this.xtime = random(0, displayWidth);        
    this.ytime = random(0, displayHeight);
    this.increment = 2;
    
    this.xpos = noise(xtime) * width;
    this.ypos = noise(ytime) * height;
  }

  // Sets age of eyeball
  void setAge(float age) {
    this.age = age;
  }

  // Sets colour of eyeball's iris
  void setHSB(float h, float s, float b) {
    this.h = h;
    this.s = s;
    this.b = b;
  }

  // Default movement of eyeball
  void move() {
    xtime += increment;
    ytime += increment;

    xpos += ( (noise(xtime) * xspeed )/ friction );
    ypos += ( (noise(ytime) * yspeed )/ friction );

    if ( xpos > width )
      xspeed *= noise(xtime) * random(-3, -1);
    else if ( xpos < 0 )
      xspeed *= noise(xtime) * random(-3, -1);
    else if ( ypos > height )
      yspeed *= noise(ytime)*random(-3, -1);
    else if ( ypos < 0 )
      yspeed *= noise(ytime)*random(-3, -1);

    // keep the eyeball inside the frame
    xpos = constrain( xpos, 0, width ) ;
    ypos = constrain( ypos, 0, height ) ;

    friction += age * 0.05; // oldies go slower
  }

  // Change iris colour when mouse within certain range of eyeball
  void flipColour() {
    this.h = map(this.h, 0, 255, 255, 0);
  }

  // Draw the eyeball 
  void display() { 
    // the sclera of eye. The white bit.
    colorMode(RGB);
    fill(250, 255, 230, a);
    ellipse(int(xpos), int(ypos), int(xpos)/2*0.5, int(ypos)/1.5*0.5);  
    
    // the iris
    colorMode(HSB);
    fill(h, s, b);
    ellipse(int(xpos), int(ypos), int(xpos)/3*0.5, int(ypos)/3*0.5);
    
    // the pupil
    colorMode(RGB);
    fill(0);
    // change size of pupil depending on distance of cursor from eyeball, but keeping it contained within the iris
    int influence = 160;
    if ( dist(xpos, ypos, mouseX, mouseY) < influence ) {
      pupilSize = map(dist(xpos, ypos, mouseX, mouseY)/influence, 0, 1, 1.005, 0.5);
    }
    else {
      pupilSize = 0.6;
    }
    ellipse(int(xpos), int(ypos), (int(xpos)/6)*pupilSize, (int(ypos)/6)*pupilSize);
    colorMode(HSB);
  }
}

//--------------------------------------------------------------------------------------------

// Creates the arraylist of eyeballs
class SpriteFactory {
  
  ArrayList<Sprite> sprite_family;  

  // Constructor
  public SpriteFactory() {
    sprite_family = new ArrayList<Sprite>();
  }

  public ArrayList<Sprite> getSpriteFamily() {
    return sprite_family;
  }

  // Create a new eyeball and add it to the family of eyeballs
  public void createNewSprite() {    
    sprite_family.add( new Sprite( random(0, 255), random(0, 255), 
    random(30, 255), random(10, 255)) );

    // as soon as an eyeball gets born, everyone gets to age
    for ( int i = 0; i < sprite_family.size(); i++ ) {
      sprite_family.get(i).setAge(i*0.1+0.1);
    }
  }

  // Kill off the old eyeballs
  public void destroyOldSprite() {
    if ( sprite_family.size() > 0 ) {
      sprite_family.remove(0);
    }
  }

  // Presenting the eyeball family
  void displayFamily() {
    if ( frameCount % 8 == 0) {
      createNewSprite(); // make a new eyeball
    }

    // put each item in sprite_family in variable s
    for ( Sprite s : sprite_family ) {
      noStroke();
      s.move();
      s.display();
    }

    // population control
    if (  ( frameCount % 13 == 0) || (frameCount % 37 == 0) || (frameCount % 101 == 0) || sprite_family.size() > 75) {
      destroyOldSprite();
    }
  }
}

//---------------------------------------------------------------------------------------------------

// Create a star
class Star {
  private float x;
  private float y;
  private float starSize;

  // Constructor
  public Star() {
    // random position
    x = random(0, width);
    y = random(0, height);
    starSize = random(0.1, 4.5);
  }

  // Draw star
  public void displayStar() {     
    strokeWeight(starSize);  
    point(x, y);
  }
}

//--------------------------------------------------------------------------------------------------

// Create an array of stars
class StarNursery {
  
  private Star[] starCollective;
  private float alphaRnd; // random alpha value variable
  private float colRnd, colRnd1; // random colour value variable

  // Constructor
  public StarNursery( int numStars ) {
    starCollective = new Star[numStars]; // initialised array of stars    
    for ( int i = 0; i < numStars; i++ ) {
      starCollective[i] = new Star();
    }
  }
  
  // Draw stars
  public void displayNightSky() {
    for ( int i = 0; i < starCollective.length; i++ ) {
      float whiteBrightRnd = random(250, 255);
      alphaRnd = random(100, 180);
      stroke(whiteBrightRnd+50, whiteBrightRnd-10, whiteBrightRnd-10, alphaRnd);
      starCollective[i].displayStar();
    }
  }

  /* Depending on where the mouse is on the x and y-axises and 
  the position of star element in array, change the colour of the stars */
  public void changeStarColor(float colRnd, float colRnd1) {
    this.colRnd = colRnd;
    this.colRnd1 = colRnd1;
    colorMode(HSB);
    
    for ( int i = 0; i < starCollective.length; i++) {
      if ( mouseX > 0 && mouseX < width*0.25 || mouseX > width*0.5 && mouseX < width*0.75) {
        if ( i % 7 == 0 || i % 17 == 0 || i % 29 == 0 || i % 37 == 0 || i % 47 == 0 || i % 53 == 0) {
          float hueVal = map(mouseX, 0, width, colRnd, colRnd1);
          float alphaVal = map(mouseY, 0, height, 0, 255);
          stroke( hueVal, 255, 255, alphaVal);
        }
        else {
          float hueVal = map(mouseX, 0, width, 0, 255);
          float alphaVal = map(mouseY, 0, height, 0, 255);
          stroke( hueVal, 255, 255, alphaVal);
        }
      }
      else if ( mouseX > width*0.25 && mouseX < width*0.5 || mouseX > width*0.75 && mouseX < width) {
        if ( i % 3 == 0 || i % 31 == 0 || i % 13 == 0 || i % 19 == 0 || i % 23 == 0 || i % 41 == 0) {
          float hueVal = map(mouseX, 0, width, colRnd1, colRnd);
          float alphaVal = map(mouseY, 0, height, 0, 255);
          stroke( hueVal, 255, 255, alphaVal);
        }
        else {
          float hueVal = map(mouseX, 0, width, 0, 255);
          float alphaVal = map(mouseY, 0, height, 0, 255);
          stroke( hueVal, 255, 255, alphaVal);
        }
      }

      starCollective[i].displayStar();
    } 
    colorMode(RGB);
  }
}


