
/*
 * MaryamMobiniA3_02.pde
 * Created by Maryam Mobini
 * November 11, 2012
 * mma99@sfu.ca
 * "MadeYourCodeBetter" is an improved version of "MakeMeBetterCode"
 */


Bubble bubble ;
int step = 10;
float centx, centy;
// for the new class
int numParticles = 100;
float lovely = 150;

// IceParticles and BubbleParticles are subclasses of GenParticles,
// so they can be stored in a Gen Particle array!
GenParticle[] p = new GenParticle[numParticles];

void setup() {
  frameRate(30);
  size(600, 600) ;


  bubble = new Bubble(width/2, height/2, 100) ;
  centx = width/2;
  centy = height/2;
  //
  for (int i = 0; i < p.length; i++) {
    if (random(12) > 8) {
      float velX = random(-3, 3);    // set the initial velocities to throw particles from all sides of the origin
      float velY = random(-3, 3);
      p[i] = new aParticle(width/2, height/2, velX, velY, 2.0, width/2, height/2);
    }
    else {
      if (random(12)<4) {
        float velX = random(-1, 1);  // the ice cubes have a smaller initial velocity than bubbles, which are lighter
        float velY = random(-1, 1);
        p[i] = new bParticle(width/2, height/2, velX, velY, 5.0, width/2, height/2);
      }
      else {
        float velX = random(-1, 1);  // the ice cubes have a smaller initial velocity than bubbles, which are lighter
        float velY = random(-1, 1);
        p[i] = new cParticle(width/2, height/2, velX, velY, 2.0, width/2, height/2);
      }
    }
  }
}



void draw() {

  background(0);
  fill(0, 20);
  bubble.render() ;
  bubble.update();
  //
  // rectMode(CORNER);
  // rect(0, 0, width, height);
  for (int i = 0; i < p.length; i++) {
    p[i].update();
    p[i].regenerate();
    p[i].display();
  }
}
void mousePressed() { 
  bubble.init();
}

/*
 * Bubble.pde
 * Created by Maryam Mobini
 * November 11, 2012
 * mma99@sfu.ca
 *  Draws an ellipse filled with n ellipses around the centre point
 *  extends Matter, inherits xpos, ypo, diam
 */

class Bubble extends Matter {

  ArrayList matters ; // the arraylist to store inside matters
  float nMatters ; // number of ellipses on the inside
  float matterSize  ; // relative size of the elippses
  float matterFromCentre  ; // relative distance from the centre
  int count, life, step;
  float origx, origy;
  float x1, y1, x2, y2;
  int rd, gr, bl, alph;
  float angle, radius;


  // constructor
  Bubble(float _x, float _y, float _d) {

    super(_x, _y, _d) ;

    matters = new ArrayList() ; // an array list for the inside matters
    nMatters = 10 ; // number of matters on the inside
    matterSize = diam * 0.125 ; // relative size of the elippses
    matterFromCentre = diam * 0.75 ; // relative distance from the centre

    // generate the matters inside around the edges of a circle
    // adding them to the array list
    for (float theta=0.0; theta < TWO_PI; theta += TWO_PI/nMatters) {
      float x = sin(theta) * matterFromCentre ;
      float y = cos(theta) * matterFromCentre ;
      matters.add(new CircularMatter(x, y, matterSize)) ; // add it to the aray list
    }
  } // end constructor

  // the render method defined in the abstract class Matter
  void render() {
    // color the ellipse

    fill(xpos, random(150), diam);

    ellipse(xpos, ypos, diam, diam) ; // the containing ellipse

    pushMatrix(); // push onto the matrix stack
    translate(xpos, ypos) ; // displace the matrix
    // iterate through our array list 
    for (int i=0; i< matters.size(); i++) {
      Matter matter = (Matter) matters.get(i) ; // get the current object in the araylist (is from the abstract class Matter)
      matter.render() ; // draw the item
    }
    popMatrix() ; // pop off the matrix stack
  } // end render

  // not animating yet, but could come in handy when I want to make it interesting
  void update() {
    count += step;
    angle = count; 
    // project x2pos,ypos from x1,y1, and draw a line to it
    xpos = centx + (radius * cos(angle));
    ypos = centy + (radius * sin(angle));
    // reset for next update
    x1 = xpos; 
    y1 = ypos;



    // expiration  
    if (count >= life) { 
      init();
    }
  }
  void init() {

    count = 0;
    step = int(random(20));
    life = 180 * int(random(5) + 1);
    radius = random(200);
    x1 = 20;
  }
}

/*
 * CircularMatter.pde
 * Created by Maryam Mobini
 * November 11, 2012
 * mma99@sfu.ca
 * Draws an ellipse at coords with diameter
 * extends Matter, inherits xpos, ypo, diam
 */



public class CircularMatter extends Matter {

  // simple constructor used to init variables
  CircularMatter(float _x, float _y, float _d) {
    super(_x, _y, _d) ;
  }

  // the render method defined in the abstract class Item
  // draws an ellipse
  void render() {
    ellipse(xpos, ypos, diam, diam) ;
  }
} // end class


/*
 * GenParticle.pde
 * Created by Maryam Mobini
 * November 11, 2012
 * mma99@sfu.ca
 */

class GenParticle extends Particle {
  float originX, originY;

  GenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r);
    originX = ox;
    originY = oy;
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-4.0, -2.0);
    }
  }
}
/*
 * Matter.pde
 * Created by Maryam Mobini
 * November 11, 2012
 * mma99@sfu.ca
 *  Abstract class defines attributes for xpos, ypo, diam
 *  defines render method
 */

abstract class Matter {

  float xpos, ypos ; // used for coords
  float diam ;      // used for size

  // The construcot
  Matter(float _x, float _y, float _d) {
    xpos = _x ;
    ypos = _y ;
    diam = _d ;
  }

  // used for drawing code
  abstract void render() ;
}

/*
 * Particle.pde
 * Created by Maryam Mobini
 * November 11, 2012
 * mma99@sfu.ca
 */


class Particle {
  float x, y; // The x- and y-coordinates
  float vx, vy; // The x- and y-velocities
  float radius; // Particle radius
  float gravity = 0.025;

  Particle(float xpos, float ypos, float velx, float vely, float r) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    radius = r;
  }

  void update() {
    vy = vy + gravity;
    y += vy;
    x += vx;
  }

  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}

/*
 * aParticle.pde
 * Created by Maryam Mobini
 * November 11, 2012
 * mma99@sfu.ca
 */


class aParticle extends GenParticle {

  aParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x =width/2;
      y = height;
      vx = random(-10.0, 10.0);
      vy = random(-4.0, 8.0);
    }
  }
  void display() {
    noFill();
    strokeWeight(random(1, 2));
    stroke(random(150, 200), random(150, 200), random(50, 100), 40);
    ellipse(x, y, radius*random(3, 6), radius*random(3, 6));
  }
}

/*
 * bParticle.pde
 * Created by Maryam Mobini
 * November 11, 2012
 * mma99@sfu.ca
 */

class bParticle extends GenParticle {

  bParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = originX+10;
      y = height;
      vx = random(-8.0, 15.0);  
      vy = random(-4.0, -20.0);
      radius=random(4, 9);
    }
  }
  void display() {
    noFill();
    strokeWeight(random(1, 2));
    stroke(random(150, 200), random(100, 150), random(50, 100));
    ellipse(x, y, radius*random(3, 6), radius*random(3, 6));
  }
}

/*
 * cParticle.pde
 * Created by Maryam Mobini
 * November 11, 2012
 * mma99@sfu.ca
 */


class cParticle extends GenParticle {

  cParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn, yIn, vxIn, vyIn, r, ox, oy);
  }

  void regenerate() {
    if ((x > width + radius) || (x < -radius) ||
      (y > height + radius) || (y < -radius)) {
      x = width/2;
      y = height;
      vx = random(-5, 12.0);   
      vy = random(-16.0, 20.0);
    }
  }
  void display() {
    noFill();
    strokeWeight(random(1, 2));
    stroke(mouseX);
    ellipse(x, y, radius*random(3, 6), radius*random(3, 6));
  }
}



