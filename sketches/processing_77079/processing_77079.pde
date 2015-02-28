
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/77065*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//Irene Hwang 2012 

ArrayList normals = new ArrayList();
int speed_x;
Particle[] flies = new Particle[40];
//Particle[] king = new Particle[1];
Particle king;
Particle box1;
PImage fly_pic; 
PImage hand_pic;
PImage king_pic;
PImage box1_pic;
void setup() {
  size(500, 500);

  fly_pic = loadImage("Fly.png");
  hand_pic= loadImage("1.png");
  king_pic= loadImage("king.png");
  box1_pic= loadImage("box1.png");

  king = new Particle(random(width), random(height));
  king.damping = 0.003;
  king.addForce(-2, 4);
  
  box1 = new Particle(random(width), random(height));
  box1.damping = 0.003;
  box1.addForce(-2, 4);


  for (int i = 0; i<40; i++) {
    flies[i] = new Particle(random(width), random(height));
    flies[i].damping = 0.003;
    normals.add(i);
    flies[i].addForce(-2, 4);
  }
  king.display_pic = king_pic;
  box1.display_pic = box1_pic;
}

void draw() {
  //background(120,189,13);
  background(random(100), random(100), random(100), random(70));
  king.update();
  king.display();
  
  box1.update();
  box1.display();

  for (int i = 0; i<40; i++) {
    flies[i].update();
    flies[i].display();
  }
}


void mouseDragged() {
  for (int i=0; i<40; i++) {
    //    flies [i] = (Particle) normals.get(i);
    flies[i].addAttractionForce(mouseX, mouseY, 100, 10);
    king.addAttractionForce(mouseX, mouseY, 100, 10);
    box1.addAttractionForce(mouseX, mouseY, 100, 10);
  }
  stroke(3);
  fill(299);
  //ellipse(mouseX, mouseY, 200,220);
  image(hand_pic, mouseX-60, mouseY-50, 250, 270);
}


class Particle {//don't worry, I'll go over classes soon
  ///size and velocity
  PVector pos; //PVectors just hold an x, y, and z coordinate. We are only using x and y here
  PVector vel; //or speed
  PVector force; //which forces are acting on the particle this frame
  float diam = 10; //diam is short for diameter
  color p_color;

  //damping stuff
  Boolean bDamping = true;
  float damping = .01;//so the particle slows down

  //wrap screen/wall bounce
  Boolean bScreenWrappin = false;
  Boolean bWallBounce = true;
  
  PImage display_pic = new PImage();
  Particle (float _x, float _y) {//constructor
    pos = new PVector(_x, _y);
    vel = new PVector(0, 0);
    force = new PVector(0, 0);//setup the PVectors
    p_color = color(255, 255, 255);
 display_pic = fly_pic;

  };
  void update() { //runs every frame
    if (bDamping) {//if you want to slow the particle down
      addDampingForce();
    };
    vel.add(force);
    pos.add(vel);
    //
    if (bScreenWrappin) {//do you want the particles to wrap?
      wrapWalls();
    }
    if (bWallBounce) { //bounce off walls?
      bounceOffWalls();
    }
    //
    resetForce();//every frame, otherwise it would multiply
  };
  //end update
  void display() {
    //    fill(p_color);
    //    ellipse(pos.x, pos.y, diam, diam);
    image(fly_pic, pos.x, pos.y, 40, 40);
    image(king_pic, 20, 100,100,100);
    image(box1_pic, 130, 0, 170, 170);
  };
  //
  void addForce(float _x, float _y) {
    force.add(new PVector(_x, _y));//this is a shortcut
  };
  void resetForce() {
    force.set(0, 0, 0);
  }
  //
  void addDampingForce() {
    force.x = force.x - vel.x * damping;
    force.y = force.y - vel.y * damping;
  };
  //
  void wrapWalls() {
    if (pos.x > width + diam) {//wrap right to left
      pos.x = -diam;
    }
    if (pos.x < -diam) {//wrap left to right
      pos.x = width + diam;
    }
    if (pos.y < -diam) {//wrap top to bottom
      pos.y = height + diam;
    }
    if (pos.y > height + diam) {//wrap bottom to top
      pos.y = -diam;
    }
  };//end screen wrapping
  //
  void bounceOffWalls() {
    if (pos.x + diam * .5 > width) {//bounce off right wall
      pos.x = width - diam*.5;
      vel.x *= -1;
    }
    if (pos.x - diam * .5 < 0) {//bounce off left wall
      pos.x = diam*.5;
      vel.x *= -1;
    }
    //
    if (pos.y + diam * .5 > height) {//bounce off right wall
      pos.y = height - diam*.5;
      vel.y *= -1;
    }
    if (pos.y - diam * .5 < 0) {//bounce off left wall
      pos.y = diam*.5;
      vel.y *= -1;
    }
  };//end bounce off walls
  //
  void addAttractionForce(float _x, float  _y, float  _radius, float  _str) {
    // ----------- (1) make a vector of where this position is:
    PVector posOfForce = new PVector(_x, _y);
    // ----------- (2) calculate the difference & length
    PVector diff = new PVector( pos.x - posOfForce.x, pos.y - posOfForce.y);
    float leng  = diff.mag();
    // ----------- (3) check close enough
    Boolean bAmCloseEnough = true;
    if (_radius > 0) {
      if (leng > _radius) {
        bAmCloseEnough = false;
      }
    }
    // ----------- (4) if so, update force
    if (bAmCloseEnough == true) {
      float pct = 1 - (leng / _radius);  // stronger on the inside
      diff.normalize(); //sets the vector's strength to 1
      force.x = force.x - diff.x * _str * pct;
      force.y = force.y - diff.y * _str * pct;
    }
  };//end attraction
  void addRepulsionForce(float _x, float  _y, float  _radius, float  _str) {
    // ----------- (1) make a vector of where this position is:
    PVector posOfForce = new PVector(_x, _y);
    // ----------- (2) calculate the difference & length
    PVector diff = new PVector( pos.x - posOfForce.x, pos.y - posOfForce.y);
    float leng  = dist(0, 0, diff.x, diff.y);
    // ----------- (3) check close enough
    Boolean bAmCloseEnough = true;
    if (_radius > 0) {
      if (leng > _radius) {
        bAmCloseEnough = false;
      }
    }
    // ----------- (4) if so, update force
    if (bAmCloseEnough == true) {
      float pct = 1 - (leng / _radius);  // stronger on the inside
      diff.normalize(); //sets the vector's strength to 1
      force.x = force.x + diff.x * _str * pct;
      force.y = force.y + diff.y * _str * pct;
    }
  };//end Repulsion
  void setColor(int _red, int _blue, int _green) {
    p_color = color(_red, _blue, _green);
  };
};//end class


