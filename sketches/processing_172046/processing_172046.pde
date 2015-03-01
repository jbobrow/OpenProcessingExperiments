
import java.util.*;

int score, lives;
int dummyInt = 1; // Have to use HashMap with dummy value instead of HashSet
float time;
float[] speedStop;
boolean started;
Ship raider;

HashMap<Sprite, Integer> rockSet;
HashMap<Sprite, Integer> missileSet;
HashMap<Sprite, Integer> explosionSet;

ImageInfo debrisInfo, nebulaInfo, splashInfo, missileInfo, asteroidInfo, shipInfo, explosionInfo;
PImage debrisImage, nebulaImage, splashImage, missileImage, asteroidImage, shipImage, explosionImage;

Pfont font;

void setup()
{
  size(800, 600);
  background(128);
  started = false;
  score = 0;
  lives = 3;
  time = width * 7;

  font = createFont("Arial", 20, true);
  textFont(font, 20);
  fill(200, 0, 200);


  float[] topLeft = new float[] {
    0, 0
  };
  float[] bottomRight = new float[] {
    width, height
  };
  float[] screenCenter = new float[] {
    width/2, height/2
  };

  imageMode(CORNER);

  /*    
   # art assets created by Kim Lathrop, may be freely re-used in non-commercial projects, please credit Kim
   
   # debris images - debris1_brown.png, debris2_brown.png, debris3_brown.png, debris4_brown.png
   #                 debris1_blue.png, debris2_blue.png, debris3_blue.png, debris4_blue.png, debris_blend.png/
   */

  debrisInfo = new ImageInfo(topLeft, bottomRight, 0, 99999, false);
  debrisImage = loadImage("debris2_blue.png");

  // nebula images - nebula_brown.png, nebula_blue.png
  nebulaInfo = new ImageInfo(topLeft, bottomRight, 0, 99999, false);
  nebulaImage = loadImage("nebula_blue.png");

  float[] splashStart = new float[] {
    200, 150
  };

  splashInfo = new ImageInfo(splashStart, bottomRight, 0, 99999, false);
  splashImage = loadImage("splash.png");

  // missile image - shot1.png, shot2.png, shot3.png
  missileInfo = new ImageInfo(topLeft, bottomRight, 4, 60, false);
  missileImage = loadImage("shot3.png");

  // asteroid images - asteroid_blue.png, asteroid_brown.png, asteroid_blend.png
  asteroidInfo = new ImageInfo(topLeft, bottomRight, 40, 600, false);
  asteroidImage = loadImage("asteroid_brown.png");

  shipInfo = new ImageInfo(topLeft, bottomRight, 35, 99999, false);
  shipImage = loadImage("double_ship.png");

  // animated explosion - explosion_orange.png, explosion_blue.png, explosion_blue2.png, explosion_alpha.png
  explosionInfo = new ImageInfo(topLeft, bottomRight, 17, 24, true);
  explosionImage = loadImage("explosion_alpha.png");

  speedStop = new float[] {
    0, 0
  };
  raider = new Ship(screenCenter, speedStop, -PI/4, shipImage, shipInfo);

  rockSet = new HashMap<Sprite, Integer>();
  missileSet = new HashMap<Sprite, Integer>();
  explosionSet = new HashMap<Sprite, Integer>();
}

void draw()
{
  ++time;
  image(nebulaImage, nebulaInfo.getStartCorner()[0], 
  nebulaInfo.getStartCorner()[1], nebulaInfo.getEndCorner()[0], nebulaInfo.getEndCorner()[1]);
  float debrisMove = (time / 7) % (3 * width);
  image(debrisImage, - width + debrisMove, debrisInfo.getStartCorner()[1], 
  debrisInfo.getEndCorner()[0], debrisInfo.getEndCorner()[1]);
  image(debrisImage, - 2 *width + debrisMove, debrisInfo.getStartCorner()[1], 
  debrisInfo.getEndCorner()[0], debrisInfo.getEndCorner()[1]);


  String scoreStr = "Score: ";
  String livesStr = "Lives: ";
  scoreStr += score;
  livesStr += lives;
  text(livesStr, 10, 20); 
  text(scoreStr, width - textWidth(scoreStr) - 10, 20);


  if (lives < 1)
  {
    if (started)
      explode(raider);
    started = false;
  }
  processSpriteSet(explosionSet);
  processSpriteSet(rockSet);
  processSpriteSet(missileSet);

  if (!started) 
  { 
    image(splashImage, splashInfo.getStartCorner()[0], splashInfo.getStartCorner()[1]);
    return;
  }

  if (int(time) % (60 * 2) == 0)  
    rockSpawner();
  if (int(time) % (60 * 5) == 0)  
    rockSpawner();
  if (int(time) % (60 * 7) == 0)  
    rockSpawner();

  raider.drawMe();

  raider.update();
  if (int(time) % 10 == 0)
    raider.shoot();

  score += groupGroupCollide(rockSet, missileSet);
  lives -= groupSingleCollide(rockSet, raider);
}

void mouseClicked()
{
  started = true;
  lives = 3;
  score = 0;
}

void keyPressed()
{
  if (keyCode == UP)
    raider.setIsThrusting(true);
  if (keyCode == RIGHT)
    raider.isTurningRight = true;
  if (keyCode == LEFT)
    raider.isTurningLeft = true;
  if (key == ' ')
    raider.setIsShooting(true);
}

void keyReleased()
{
  if (keyCode == UP)
    raider.setIsThrusting(false);
  if (keyCode == RIGHT)
    raider.isTurningRight = false;
  if (keyCode == LEFT)
    raider.isTurningLeft = false;
  if (key == ' ')
    raider.setIsShooting(false);
}

class ExplosionSprite extends Sprite
{
  PImage originalImage;
  int frameSizeX;

  ExplosionSprite(float[] pos_, float[] vel_, float angle_, float angleVel_, PImage img_, ImageInfo info_)
  {
    super(pos_, vel_, angle_, angleVel_, img_, info_);
    frameSizeX = img.width / lifespan;    
    originalImage = img;
  } 

  boolean update()
  {    
    img = originalImage.get(age * frameSizeX, 0, frameSizeX, originalImage.height); // has to be here, in constructor doesn't work!?
    ++age;
    return age < lifespan;
  }
}

void explode(Sprite rock)
{  
  ExplosionSprite boom = new ExplosionSprite(rock.getPos(), speedStop, 0, 0, explosionImage, explosionInfo);
  explosionSet.put(boom, dummyInt);
}


class ImageInfo 
{
  float[] startCorner, endCorner;
  float radius;
  int lifespan;
  boolean animated;

  ImageInfo(float[] startCorner_, float[] endCorner_, float radius_, int lifespan_, boolean animated_)
  {    
    startCorner = startCorner_;
    endCorner = endCorner_;
    radius = radius_;       
    lifespan = lifespan_;            
    animated = animated_;
  }

  float[] getStartCorner()
  {
    return startCorner;
  }

  float[] getEndCorner()
  {
    return endCorner;
  }

  float getRadius()
  {
    return radius;
  }

  int getLifespan()
  {

    return lifespan;
  }

  boolean getAnimated()
  {
    return animated;
  }
}

class Ship extends Sprite
{
  boolean isThrusting, isTurningLeft, isTurningRight, isShooting;
  PImage imgFull, imgOn, imgOff;

  Ship(float[] pos_, float[] vel_, float angle_, PImage img_, ImageInfo info_)
  {
    super(pos_, vel_, angle_, TWO_PI/100, img_, info_);

    imgFull = img_;  
    isThrusting = false;
    isTurningLeft = false;
    isTurningRight = false;    
    isShooting = false;
  }

  void drawMe()
  {
    imageMode(CENTER);
    pushMatrix();   
    translate(pos[0], pos[1]);
    rotate(angle);
    
    if (isThrusting)
    {
      imgOn = imgFull.get(imgFull.width / 2, 0, imgFull.width / 2, imgFull.height); // has to be here, in constructor doesn't work!?    
      image(imgOn, 0, 0);
    } else {
      imgOff = imgFull.get(0, 0, imgFull.width / 2, imgFull.height); // has to be here, in constructor doesn't work!?
      image(imgOff, 0, 0);
    }    
    popMatrix();
    imageMode(CORNER);
  }

  boolean update()
  {
    float friction = 0.01;
    float acceleration = 0.3;
    float[] forward;

    this.turn();
    vel[0] = (1 - friction) * vel[0];
    vel[1] = (1 - friction) * vel[1];

    if (isThrusting)
    {
      forward = this.angle2vector(angle);
      vel[0] += forward[0] * acceleration;
      vel[1] += forward[1] * acceleration;
    }

    pos[0] = (pos[0] + vel[0] + width) % width; // have to add width to prevent modulo from returning negative values
    pos[1] = (pos[1] + vel[1] + height) % height;
    angle = (angle + TWO_PI) % TWO_PI;
    
    return true; 
  }

  void setIsThrusting(boolean isOn)
  {
    isThrusting = isOn;
  }

  void turn()
  {
    if (isTurningRight)
      angle += angleVel;

    if (isTurningLeft)
      angle -= angleVel;
  }

  void setIsShooting(boolean isOn)
  {
    isShooting = isOn;
  }

  void shoot()
  {
    if (!isShooting)      
      return;

    float[] forward, posMissile, velMissile;
    posMissile = new float[2];
    velMissile = new float[2];

    forward = this.angle2vector(angle);
    posMissile[0] = pos[0] + forward[0] * 40;
    posMissile[1] = pos[1] + forward[1] * 40;
    velMissile[0] = vel[0] + forward[0] * 8;
    velMissile[1] = vel[1] + forward[1] * 8;

    Sprite missile = new Sprite(posMissile, velMissile, angle, 0, missileImage, missileInfo);
    missileSet.put(missile, dummyInt);
  }

  float[] angle2vector(float ang)
  {
    float x = cos(ang);
    float y = sin(ang);
    return new float[] {
      x, y
    };
  }
}
class Sprite
{  
  float[] pos, vel, imgStartCorner, imgEndCorner;
  float angle, angleVel, radius;  
  PImage img;
  ImageInfo info;
  int lifespan, age;
  boolean animated;

  Sprite(float[] pos_, float[] vel_, float angle_, float angleVel_, PImage img_, ImageInfo info_)
  {

    // pos = pos_;  // do not shallow copy or crazy bugs
    // vel = vel_;
    pos = new float[2];
    pos[0] = pos_[0];
    pos[1] = pos_[1];
    vel = new float[2];
    vel[0] = vel_[0];
    vel[1] = vel_[1];

    angle = angle_;
    img = img_;  
    info = info_;
    angleVel = angleVel_;
    radius = info.getRadius();
    lifespan = info.getLifespan();
    animated = info.getAnimated();
    imgStartCorner = info.getStartCorner();
    imgEndCorner = info.getEndCorner();
    age = 0;
  }

  void drawMe()
  {
    imageMode(CENTER);
    pushMatrix();   
    translate(pos[0], pos[1]);
    rotate(angle);
    image(img, 0, 0);    
    popMatrix();
    imageMode(CORNER);
  }

  boolean update()
  {
    pos[0] = (pos[0] + vel[0] + width) % width; // have to add width to prevent modulo from returning negative values
    pos[1] = (pos[1] + vel[1] + height) % height;
    angle = (angle + angleVel + TWO_PI) % TWO_PI;
    age += 1;
    return age < lifespan;
  }

  boolean isColliding(Sprite other)
  {
    return (dist(this.getPos(), other.getPos()) < this.getRadius() + other.getRadius());
  }

  float[] getPos()
  {
    return pos;
  }

  float getRadius()
  {
    return radius;
  }
}

void processSpriteSet(HashMap<Sprite, Integer> set)
{
  HashMap<Sprite, Integer> removeSet = new HashMap<Sprite, Integer>();
  Iterator<Sprite> setIterator = set.keySet().iterator();

  while (setIterator.hasNext ())
  {
    Sprite sprite = setIterator.next();
    if (sprite.update())
      sprite.drawMe();
    else
      removeSet.put(sprite, dummyInt);
  }
  spriteRemover(set, removeSet);
}


int groupSingleCollide(HashMap<Sprite, Integer> rocks, Sprite missile)
{
  int collisions = 0;
  HashMap<Sprite, Integer> removeSet = new HashMap<Sprite, Integer>();
  Iterator<Sprite> rocksIterator = rocks.keySet().iterator();
  while (rocksIterator.hasNext ())
  {
    Sprite rock = rocksIterator.next();
    if (rock.isColliding(missile))
    {
      explode(rock);
      removeSet.put(rock, dummyInt);
      ++collisions;
    }
  }  
  spriteRemover(rocks, removeSet);
  return collisions;
}

int groupGroupCollide(HashMap<Sprite, Integer> rocks, HashMap<Sprite, Integer> missiles)
{
  int collisions = 0;
  HashMap<Sprite, Integer> removeSet = new HashMap<Sprite, Integer>();
  Iterator<Sprite> missilesIterator = missiles.keySet().iterator();
  while (missilesIterator.hasNext ())
  {
    Sprite missile = missilesIterator.next();
    int hit = groupSingleCollide(rocks, missile);
    if (hit > 0)
    {
      removeSet.put(missile, dummyInt);
      collisions += hit;
    }
  }  
  spriteRemover(missiles, removeSet);
  return collisions;
}

void spriteRemover(HashMap<Sprite, Integer> originalSet, HashMap<Sprite, Integer> removeSet)
{
  Iterator<Sprite> removeIterator = removeSet.keySet().iterator();
  while (removeIterator.hasNext ())
  {
    Sprite sprite = removeIterator.next();
    originalSet.remove(sprite);
  }
}

void rockSpawner()
{
  if (rockSet.size() > 20)
    return;

  float[] pos = new float[] {
    random(width), random(height)
    };
    ;
  float[] vel = new float[2];
  float[] rock2ship = new float[2];

  while (dist (pos, raider.getPos ()) < raider.getRadius() * 8)
  {
    pos = new float[] {
      random(width), random(height)
      };
    }
    ;

  for (int i = 0; i < 2; ++i)
  {
    rock2ship[i] = (raider.getPos()[i] - pos[i]) / 100;
    vel[i] = (rock2ship[i] + random(-2, 2)) * (score + 10) / 20;
  }

  Sprite rock = new Sprite(pos, vel, random(TWO_PI), random(0.3), asteroidImage, asteroidInfo);
  rockSet.put(rock, dummyInt);
}

float dist(float[] pointA, float[] pointB)
{
  return sqrt( sq(pointA[0] - pointB[0]) + sq(pointA[1] - pointB[1]) );
}



