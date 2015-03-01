
//Day 52 #create365

NoiseField noiseField;
ArrayList<Object> objects;
int w = 20;

void setup() {
  size(640, 640);
  smooth();
  background(0);
  objects = new ArrayList<Object>();
  noiseField = new NoiseField(w);
 
}

void draw() {
  background(0);
 
   if (mousePressed) {
   objects.add(new Object(new PVector(mouseX, mouseY), new PVector(random(-1, 1), random(-1, 1))));
   }
   
   if (mouseX != pmouseX) {
   objects.add(new Object(new PVector(mouseX, 0), new PVector(0, 1)));
   objects.add(new Object(new PVector(width-mouseX, height), new PVector(0, -1)));
   objects.add(new Object(new PVector(0, mouseY), new PVector(1, 0)));
   objects.add(new Object(new PVector(width, height-mouseY), new PVector(-1, 0)));
   }
  

  for (int i = objects.size ()-1; i >=0; i--) {

    Object o = (Object) objects.get(i);
    o.update();
    o.look(noiseField);
    o.display();
    if (o.isDead()) {
      objects.remove(i);
    }
  }
}


class NoiseField {

  PVector[][] field;
  int cols, rows;
  int resolution;
  PVector xoff, yoff;
  PVector xinc, yinc;
  int k = 3;


  NoiseField(int r) {
    resolution = r;
    cols = width/resolution;
    rows = height/resolution;

    xoff = new PVector(random(k), random(k), random(k));
    yoff = new PVector(random(k), random(k), random(k));
  
    xinc = new PVector(0.001, 0.005, 0.001);
    yinc = new PVector(0.005, 0.001, 0.005);
    field = new PVector[cols][rows];
    init();
  }



  void init() {
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {

        float r = map(noise(xoff.x, yoff.x), 0, 1, 255, 0);
        float g = map(noise(xoff.y, yoff.y), 0, 1, 0, 255);
        float b = map(noise(xoff.z, yoff.z), 0, 1, 0, 255);
        field[i][j] = new PVector(r, g, b);
        fill(r, g, b);
        yoff.add(yinc);
      }
      xoff.add(xinc);
    }
  }

  PVector lookup(PVector lookup) {
    int column = int(constrain(lookup.x/resolution, 0, cols-1));
    int row = int(constrain(lookup.y/resolution, 0, rows-1));
    return field[column][row].get();
  }
}

class Object {

  PVector position, velocity, acceleration;
  float r;
  float maxspeed;
  color c;
  float lifespan = 100;

  Object(PVector pos, PVector vel) {
    position = pos.get();
    velocity = vel.get();
    acceleration = new PVector(random(-0.1, 0.1), random(-0.1, 0.1));
    r = random(50);
    maxspeed = 3;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    position.add(velocity);
    acceleration.mult(0);

    lifespan -= 0.6;
  }

  void look(NoiseField noise) {
    PVector colorVector = noise.lookup(position);
    c = color(colorVector.x, 100, colorVector.z);
  }

  void display() {
    fill(c, 100);
    noStroke();
    pushMatrix();
    translate(position.x, position.y);
    ellipse(0, 0, r, r);
    popMatrix();
  }

  boolean isDead() {
    if (position.x < 0 || position.x > width || position.y < 0 || position.y > height || lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}

void mouseClicked() {
  noiseField.init();
}

