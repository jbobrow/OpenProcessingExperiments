
/*Most of this code is from examples made by Daniel Shiffman from the Nature of Code,
 but then I put them together in different ways with different variables to create my own code
 http://natureofcode.com
 video tutorial of attraction behaviors in Verlet Physics: http://vimeo.com/62395898
 video tutorial of Verlet Physics: http://vimeo.com/62395897
 ControlP5slider example from library
 NOC_5_13_AttractRepel example from the Nature of Code, Chapter 5: physics libraries
 SimpleString example from the Nature of Code, Chapter 5: physics libraries
 link to downloads of toxiclibs library: http://hg.postspectacular.com/toxiclibs/downloads/
 make sure to download the toxiclibs-complete-0020.zip file only
 link to downloads of ControlP5 library: http://www.sojamo.de/libraries/controlP5/#installation
 
 
 For users, you can change the brightness of the light by moving the slider up. Then,
 you can click on a certain area of the window to set the light's position, where the "moths"
 will be attracted to it
 
 For a little bit of extra fun, try to click on an area where a lot of moths are, and see what
 happens. You will see that the moths are repulsed away from the light. I explain why this is
 later in the code in the "Light" tab.
 
 */
//These libraries are for the sliders and for allowing me to use Verlet Physics
import controlP5.*;
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

ControlP5 cp5;

//Creates an array called "bugs" that contains objects of the "Moth" class
ArrayList<Moth> bugs;

//Creates an attraction object called "Light"
Light attractor;

//Sets a standard light brightness for the slider
int lightBrightness = 200;

//Establishes that the physics engine I will use is based in VerletPhysics2D
VerletPhysics2D physics;

//Creates two different particles: the base of the light, and the bulb itself
Base p1;
Light p2;

void setup() {
  size(400, 500);

  //The next two lines in the code are based off of the AttractRepel example from the Nature of Code.
  //Establishes the physics system I am using
  physics = new VerletPhysics2D();

  //Sets the speed of the attraction
  physics.setDrag (.04);

  //Prevents the Moths from going outside of the screen
  physics.setWorldBounds(new Rect(0, 0, width, height));

  //"This" is another way of saying "me" or "what is being created at the same time"
  //I use "this" in my classes as well when establishing their behaviors
  cp5 = new ControlP5(this);

  //creates the slider that controls the brightness of the light based on a gray scale of 0-255
  //taken from ControlP5slider example from ControlP5 library
  cp5.addSlider("lightBrightness")
    .setPosition(20, 75)
      .setSize(20, 100)
        .setRange(0, 255)
          .setNumberOfTickMarks(255)
            ;

  //creates particle variables that are based in Vec2D   
  //This is taken from the SimpleString example in the Nature of Code, but I assigned my
  //own names to the particles
  p1 = new Base(new Vec2D(width/2, 20));
  p2 = new Light(new Vec2D(width/2+160, 20));

  //lock the base of the light in its place so that the bulb can swing from it
  p1.lock();

  //make spring connecting light and base
  VerletSpring2D spring=new VerletSpring2D(p1, p2, 100, 0.01);

  //Now I am adding both the particles and the spring to the physics world (VerletPhysics2D)
  physics.addParticle(p1);
  physics.addParticle(p2);
  physics.addSpring(spring);

  //Creates an array of 100 Moths, each of which are placed at random points in the window
  //This is very similar to part of the AttractRepel code except that I changed the values and
  //the names of the particles
  bugs = new ArrayList<Moth>();
  for (int i=0; i < 100; i++) {
    bugs.add(new Moth(new Vec2D(random(width), random(height))));
  }
}

void draw() {
  background(0);

  //constantly updates the physics system, as it is in draw
  physics.update();

  //displays a number of moths based on the amount in the array "bugs"
  for (Moth b: bugs) {
    b.display();
  }

  //Creates the line, or "spring", that connects the light and the bulb together
  stroke(255);
  strokeWeight(2);
  line(p1.x, p1.y, p2.x, p2.y);

  //Display the particles (Light and Base)
  p1.display();
  p2.display();

  //Causes the Light particle to go to the mouse position, but allows the Light to move
  //if mouse is released. This part of the code is based off of the AttractRepel Code
  if (mousePressed) {
    p2.lock();
    p2.set(mouseX, mouseY);
  } 
  else {
    p2.unlock();
  }
}

//The particle created here is based mostly off of the Particle class in the SimpleSpring example
//in the toxiclibs exercises from the Nature of Code book by Daniel Shiffman

//by extending into VerletParticle2D, acknowledges that it stays in VerletParticle physics
class Base extends VerletParticle2D {

  Base(Vec2D loc) {
    //super(loc) initializes the values so that they represent pixels--allows me to avoid using PVectors
    super(loc);
  }

  void display() {
    //allows me to place the rectangle based on the coordinates of its center
    rectMode(CENTER);
    fill(150);
    stroke(0);
    strokeWeight(2);
    rect(200, 30, 40, 60);
  }
}

//Again, the particle created here is based mostly off of the Particle class in the SimpleSpring example
//in the toxiclibs exercises from the Nature of Code book by Daniel Shiffman.
//However, I added an AttractionBehavior to the bulb so that the Moths would be attracted to it

class Light extends VerletParticle2D {
  float r;

  Light (Vec2D loc) {
    super (loc);
    r = 50;
    physics.addParticle(this);

    //While this part of the code is based roughly off of the Attract Repel code, I modified it
    //so that the particle would have a very specific strength and radius of attraction
    //When adding an attractor, there are three fields that I have to specify: what particle
    //is the attractor, what is the radius of the attraction, and how strong is the attraction
    physics.addBehavior(new AttractionBehavior(this, width, .5));

    //The negative strength of the attraction I have here causes the Moths to be pushed away
    //from the light. In addition, they are only pushed away if they are within 30 pixels of the light.
    physics.addBehavior(new AttractionBehavior(this, 30, -20));
  }


  //In displaying the bulb, I am basing the fill color off of the current value of my slider
  void display () {   
    fill(lightBrightness);
    ellipse(x, y, r, r);
  }
}

//Again, the particle created here is based mostly off of the Particle class in the SimpleSpring example
//in the toxiclibs exercises from the Nature of Code book by Daniel Shiffman.
//However, now I add a GravityBehavior to this class in order to make the Moths go to the floor
//after being "zapped" by the light

class Moth extends VerletParticle2D {

  float r;

  Moth(Vec2D loc) {
    super(loc);
    r = 8;
    physics.addParticle(this);

    //The AttractionBehavior with the Moths causes the attraction of the light and the Moths to compound 
    physics.addBehavior(new AttractionBehavior(this, 20, .5));

    //I made the GravityBehavior particularly small in order to prevent the flies from immediately
    //dropping to the ground.
    physics.addBehavior(new GravityBehavior(new Vec2D(0, 0.002)));
  }
  void display() {
    fill(142, 87, 38);
    ellipse(x, y, r*2, r*2);
  }
}

