
World world;
PointMass sun1, sun2;

PImage imgs[] = new PImage[7];

void setup() {
  size(800, 800);
  world = new World(this);
  sun1 = new PointMass(100, new PVector(2*width/5, 2*height/5));
  world.add(sun1);
  sun2 = new PointMass(100, new PVector(3*width/5, 3*height/5));
  world.add(sun2);

  for (int i=0;i<imgs.length;i++) {
    imgs[i] = loadImage(i+".png");
  }
}

void draw() {
  world.move();
  world.draw();

  // color trails
  fill(255, 255, 255, 20);
  rect(0, 0, width, height);
}


float prvMouseX, prvMouseY;

boolean aiming = false;

void mousePressed() {
  aiming = true;
  prvMouseX = mouseX;
  prvMouseY = mouseY;
}

void mouseReleased() {
  //if (random(1) < 0.5)
  //  world.add(new Ball(random(50), new PVector(mouseX, mouseY), new PVector((mouseX-prvMouseX)/10, (mouseY-prvMouseY)/10) ) );
  //else
  world.add(new PicturePlanet(imgs[round(random(imgs.length-1))], random(50), new PVector(mouseX, mouseY), new PVector((mouseX-prvMouseX)/10, (mouseY-prvMouseY)/10) ) );
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == DOWN) {
      translate(width/4, height/4);
      scale(0.5);
    } 
    else if(keyCode == UP) {
      scale(2);
      translate(-width/4, -height/4);
    }
  }
}

class Ball extends Mass {
  color c;
  float w=20, h=20;

  Ball(float mass) {
    super(mass);
    buildBall();
  }

  Ball(float mass, PVector position) {
    super(mass, position);
    buildBall();
  }
  Ball(float mass, PVector position, PVector velocity) {
    super(mass, position, velocity, new PVector(0,0));
    buildBall();
  }

  void buildBall() {
    c = color(round(random(255)), round(random(255)), round(random(255)));
    w = log(mass)*10+random(-0.5, 0.5);
    h = log(mass)*10+random(-0.5, 0.5);
  }

  void draw() {
    pushStyle();
    fill(c);
    stroke(c);
    ellipse(position.x, position.y, w, h);
    popStyle();
  }
}

class Mass {
  PVector position, velocity, accel;
  float mass;
  
  Mass(float mass, PVector position, PVector velocity, PVector accel) {
    this.mass = mass;
    this.position = position.get();
    this.velocity = velocity.get();
    this.accel = accel.get();
  }
  
  Mass(float mass, PVector position) {
    this(
      mass, 
      position, 
      new PVector(0, 0),
      new PVector(0, 0)
      );
  }
  
  Mass(float mass) {
    this(
      mass, 
      new PVector(random(width), random(height)), 
      new PVector(0, 0),
      new PVector(0, 0)
      );
  }
  
  void move() {
    velocity.add(accel);
    position.add(velocity);
  }
  
  void draw() { }
  
  void applyForce(PVector force) {
    PVector myForce = accel.get();  // m^2
    myForce.mult(mass);             // kg * m^2    aka newtons
    myForce.add(force);             // newtons
    myForce.div(mass);              // m^2
    velocity.add(myForce);          // done
  }
}
class PicturePlanet extends Mass {
  PImage img;
  PicturePlanet(PImage img, float mass, PVector position, PVector velocity) {
    super(mass, position, velocity, new PVector(0,0));
    this.img = img;
  }
  void draw() {
    image(img, position.x, position.y);
  }
}
class PointMass extends Mass {

  PointMass(float mass, PVector position) {
    super(mass, position);
  }

  void move() {
  }

  void draw() {
    pushStyle();
    fill(0);
    strokeWeight(5);
    stroke(255, 0, 0);
    ellipse(position.x, position.y, 12, 12); 
    popStyle();
  }
}

class World { 
  ArrayList<Mass> stuff;
  PApplet parent;

  static final float g = 0.98;
  static final float G = 2;
  boolean gravity = true;
  boolean bounded = false;

  World(PApplet parent) {
    this.parent = parent;
    stuff = new ArrayList();
  }
  void add(Mass m) {
    stuff.add(m);
  }
  Mass get(int i) {
    return stuff.get(i);
  }

  void move() {
    for (Mass u : stuff) {
      if (gravity) {
        for (Mass k : stuff) {
          if (u == k) continue;
          float dist = u.position.dist(k.position);
          PVector force = new PVector(u.position.x-k.position.x, u.position.y-k.position.y);
          force.mult( (u.mass*k.mass)/sq(dist) );
          force.mult(G);
          k.applyForce(force);
        }
      }

      if (bounded) {
        if (u.position.x <= 0 || u.position.x >= width) u.velocity.x *= -1;
        if (u.position.y <= 0 || u.position.y >= height) u.velocity.y *= -1;
      }
      u.move();
    }
  }

  void draw() {
    for (Mass u : stuff) {
      u.draw();
    }
  }
};



