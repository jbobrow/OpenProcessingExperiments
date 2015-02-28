
//: Create the star nursery variable
StarNursery star_nursery;
//: Create the sprite factory variable
SpriteFactory sprite_factory;
PGraphics  pg;

void setup() {

  size(500,500, P3D);  
  smooth();
  background(0);

  //Construct the nursery with the number of stars
  star_nursery = new StarNursery(150);
  sprite_factory = new SpriteFactory();  

  pg = createGraphics(width, height, P3D);
}

void draw() {
  image(pg, 0, 0);
  
  pg.beginDraw();
  pg.background(0);
  star_nursery.displayNightSky();  
  sprite_factory.displayFamily();
  pg.endDraw();
  

  // Saves each frame as line-000000.png, line-000001.png, etc.
  //saveFrame("line-######.jpg");
}
//-------------------Sprites------------------------------
//referenced noise exercise, pg203 of Learning Processing, Daniel Shiffman.
class Sprite {  

  float xtime; //speed
  float ytime; //speed
  float increment; //speed
  float x, y; //location
  float r, g, b, a;

  //constructor, with colour
  public Sprite(float r, float g, float b, float a) {  

    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
    this.x = random(0, width);        
    this.y = random(0, height);
    this.xtime = random(0, width);        
    this.ytime = random(0, height);
    this.increment = 0.01;
  }

  //constructor, without colour
 /* public Sprite() {  

    xtime = random(0, displayWidth);        
    ytime = random(0, displayHeight);
    increment = 0.15;
  }*/

  //real - draw 
  void display() { 

    pg.fill(250, 255, 230, a);
    pg.ellipse(x, y, x/2*0.5, y/1.5*0.5);  
    pg.fill(r, g, b, a);
    pg.ellipse(x, y, x/3*0.5, y/3*0.5);
    pg.fill(0, 0, 0, 250);
    pg.ellipse(x, y, (x/6)*0.5, (y/6)*0.5);
    //println("x:" + x + "    y:" + y);
  }

  //virtual - do the numbers
  void move() {  

    xtime += increment;
    ytime += increment;
    x = noise(xtime) * width;
    y = noise(ytime) * height;
  }  
}

class SpriteFactory {

  ArrayList<Sprite> sprite_family;  

  //constructor
  public SpriteFactory() {

    sprite_family = new ArrayList<Sprite>();
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
      createNewSprite(); //make new ones
    }

    //for type sprite, put each item in sprite_family in variable s
    for ( Sprite s : sprite_family ) {

      pg.noStroke();
      s.move();
      s.display();
    }

    //population control
    if (  ( frameCount % 13 == 0) || (frameCount % 30 == 0)) {
      destroyOldSprite();
    }
  }
}
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

    pg.strokeWeight(starSize);  
    pg.point(x, y);
  }
}

class StarNursery {

  private Star[] starCollective;

  public StarNursery( int numStars ) {

    starCollective = new Star[numStars]; //array of stars 

    for ( int i = 0; i < numStars; i++ ) {
      starCollective[i] = new Star();
    }
  }

  public void displayNightSky() {

    for ( int i = 0; i < starCollective.length; i++ ) {

      float whiteBrightRnd = random(250, 255), alphaRnd = random(100, 180);

      pg.stroke(whiteBrightRnd+50, whiteBrightRnd-10, whiteBrightRnd-10, alphaRnd);
      starCollective[i].displayStar();
    }
  }
}


