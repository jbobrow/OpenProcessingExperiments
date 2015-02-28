
// reference pg 140, Algorithms for Visual Design: using the processing language, Kostas Terzidis
// Create the star nursery variable
StarNursery star_nursery;
SpriteFactory sprite_factory;

//-------------------Stars-------------------------------

class Star {
  private float x;
  private float y;
  private float starSize;

  public Star() {
    x = random(0, width);
    y = random(0, height);
    starSize = random(0.1, 4.5);
  }

  public void displayStar() {     
    strokeWeight(starSize);  
    point(x, y);
  }
}

class StarNursery {
  private Star[] starCollective;
  private float alphaRnd;

  public StarNursery( int numStars ) {
    starCollective = new Star[numStars]; //array of stars    
    for ( int i = 0; i < numStars; i++ ) {
      starCollective[i] = new Star();
    }
  }

  public void displayNightSky() {
    for ( int i = 0; i < starCollective.length; i++ ) {
      float whiteBrightRnd = random(250, 255);
      alphaRnd = random(100, 180);
      stroke(whiteBrightRnd+50, whiteBrightRnd-10, whiteBrightRnd-10, alphaRnd);
      starCollective[i].displayStar();
    }
  }

  public void changeStarColor() {
    colorMode(HSB);
    for ( int i = 0; i < starCollective.length; i++) {
      if ( i % 17 == 0 || i % 53 == 0 || i % 13 == 0 || i % 5 == 0 || i % 37 == 0 || i % 29 == 0) {
        float hueVal = map(mouseX, 0, width, random(0, 255), random(0, 255));
        float alphaVal = map(mouseY, 0, height, 0, 255);
        stroke( hueVal, 255, 255, alphaVal);
      }
      /*else if( i % 37 == 0 || i % 29 == 0){
       float hueVal = map(mouseX, 0, width, 255, 0);
       float alphaVal = map(mouseY, 0, height, 0, 255);
       stroke( hueVal, 255, 255, alphaVal);
       }*/
      else {
        float hueVal = map(mouseX, 0, width, 0, 255);
        float alphaVal = map(mouseY, 0, height, 0, 255);
        stroke( hueVal, 255, 255, alphaVal);
      }

      starCollective[i].displayStar();
    } 
    colorMode(RGB);
  }
}

class SpriteFactory {

  ArrayList<Sprite> sprite_family;  

  //constructor
  public SpriteFactory() {
    sprite_family = new ArrayList<Sprite>();
  }

  public ArrayList<Sprite> getSpriteFamily() {
    return sprite_family;
  }

  //to create new sprite
  public void createNewSprite() {    
    sprite_family.add( new Sprite( random(0, 255), random(0, 255), 
    random(0, 255), random(0, 255)) );
  }

  //to kill off the old ones
  public void destroyOldSprite() {
    if ( sprite_family.size() > 0 ) {
      sprite_family.remove(0);
    }
  }

  //presenting the bunch
  void displayFamily() {
    if ( frameCount % 8 == 0) {
      createNewSprite(); //#: make new ones
    }

    
    //for type sprite, put each item in sprite_family in variable s
    for ( Sprite s : sprite_family ) {
      noStroke();
      s.move();
      s.display();
    }

    //population control
    if (  ( frameCount % 13 == 0) || (frameCount % 37 == 0) || (frameCount % 101 == 0)) {
      destroyOldSprite();
    }
  }
}

class Sprite {
  int diameter = 5;
  float xpos = 0.0, ypos = 0.0;
  float friction = 0.5;
  float xspeed = 0, yspeed = 0;
  float xtime;
  float ytime;
  float increment;
  float r, g, b, a;

  //constructor, with colour
  public Sprite(float r, float g, float b, float a) {  
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
    this.xspeed = random(-2, 2);
    this.yspeed = random(-2, 2);

    this.xtime = random(0, displayWidth);        
    this.ytime = random(0, displayHeight);
    this.increment = 2;
    this.xpos = noise(xtime) * width;
    this.ypos = noise(ytime) * height;
  }

  void setColour(float r, float g, float b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }

  void move() {
    xtime += increment;
    ytime += increment;

    xpos += ( (noise(xtime) * xspeed )/ friction );
    ypos += ( (noise(ytime) * yspeed )/ friction );

    if ( xpos > width ) {
      xspeed *= noise(xtime) * random(-3, -1);
    }
    else if ( xpos < 0 ) {
      xspeed *= noise(xtime) * random(-3, -1);
    }
    else if ( ypos > height ) {
      yspeed *= noise(ytime)*random(-3, -1);
    }
    else if ( ypos < 0 ) {
      yspeed *= noise(ytime)*random(-3, -1);
    }

    xpos = constrain( xpos, 0, width ) ;
    ypos = constrain( ypos, 0, height ) ;

    friction += random(0.01, 0.1);
  }


  //real - draw 
  void display() { 
    fill(250, 255, 230, a);
    ellipse(int(xpos), int(ypos), int(xpos)/2*0.5, int(ypos)/1.5*0.5);  
    fill(r, g, b, a);
    ellipse(int(xpos), int(ypos), int(xpos)/3*0.5, int(ypos)/3*0.5);
    fill(0, 0, 0, 250);
    ellipse(int(xpos), int(ypos), (int(xpos)/6)*0.5, (int(ypos)/6)*0.5);
  }
}

void setup() {
  size(displayWidth, displayHeight);  
  smooth();
  //frameRate(1);
  background(0);

  //Construct the nursery with the number of stars
  star_nursery = new StarNursery(150);
  sprite_factory = new SpriteFactory();
}

void draw() {
  background(0);
  star_nursery.displayNightSky();
  star_nursery.changeStarColor();  
  sprite_factory.displayFamily();
  
  //saveFrame("line-######.jpg");
}

void mouseMoved() {
  for ( Sprite s : sprite_factory.getSpriteFamily() ) {
    if ( dist( mouseX, mouseY, s.xpos, s.ypos) < 60 ) {
      s.friction = .5;
      s.xspeed = mouseX-pmouseX;
      s.yspeed = mouseY-pmouseY;
      s.setColour(150, 0, 0);
    }
  }
}



