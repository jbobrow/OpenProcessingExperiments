
//Fast close of missle command: https://en.wikipedia.org/wiki/Missile_Command
 
int points = 0;
int lives = 3;

int lanesheigt = 0;
int framesTillAnotherDrop = 200;
 
//KINDS OF THINGS
// bomb
 
//TBD
// make 3 things fall from sky at regular intervals
// add mouse click that shows radius around faller
//
//
 
 
ArrayList<Thing> things;
float particlesPerFirework = 1;
 
Bomb bomb;
 
//Add a bunch of things and "place them" somewhere
void populateThings()
{
  things = new ArrayList<Thing>();
  //start in the midle position
  float x = width/2;
  float y = 0;//height/2;
 
 
 
  //Use mouse position for x and y.
  //////  x = mouseX;
  //////  y = mouseY;
 
  float numberOfParticles = particlesPerFirework;
  float theHue = random(100);
  for (int i=0; i<numberOfParticles; i+=1)
  {
    //x = i*(width/numberOfParticles);
    //float dy = noise(i)*100;
    Thing aThing = new Thing(x, y);
    aThing.hue = theHue;
    things.add(aThing);
  }
}
 
 
 
class Thing
{
  float x;
  float y;
 
  float vx;
  float vy;
 
  float size;
  float hue;
 
  Thing(float x, float y)
  {
    this.x = x;
    this.y = y;
    size = 6;
    hue = random(100);//random hue
 
    vx = random(5) - 2.5;
    vy = random(1);//always fall down
  }
 
  boolean isTouching(Thing other)//simple distance based hit test
  {
    double distToOther = Math.sqrt((x-other.x)*(x-other.x) +(y-other.y)*(y-other.y));
    if (distToOther <= (.5*this.size + .5*other.size))
      return true;
    return false;
  }
 
  //Draws the "thing"
  void drawMe()
  {
    fill(hue, 100, 100);
    ellipse(x, y, size, size);
    stroke(255,0,0,50);//red X
    line(x-10,y-10,x+10,y+10);
    line(x-10,y+10,x+10,y-10);
   
    //System.out.println("Drawing at "+x+" "+" "+y);
  }
 
  void fall()
  {
    vy += .1*.25;
  }
 
  void moveByVel()
  {
    x += vx;
    y += vy;
  }
 
  //brings to the top, but only sometimes.
  void maybeJump()
  {
    if (random(1000) < 1)
      y = 0;
  }
}
 
class Bomb extends Thing
{
  float timeToLive;
  Bomb(float x, float y, float timeToLive, float rad)
  {
    super(x, y);
    this.size = rad;
    this.timeToLive = timeToLive;
  }
 
  void decay()
  {
    timeToLive -= 1;
    size += 1;
  }
 
  void drawMe()
  {
    if (timeToLive < 0)
    {
    }
    else
    {
      super.drawMe();
    }
  }
}
 
 
//Not great code
void mouseBomb()
{
  if (bomb == null)
    bomb = new Bomb(mouseX, mouseY, 55, 10);
}
 
 
 
void draw() {
 
  background(100);
 
  if (frameCount % framesTillAnotherDrop == 0)
  {
    populateThings();
  }
  stroke(0);
  fill(0);
  textSize(32);
  text("points "+points, 32, 60);
  if (things == null) //Stop if there are no things
    return;
  for (Thing thing: things)
  {
 
 
 
    if (bomb != null)//A bomb is there
    {
      if (thing.isTouching(bomb))
        thing.vy = -10;
    }
 
    thing.drawMe();
    thing.moveByVel();
    thing.fall();
 
 
 
    //if(thing.y > -10+height)
    //  thing.maybeJump();
    //    p.run();
    //    if (p.isDead()) {
    //      it.remove();
  }
  if (bomb != null)
  {
    bomb.drawMe();
    bomb.decay();
    if (bomb.timeToLive < 0)
    {
      bomb = null;//make the bomb go away
      points += 1;
    }
  }
}
 
void mouseClicked()
{
  //background(0); // clear screen
  //populateThings(); //start over
  mouseBomb();
}
 
void setup() {
  size(640, 360);
  colorMode(HSB, 100);
  //mono = loadFont("AndaleMono-32.vlw");
  //populateThings();
}
