
// canvas colour
int background_color = color(70, 70, 70);
// particle colours
color[] colors = {
      color (227, 211, 31), // yellow
      color (227, 31, 123), // pink
      color (31, 188, 227) // blue
    };
// colour of the stroke around the particles
color stroke_color = color(0, 70); // black, 70% alpha

// should the mouse draw particles when moved?
Boolean INTERACTIVE = true;
// should the canvas be cleared on each particle iteration
Boolean CLEAR = false;




//-----------------------------------------------------------------//
//-----------------------------------------------------------------//
//-----------------------------------------------------------------//
//-----------------------------------------------------------------//
ArrayList particles;


// reset on mouse click
void mouseClicked () {
  setup();
  mouseMoved();
}


// save on press spacebar
void keyPressed () {
  if (keyCode == RETURN || keyCode == ENTER) {
    save("Colourful entrails " + year() + "-" + month() + "-" + day() + " " + hour() + ":" + minute() + ":" + second() + ".png");
  }
}

// add particles on mouse move
void mouseMoved () {
  if (!INTERACTIVE) return;
  int count = int(random(2, 5)); 
  while(count-- > 0) {
    addParticle(new PVector(mouseX, mouseY));
  }
}


void setup() {
  size(800, 400, P2D);
  blendMode(ADD);
  stroke(stroke_color);  
  background(background_color);
  

  particles = new ArrayList();

  // create a particle which'll go around making particles if it's not interactive  
  if (!INTERACTIVE) {
    Particle generator = new Particle(new PVector(width/2, height/2));
    generator.size = 10000;
    while(generator.isAlive()) {
      int count = int(random(2,5));
      generator.update();
      while (count-- > 0) {
        addParticle(generator.position);
      }
    }
  }
}

// add a new particle to the particles arraylist with specified position
void addParticle (PVector position) {
  // clone the vector 
  PVector position_clone = new PVector(position.x, position.y);
  particles.add(new Particle(position_clone));
}


void draw() {
  // keep track of dead particles - they'll be removed after the loop
  ArrayList dead = new ArrayList();

  if (CLEAR) {
    fill(background_color);
    rect(0, 0, width, height);
  }
  
  // go through each of the particles and update/draw
  ListIterator it = particles.listIterator();
  while (it.hasNext()) {
    Particle particle = (Particle) it.next();
    // only draw if it's alive
    if (particle.isAlive()) {
      particle.update();
      particle.draw();
    } else { // otherwise add to dead list
      dead.add(particle);
    }
  }
  // remove all dead particles
  particles.removeAll(dead);
}

// a tad messy, building it up as i go along
class Particle 
{
  PVector position;
  PVector velocity;
  PVector force;
  float size;
  color c;
  int life;
  
  Particle (PVector p) {
    life = 0;
    position = p;
    size = random(30, 50);
    velocity = new PVector(random(2, 5), 0);
    rotate2D(velocity, random(0, TWO_PI));
    c = colors[int(random(colors.length))];
    force = new PVector(0, 1);
  }
  
  void update () {
    life++;
    if (life == 20) {
      velocity.mult(1.1);
    }
    if (life < 20) {
      size *= 0.99;
    } else {
      size *= 0.95;
    }

    position.add(velocity);
    velocity.rotate(random(-QUARTER_PI, QUARTER_PI));
  }
  void draw () {
    fill (c);
    ellipse(position.x, position.y, size, size);
  }
  Boolean isAlive() {
    return size >= 1;
  }
}


void rotate2D(PVector v, float theta) {
  float xTemp = v.x;
  v.x = v.x*cos(theta) - v.y*sin(theta);
  v.y = xTemp*sin(theta) + v.y*cos(theta);
}


