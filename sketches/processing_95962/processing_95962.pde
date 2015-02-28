
//Krystofer Kim


ArrayList particles;

void setup() {
  size(400, 400);
  particles = new ArrayList(10);
  smooth();
}

void draw() {
  // A new Particle object is added to the ArrayList every cycle through draw().
  particles.add(new Particle()); 

  background(random(0, 5));
  // Iterate through our ArrayList and get each Particle
  // The ArrayList keeps track of the total number of particles.
  for (int i = 0; i < particles.size(); i++ ) { 
    Particle p = (Particle) particles.get(i);
    p.run();
    p.gravity();
    p.display();
  }

  // If the ArrayList has more than 100 elements in it, we delete the first element, using remove().
  if (particles.size() > 100) {
    particles.remove(0);
  }
}

class Particle {
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;

  float x;
  float y;
  float xm;
  float ym;
  float xh;
  float yh;
  float xspeed;
  float yspeed;

  Particle() {
    x = cos(s) * 150 + 200;
    y = sin(s) * 150 + 200;
    xm = cos(m) * 120 + 200;
    ym = sin(m) * 120 + 200;
    xh = cos(h) * 80 + 200;
    yh = sin(h) * 80 + 200;
    xspeed = random(-2, 2);
    yspeed = random(-2, 2);
  }

  void run() {
    x = x + xspeed;
    y = y + yspeed;
    xm = xm + xspeed;
    ym = ym + yspeed;    
    xh = xh + xspeed;
    yh = yh + yspeed;
  }

  void gravity() {
    yspeed -= 0;
  }

  void display() {


    stroke(random(50, 255), random(70, 255), random(100, 255), random(0, 30));
    line(x, y, width/2, height/2);
    line(xm, ym, width/2, height/2);
    line(xh, yh, width/2, height/2);

    noStroke();      
    fill(random(255), random(255), random(255), random(0, 10));
    ellipse(x, y, 20, 20);
    ellipse(xm, ym, 20, 20);
    ellipse(xh, yh, 20, 20);
    
    if (mousePressed) {
    x = cos(s) * 150 + 200;
    y = sin(s) * 150 + 200;
    xm = cos(m) * 120 + 200;
    ym = sin(m) * 120 + 200;
    xh = cos(h) * 80 + 200;
    yh = sin(h) * 80 + 200;
    }
  }
}


