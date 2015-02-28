
// Declare the ArrayList movers.
// **Create an ArrayList that will hold Mover objects and call it movers.
// Construct the ArrayList.
// **the ArrayList movers should be a new ArrayList
ArrayList<Mover> movers = new ArrayList();



void setup() {
  size(800, 800);
}

void draw() {
  background(36, 83, 197);
  // Go through the movers ArrayList, set the contents of a 'drawer' to…
  // m and then call Mover functions on m.
  for (int i = 0; i < movers.size(); i++) {
    Mover m = movers.get(i);
    m.display();
    m.update();
    // When the mover's alpha value is 0, then remove it from the ArrayList.
    if (m.getStrokeAlpha()==0) {
      movers.remove(i);
      println("A mover object has passed on.");
    }
  }
}

void mouseReleased() {
  // WHen you click the mouse add a new mover to the array list
  movers.add(new Mover(mouseX, mouseY));
}

class Mover {
  color c;
  float alpha = 255;
  float strokeAlpha = 255;
  float xpos;
  float ypos;
  float randomPositionX;
  float randomPositionY;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector mouse;
  // Colors that the movers draw from.
  color[] palette = { color(245, 52, 52), color(250, 250, 250), color(149, 255, 63) };

  Mover(float _xpos, float _ypos) {
    // c is a random color taken from the palette array.
    c = palette[floor(random(0, palette.length))];
    xpos = _xpos;
    ypos = _ypos;
    randomPositionX = random(-150, 150);
    randomPositionY = random(-150, 150);
    location = new PVector(xpos+randomPositionX, ypos+randomPositionY);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    println(location.x);
  }

  void display() {
    ellipse(location.x, location.y, 40, 40);
    // The following code affects the stroke
    strokeWeight(2);
    stroke(c, strokeAlpha);
    // The following code affects the fill
    fill(c, alpha);
    // When alpha gets to 0, stay at 0.
    if (alpha > 0) {
      alpha-=1;
    } else {
      alpha=0;
    }
    // When strokeAlpha gets to 0, stay at 0.
    if (strokeAlpha > 0) {
      strokeAlpha-=0.5;
    } else {
      strokeAlpha=0;
    }  
  }

  float getStrokeAlpha() {
    return(strokeAlpha);
  }

  void update() {
    float topspeed = 15;

    // Create PVectors used to update the mover
    mouse = new PVector(mouseX, mouseY);
    acceleration = PVector.sub(mouse, location);
    

    // Normalize the direction before scaling (multiplying it) with .mult.
    acceleration.normalize();
    acceleration.mult(1);

    // Relate acceleration to velocity and velocity to location.
    
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }
}
