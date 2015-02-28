
StarNursery star_nursery;
SpriteFactory sprite_factory;

void setup() {

  size(500, 500);  
  smooth();
  background(0);

  star_nursery = new StarNursery(150);
  sprite_factory = new SpriteFactory();  
}

void draw() {
  background(0);
  star_nursery.displayNightSky();
  sprite_factory.displayFamily();
  
  

  // Saves each frame as line-000000.png, line-000001.png, etc.
  //saveFrame("line-######.jpg");
}



class Sprite{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r, g, b, a;
  
  Sprite(float r, float g, float b, float a){
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
    this.location = new PVector(random(0, width), random(0, height));
    this.velocity = new PVector(0,0);
    this.acceleration = new PVector(-0.001, 0.01);
  }
  
  void move(){
    acceleration = PVector.random2D();
    acceleration.mult(random(2));
    velocity.add(acceleration);
    velocity.limit(random(0.5, 15));
    location.add(velocity); 
  }
  
  void display(){
    fill(250, 255, 230, a);
    ellipse(location.x, location.y, location.x/2*0.5, location.y/1.5*0.5);  
    fill(r, g, b, a);
    ellipse(location.x, location.y, location.x/3*0.5, location.y/3*0.5);
    fill(0, 0, 0, 250);
    ellipse(location.x, location.y, (location.x/6)*0.5, (location.y/6)*0.5);
  }
}

class SpriteFactory {

  ArrayList<Sprite> sprite_family;  

  public SpriteFactory() {

    sprite_family = new ArrayList<Sprite>();
  }

  public void createNewSprite() {

    sprite_family.add( new Sprite( random(100, 255), random(100, 255), 
    random(100, 255), random(100, 255)) );
  }

  public void destroyOldSprite() {

    if ( sprite_family.size() > 0 ) {
      sprite_family.remove(0);
    }
  }

  void displayFamily() {

    if ( frameCount % 8 == 0) {
      createNewSprite(); 
    }

    for ( Sprite s : sprite_family ) {

      noStroke();
      s.move();
      s.display();
    }

    if (  ( frameCount % 13 == 0) || (frameCount % 30 == 0)) {
      destroyOldSprite();
    }
  }
}
class Star {

  PVector location;
  float starSize;

  public Star() {

    this.location = new PVector(random(0, width), random(0, height));
    this.starSize = random(0.1, 4.5);
  }

  public void displayStar() { 

    strokeWeight(starSize);  
    point(location.x, location.y);
  }
}

class StarNursery {

  private Star[] starCollective;

  public StarNursery( int numStars ) {

    starCollective = new Star[numStars];  

    for ( int i = 0; i < numStars; i++ ) {
      starCollective[i] = new Star();
    }
  }

  public void displayNightSky() {

    for ( int i = 0; i < starCollective.length; i++ ) {

      float whiteBrightRnd = random(250, 255), alphaRnd = random(100, 180);

      stroke(whiteBrightRnd+50, whiteBrightRnd-10, whiteBrightRnd-10, alphaRnd);
      starCollective[i].displayStar();
    }
  }
  
}


