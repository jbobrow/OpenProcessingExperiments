
int numParticles = 20;


//create three arrays, one for each of the subclasses
Particle[] a = new Particle[numParticles];
Particle[] b = new Particle[numParticles];
Particle[] c = new Particle[numParticles];

void setup() {

  size(500,500);
  noStroke();
  smooth();
  //frameRate(20);
  for(int i = 0; i < a.length; i++) {
    
    //set velocity in setup alon with variables for x position, y position, sizes, and regeneration locations
    float velx = random(-3,3);
    float vely = random(-3,3);
    float radius = random(30);
    
    //determine which subclasses are drawn by each array
    a[i] = new redParticle(width/2,height/2,velx,vely,radius,width/2,height/2);
    b[i] = new greenParticle(width/2,height/2,velx,vely,radius,width/2,height/2);
    c[i] = new blueParticle(width/2,height/2,velx,vely,radius,width/2,height/2);
  }
}

void draw() {
  fill(200,36);
  rect(0,0,width,height);
  //filter(BLUR,5);
  blend(0,0,width,height,width,height,0,0,SUBTRACT);
  for(int i=0; i < a.length; i++) {

    //functions for the red particles
    a[i].update();
    a[i].display();
    a[i].regenerate();


    //functions for the green particles
    b[i].update();
    b[i].display();
    b[i].regenerate();

    //functions for the blue particles
    c[i].update();
    c[i].display();
    c[i].regenerate();
  }
}
























//creating the superclass that creates the location and variables for the particles
class Particle {
  float x,y;                            //x and y positions
  float vx,vy;                          //velocities
  float rad;                            //radius value
  float originX,originY;                //regeneration locations


  //constructor written to allow manipulation at the setup stage of the program
  Particle(float xpos, float ypos, float velx, float vely, float r, float ox, float oy) {
    x = xpos;
    y = ypos;
    vx = velx;
    vy = vely;
    rad = r;
    originX = ox;
    originY = oy;
  }


  //provides movement in the sketch by adding the velocities defined in setup to the x and y postions of the particles
  void update() {
    x += vx;
    y += vy;
  }


//main display options
  void display() {
    ellipse(x,y,rad,rad);
  }
  
//regenartion occur at each of the edges
  void regenerate() {
    if ((x > width + rad) || (x < -rad) || (y > height + rad) || (y < -rad)) {
      x = originX;
      y = originY;
      vx = random(-1.0, 1.0);
      vy = random(-1.0,1.0);
    }
  }
}





//red particle subclass
class redParticle extends Particle {

  redParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn,yIn,vxIn,vyIn,r,ox,oy);
    originX = ox;
    originY = oy;
  }

  void update() {
    x += vx;
    y += vy;
  }
//only differs in the display functions in comparison to the other two subclasses
  void display() {
    fill(100,0,0,20);
    ellipse(x,y,rad,rad);
  }
}

class greenParticle extends Particle {

  greenParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn,yIn,vxIn,vyIn,r,ox,oy);
    originX = ox;
    originY = oy;
  }

  void update() {
    x += vx;
    y += vy;
  }

  void display() {
    fill(0,100,0,20);
    ellipse(x,y,rad,rad);
  }
}

class blueParticle extends Particle {
  float originX, originY;

  blueParticle(float xIn, float yIn, float vxIn, float vyIn, float r, float ox, float oy) {
    super(xIn,yIn,vxIn,vyIn,r,ox,oy);
    originX = ox;
    originY = oy;
  }

  void update() {
    x += vx;
    y += vy;
  }

  void display() {
    fill(0,0,100,20);
    ellipse(x,y,rad,rad);
  }
}


