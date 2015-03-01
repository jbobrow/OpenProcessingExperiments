
//Nature of Code.  Daniel Shiffman.
//Ch4 particle systems
//Ch3 oscillation, waves
// implementing different approaches to making things move

/*@pjs preload="f0.png","f1.png","f2.png","f3.png","f4.png";*/

Waterfall cascade;
Wave wave;
Fish fish;
Grass seaGrass;

void setup() {
  size(800, 350);
  cascade  = new Waterfall();
  wave = new Wave(new PVector(0, 280), width+10, 5, 200);
  fish = new Fish();
  seaGrass = new Grass();
}


void draw() {
  frameRate(10);
  fill(204, 160);
  rect(0, 0, width, height);
  cascade.flow();
  wave.motion();
  fish.swim();
  seaGrass.display();
   
}

// 'salmon' graphic from Ari Feldman's SpriteLib. 
 class Fish {
  PImage f1, f2, f3, f4, f5;
  int numFrames, frameNum, previousTime;
  PImage[] img ;
  float xPos;

  Fish() {
    xPos = width +200;
    numFrames = 5;
    img = new PImage[numFrames];
    for (int i = 0; i < numFrames; i++) {
      String imgName = "f"  + i + ".png";
      img[i] = loadImage(imgName);
    }
  }

  void swim() {
    // doesn't do anything if frameRate() is 10
    if ((millis() - previousTime) > 100) {
      frameNum = (frameNum + 1) % numFrames;
      previousTime = millis();
    }
    image(img[frameNum], xPos, height - 100, 30, 30);
    xPos = xPos - 3;
    if (xPos < -30) xPos = width +200;
  }
}

class Grass {
  Blade[]  lawn;
  int numBlades;
  float gap;

  Grass () {
    gap = -10;
    numBlades = 81;
    lawn = new Blade[numBlades];
    for (int i = 0; i < numBlades; i++) {
      lawn[i] = new Blade(gap, height+10, random(30, 90), random(0, TWO_PI));
      gap += 10;
    }
  }

  void display() {
    for (Blade  b : lawn) {
      b.display();
    }
  }
}


class Blade {
  float incr, amp, ang, xPos, yPos, hght, move, stagger, xBend;

  Blade(float x, float y, float  h, float s) {
    xPos = x;
    yPos = y; 
    hght = h; 
    stagger = s;
    incr = 0.05;
    amp = h/5;
    xBend = h/2;
  }

  void display() {
    ang += incr;
    move = amp * (sin(ang + stagger));

    stroke(#335A2F);
    strokeWeight(1);
    fill(#228B36);

    bezier(xPos, yPos, 
    xPos, yPos - hght/4, 
    xPos, yPos - hght/2, 
    xBend + xPos + move, yPos - hght);

    noFill();
    stroke(#CBC61D);

    bezier(xPos, yPos, 
    xPos +xBend/5, yPos - hght/4, 
    xPos +xBend/5, yPos - hght/2, 
    xBend + xPos + move, yPos - hght);
  }
}

class Waterfall {
  ArrayList<Particle> particles;
  PVector pos;
  float ang, amp, incr, move, yPos, xPos;

  Waterfall() {
    incr = .05;
    amp = 10;
    pos = new PVector();
    particles = new ArrayList<Particle>();
  }

  void flow() {
    ang += incr;
    move = amp * (sin(ang));
    pos.set (5, 20 + move);
    
    drawBoat(pos);
    
    for (int j = 0; j < 10; j++) {
      particles.add(new Particle(pos));
    }
    for (int i = particles.size ()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
// source point for water flow
  void drawBoat(PVector p ) {
    xPos =  p.x;
    yPos = p.y;
    
    stroke(0);
    fill(255,0,0);
    ellipse(xPos -15, yPos +180, 40, 200);
    
    fill(255);
    rect(xPos-15, yPos+8, 20, 170);
    rect(xPos-15, yPos-40, 20, 25);
    
    stroke(#F7F00C);
    fill(100);
    rect(xPos-15, yPos-9, 20, 14);
    ellipse(xPos +5, yPos-2, 10, 15);
  }
}



class Particle {
  PVector accel, vel, pos, gravity;
  float rad, lifespan, randNum;

  Particle(PVector p) {
    pos = p.get();
    accel = new PVector(0, 0);
    vel = new PVector(random(4, 7), random(-.5, .5));
    gravity = new PVector(0, 1);
    rad = random (1, 4);
    lifespan = 255;
  }

  void applyForce(PVector f) {
    accel.add(f);
  }

  void update() {
    applyForce(gravity);
    vel.add(accel);
    pos.add(vel);
    accel.mult(0);
    lifespan -= 2.1;
  }

  void display() {
    fill(255);
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, rad, rad);
    fill(#19F4FA, lifespan);
    stroke(0, lifespan);
    strokeWeight(0.3);
    ellipseMode(CORNER);
    ellipse(pos.x-1, pos.y-1, rad+1, rad+1);
  }

  void boundsCheck() {
    if (pos.x > width) {
      pos.set(-10, -2);
      vel.set(random(4, 7), random(-.5, .5));
      lifespan = -1;
    } else if (pos.x > 190 && pos.y > height-150-rad ) {
      pos.y = height-random(130, 170)-rad;
      vel.y = vel.y * -random(.7, .9);
    } else if (pos.x < 190 && pos.y > height-80-rad) {
      randNum = int(random(10));
      pos.y = height-random(40, 150)-rad;
      vel.y = vel.y * -random(.7, .9);
    }
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  void run() {
    update();
    boundsCheck();
    display();
  }
}

class Wave {
  int xspacing = 8;
  int w;            

  PVector origin;         
  float theta = 0.0;      
  float amplitude;      
  float period;            
  float dx;                
  float[] yvalues;         

  Wave(PVector o, int w_, float a, float p) {
    origin = o.get();
    w = w_;
    period = p;
    amplitude = a;
    dx = (TWO_PI / period) * xspacing;
    yvalues = new float[w/xspacing];
  }


  void calculate() {
    theta += 0.2;
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = sin(x)*amplitude;
      x+=dx;
    }
  }

  void display() {
    // tether
    noFill();
    strokeWeight(2);
    stroke(#FF0D0D);
    bezier(origin.x+5*xspacing, origin.y+yvalues[5]-70, 
    50, origin.y+yvalues[5]-40, 
    50, 340, 
    200, height +1 );
    // buoy
    fill(#FA7E0A);
    ellipseMode(CENTER);
    stroke(0);
    strokeWeight(.5);
    ellipse(origin.x+5*xspacing, origin.y+yvalues[5]-75, 48, 48);
    // wave
    for (int x = 0; x < yvalues.length; x++) {
      noStroke();
      fill(#1EA9B9, 14);
      ellipse(origin.x+x*xspacing, origin.y+yvalues[x], 150, 150);
    }
  }

  void motion() {
    calculate();
    display();
  }
}



