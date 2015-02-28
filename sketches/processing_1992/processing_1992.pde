
/* Native Processing Compatible */

/** a firework particle */
class Firework {
  public float direction = 0; //direction of head
  int x = 20; //x coordinate
  int y = 20; //y coordinate
  public float velocity = 5; //speed of movement
  public float acc = 0.03; //increase of velocity
  public float directionInc = 0.03; //increase of direction (to right)
  public float energy = 10; //energy of the particle
  public int r = 255; //red
  public int g = 180; //green
  public int b = 255; //blue
  public int ri = 0; //increase of red
  public int gi = 0; //increase of green
  public int bi = 0; //increase of blue
  /** constructs a new Firework. */
  public Firework(int x, int y, int r, int g, int b) {
    this.x = x;
    this.y = y;

    this.r = r;
    this.g = g;
    this.b = b;
  }
  /** draw this particle */
  public void display() {
    //don't draw if this particle is exhausted.
    if (this.energy < 1) {
      return;
    }
    //draw the shape
    fill(this.r, this.g, this.b); //fill with the current color
    ellipse(this.x, this.y, this.energy, this.energy);
    //calculate the new location
    this.energy *= 0.95; //decrease energy
    this.velocity += this.acc; //increase velocity by acceleration
    this.direction += this.directionInc; //increase the direction

    //check borders
    if (this.x < 0 || this.y < 0 || this.x > width || this.y > height) {
      //bounce back
      this.direction = -this.direction * 2.1;
      this.directionInc = -this.directionInc;
      this.energy *= 0.8; //bouncing costs some energy
    }

    //move forward
    this.x += this.velocity * cos(this.direction);
    this.y += this.velocity * sin(this.direction) + 5 / this.energy; //there is gravity affecting it

    //add color value by the increment of color value
    this.r = constrain(this.r + this.ri, 0, 255);
    this.g = constrain(this.g + this.gi, 0, 255);
    this.b = constrain(this.b + this.bi, 0, 255);
  }
}

/** a firework, explodes when its energy got exhausted. */
class LaunchFirework {
  public Firework f; //the firework particle
  public boolean exploded = false; //true if it is exploded
  /** constructs a new firework. */
  public LaunchFirework(int x1, int y1, int x2, int y2, int r, int g, int b) {
    f = new Firework(x1, y1, (int) random(58, 255), (int) random(58, 255), (int) random(58, 255));
    //some values are assigned randomly.
    f.ri = (int) random(-2, 2);
    f.gi = (int) random(-2, 2);
    f.bi = (int) random(-2, 2);

    f.velocity = abs((x2 - x1) + (y2 - y1)) / 15; //calculate speed
    f.direction = atan2(y2 - y1, x2 - x1); //calculate direction
    f.directionInc = random(-0.02, 0.02);
    f.energy = random(17, 23);
    this.f = f;
  }
  /** draw the firework. */
  public void display() {
    if (!this.exploded) {
      if (this.f.energy < 5) {
        //explode it
        this.exploded = true; 
        add(this.f.x, this.f.y);
      } else {
        //show that tiny spark
        this.f.display();
      }
    }
  }
}

ArrayList particles = new ArrayList(); //all firework particles
//mouse positions...
int oldX = 0;
int oldY = 0;
//make a new LaunchFirework or just Firework particle
boolean explode = true;

//creates an explosion
void add(int x, int y) {
  int r = (int) random(1, 8);
  //random amount of fireworks
  for (int i = 0; i < r; i ++) {
    int n = (int) random(6, 24);
    for (int j = 0; j < n; j ++) {
      Firework f = new Firework(x, y, (int) random(58, 255), (int) random(58, 255), (int) random(58, 255));
      //assign them randomly
      f.ri = (int) random(-5, 5);
      f.gi = (int) random(-5, 5);
      f.bi = (int) random(-5, 5);
      f.direction += j * TWO_PI / n;
      f.velocity = i;
      //add it
      particles.add(f);
    }
  }
}

//launch a new firework
void launch(int x1, int y1, int x2, int y2) {
  particles.add(new LaunchFirework(x1, y1, x2, y2, (int) random(50, 255), (int) random(50, 255), (int) random(50, 255)));
}

void mousePressed() {
  oldX = mouseX;
  oldY = mouseY;
}

//decide to launch a new firework
void mouseDragged() {
  explode = false;
}

//launch or explode now?
void mouseReleased() {
  if (explode) {
    add(oldX, oldY);
  } else {
    launch(oldX, oldY, mouseX, mouseY);
    explode = true;
  }
}

void setup() {
  size(800, 600);
  smooth();
  noStroke();
  add(width / 2, height / 2);
}

void draw() {
  background(#000000, 80); //this gives a motion blur effect
  for (int i = 0; i < particles.size(); i ++) {
    Object p = particles.get(i); //get this particle
    if (p instanceof Firework) {
      //draw the particle
      ((Firework) p).display();
      if (((Firework) p).energy < 3) {
        particles.remove(i); //remove exhausted particles
      }
    } else if (p instanceof LaunchFirework) {
      //keep launching the firework
      ((LaunchFirework) p).display();
      //remove exploded ones
      if (((LaunchFirework) p).exploded) {
        particles.remove(i);
      }
    }
  }
}


