

ArrayList aliens;
ArrayList bullets;

boolean left = false;
boolean right = false;
boolean up = false;
boolean down = false;

boolean rotateclockwise = false;
boolean rotateanticlockwise = false;

boolean shoot = false;

boolean removebullet = false;
boolean removehealth = false;

float finalScore = -1;
float score = 0;
float hitCount = 0;

float rotatenumber = 0;
float difficulty = 0.01; 
int clickcount = 1;

PImage[] seq = new PImage[7];
PImage[] seqright = new PImage[7];

PImage bgimage;
PImage hitimage;
PImage hitpinkimage;

float bgdrawacross;
float bgdrawdown;


//Mandelbrot mb;

Warrior w;

void setup() {

  smooth();
  size(700, 700, P3D);
  bgimage = loadImage("grass.png");
  hitimage = loadImage("hit.png");
  hitpinkimage = loadImage("hitpink.png");
  
  bgdrawacross = int(width/256) + 2;
  bgdrawdown = int(height/256) + 2;
  
  
  w = new Warrior();
  aliens = new ArrayList();
  bullets = new ArrayList();
  for (int i = 0; i < 3; i++) {
    aliens.add(new Alien());
  }
  for (int i = 0; i < 3; i++) {
    bullets.add(new Bullet());
  }

  for (int i = 0; i < seq.length; i++) {
    seq[i] = loadImage("buckethead"+nf(i+1, 1)+".png");
    seqright[i] = loadImage("bucketheadright"+nf(i+1, 1)+".png");
  }
}

void draw() {
  
  rectMode(CORNER);
  
  for (int u = 0; u < bgdrawdown; u++){
    for (int i = 0; i < bgdrawacross; i++) {
      image (bgimage, i*256, u*256, 256, 256);
    }
  }

  if (right) {
    w.walk(3, 0);
  }
  if (down) {
    w.walk(0, 3);
  }
  if (left) {
    w.walk(-3, 0);
  }
  if (up) {
    w.walk(0, -3);
  }
  if (shoot) {
    clickcount += 1;

    bullets.add(new Bullet());
    Bullet bullet = (Bullet) bullets.get(bullets.size()-1);
    bullet.shoot();
  }

  int a = int((random(30)));
  
for (int i = 0; i < bullets.size(); i++) {
    Bullet bullet = (Bullet) bullets.get(i);
    bullet.update();
    bullet.display();
    removebullet = false;

    for (int u = 0; u < aliens.size(); u++) {
      Alien alien = (Alien) aliens.get(u);
      if (bullet.intersectA(alien.location.x - 9, alien.location.y - 19, 9, 38)) {
        alien.health = alien.health - 1;
        hitCount = hitCount + 1;
        
        if (alien.health < 1) {
          score = score + 1;
          aliens.remove(u);
        }
        removebullet = true;
      }
    }

    if (bullet.location.x < 0 || bullet.location.x > width || bullet.location.y < 0 || bullet.location.y > height) {
      removebullet = true;
    }
    if (removebullet) {
      bullets.remove(i);
    }
  }
  w.rotateit();
  w.display();
  
  removehealth = false;
  for (int i = 0; i < aliens.size(); i++) {
    Alien alien = (Alien) aliens.get(i);
    alien.separate(aliens);
    alien.walk();
    alien.update();
    alien.display();

    if (alien.grow > 1 && alien.intersectW(w.location.x - 12.5, w.location.y - 12.5, 25, 25)) {
      removehealth = true;
    }
    
  }
  if (removehealth) {
    w.health = w.health - 1;
    if (w.health == 0) {
      finalScore = score;
    }
  }
  
  if (finalScore >= 0) {
    textSize(40);
    text("GAME OVER", width/2, height/2);
    textSize(14);
    text("Your score is " + int(finalScore), width/2, height/2 + 40);
  }



  


 

  if (rotateanticlockwise) {
    rotatenumber = rotatenumber + 0.08;
  }
  else if (rotateclockwise) {
    rotatenumber = rotatenumber - 0.08;
  }
if (frameCount % 900 == 0) {
 difficulty += 0.002; 
}
  if (random(1) < difficulty) {
    aliens.add(new Alien());
  }
  text("Use WASD to move, left and right to rotate, and up to shoot. SCORE: " + int(score), 5, 15);
  //text("ALIENS ArrayList size: " + aliens.size() + ". BULLETS ArrayList size: " + bullets.size() + ". FRAMERATE: " + int(frameRate), 5, 30);
  //text("HITCOUNT: " + int(hitCount), 5, 45);
}

void keyPressed() {

  if (key == 'd') {
    right = true;
  } 
  else if (key == 's') {
    down = true;
  } 
  else if (key == 'w') {
    up = true;
  } 
  else if (key == 'a') {
    left = true;
  }
  else if (keyCode == LEFT) {
    rotateclockwise = true;
  }
  else if (keyCode == RIGHT) {
    rotateanticlockwise = true;
  }
  else if (keyCode == UP) {
    shoot = true;
  }
}

void keyReleased() {
  if (key == 'd') {
    right = false;
  } 
  else if (key == 's') {
    down = false;
  } 
  else if (key == 'w') {
    up = false;
  } 
  else if (key == 'a') {
    left = false;
  }
  else if (keyCode == LEFT) {
    rotateclockwise = false;
  }
  else if (keyCode == RIGHT) {
    rotateanticlockwise = false;
  }
  else if (keyCode == UP) {
    shoot = false;
  }
}

class Alien {

  PVector location;
  PVector unitVelocity;

  PVector v1;
  PVector v2;
  PVector v3;  

  //SEEK WITH TRAIL
  PVector velocity;
  PVector acceleration;
  float r;
  float r2;
  float maxforce;
  float maxspeed;

  ArrayList<PVector> history = new ArrayList<PVector>();

  float grow = 0;

  float index;
  float speed;

  float wi = 48;
  float he = 64;

  float health = 45;

  float movementVariable;

  Alien() {

    location = new PVector(random(-300, width+300), random(-300, height+300));
    unitVelocity = new PVector(0, 0);

    // SEEK WITH TRAIL
    acceleration = new PVector(0, 0);
    velocity = new PVector(0, 0);
    r = 3;
    maxspeed = 1.5;
    maxforce = 0.1;

    movementVariable = int(random(0, 2));    

    v1 = new PVector(0, 0);
    v2 = new PVector(0, 0);
    v3 = new PVector(0, 0);

    index = 0;
    speed = random(0.1, 0.7);
  }

  void display () {
    if (grow < 1) {
      grow = grow + 0.01;
    }
    //else { //HITBOX //rect(x, y, 18, 38); }

    //HEALTH
    fill(255);
    text(int(health), location.x - 9, location.y - 32);

    imageMode(CENTER);

    if (w.location.x < location.x) {
      image(seq[int(index)], location.x, location.y, wi*grow, he*grow);
      index += speed;
      // If we are at the end, go back to the beginning
      if (index >= seq.length) {
        // We could just say index = 0
        // but this is slightly more accurate
        index -= seq.length;
      }
    }
    else {
      image(seqright[int(index)], location.x, location.y, wi*grow, he*grow);
      index += speed;
      // If we are at the end, go back to the beginning
      if (index >= seqright.length) {
        // We could just say index = 0
        // but this is slightly more accurate
        index -= seqright.length;
      }
    }
    
    // Update velocity
    velocity.add(acceleration);
    
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);

    history.add(location.get());
    if (history.size() > 100) {
      history.remove(0);
    }
  }
  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }
  
  void walk() {
      PVector desired = PVector.sub(w.location, location);  // A vector pointing from the location to the target

      // Normalize desired and scale to maximum speed
      desired.normalize();
      desired.mult(maxspeed);
      
      // Steering = Desired minus velocity
      PVector steer = PVector.sub(desired, velocity);
      steer.limit(maxforce);  // Limit to maximum steering force
      applyForce(steer);
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    
    // Reset acceleration to 0 each cycle
    acceleration.mult(0);
  }

  boolean intersectW(float topleftWarriorX, float topleftWarriorY, float widthWarrior, float heightWarrior) {

    if  (!( location.x - 9 > topleftWarriorX + widthWarrior || location.x - 9 + 18 < topleftWarriorX || location.y - 19 > topleftWarriorY + heightWarrior || location.y + 19 < topleftWarriorY)) {
      imageMode(CENTER);
      image(hitpinkimage, w.location.x + random(24), w.location.y + random(24), 45, 32);
      return true;
    }

    else {
      return false;
    }
  }

  void separate (ArrayList<Alien> others) {
    float desiredseparation = 55;
    PVector sum = new PVector();
    int count = 0;
    
    // For every boid in the system, check if it's too close
    for (Alien other : others) {
      float d = PVector.dist(location, other.location);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(location, other.location);
        diff.normalize();
        diff.div(d);        // Weight by distance
        sum.add(diff);
        count++;            // Keep track of how many
      }
    }
    
    if (count > 0) {
      sum.div(count);
      // Our desired vector is the average scaled to maximum speed
      sum.normalize();
      sum.mult(maxspeed);
      
      // Implement Reynolds: Steering = Desired - Velocity
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      steer.mult(10);

      applyForce(steer);
    }
  }
}

class Bullet {

  PVector location;
  PVector velocity;

  float velocityX = 6;
  float velocityY = 0;

  float minhypforangle;

  Bullet() {
    location = new PVector(-1000, 0);
    velocity = new PVector(0, 0);
  }

  void update() {
    location.add(velocity);
  }

  void display () {
    stroke(127);
    strokeWeight(1);
    fill(255);
    rectMode(CENTER);
    rect(location.x, location.y, 8, 8);
    stroke(0);
  }

  void explode() {
  }

  boolean intersectA(float topleftAlienX, float topleftAlienY, float widthAlien, float heightAlien) {
    if  (!( location.x - 4 > topleftAlienX + 19 || location.x + 4 + widthAlien < topleftAlienX || location.y - 4 > topleftAlienY + heightAlien || location.y + 4 < topleftAlienY)) {
      imageMode(CENTER);
      image (hitimage, location.x, location.y, 30, 28);
      return true;
    } else {
      return false;
    }
  }
  void shoot() {
    location = new PVector(w.location.x, w.location.y);
    velocity = new PVector(6*cos(rotatenumber), 6*sin(rotatenumber));
  }
}

class Mandelbrot {
  //MANDELBROT
  double xmin = -2.5; 
  double ymin = -2; 
  double wh = 4;

  PImage img;
  Mandelbrot() {
    img = createImage(width, height, RGB);
  }

  void load() {

    int val1 = int(random(3, 16));
    int val2 = int(random(3, 16));
    int val3 = int(random(3, 16));

    //MANDELBROT
    img.loadPixels();

    // Maximum number of iterations for each point on the complex plane
    int maxiterations = 200;

    // x goes from xmin to xmax
    double xmax = xmin + wh;
    // y goes from ymin to ymax
    double ymax = ymin + wh;

    // Calculate amount we increment x,y for each pixel
    double dx = (xmax - xmin) / (img.width);
    double dy = (ymax - ymin) / (img.height);

    // Start y
    double y = ymin;
    for (int j = 0; j < img.height; j++) {
      // Start x
      double x = xmin;
      for (int i = 0;  i < img.width; i++) {

        // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
        double a = x;
        double b = y;
        int n = 0;
        while (n < maxiterations) {
          double aa = a * a;
          double bb = b * b;
          double twoab = 2.0 * a * b;
          a = aa - bb + x;
          b = twoab + y;
          // Infinty in our finite world is simple, let's just consider it 16
          if (aa + bb > 16.0f) {
            break;  // Bail
          }
          n++;
        }

        // We color each pixel based on how long it takes to get to infinity
        // If we never got there, let's pick the color black
        if (n == maxiterations) img.pixels[i+j*img.width] = color(0);
        else img.pixels[i+j*img.width] = color(n*val1 % 255, n*val2 %255, n*val3%255);  // Gosh, we could make fancy colors here if we wanted
        x += dx;
      }
      y += dy;
    }
    img.updatePixels();
    //END OF MANDELBROT
  }

  void display() {
    imageMode(CORNER);
    image(img, 0, 0, width, height);
  }
}

class Warrior {

  PVector location;
  float health = 450;

  Warrior() {
    location = new PVector(width/2, height/2);
  }

  void walk(float xv, float yv) {
    location.x = location.x + xv;
    location.y = location.y + yv;
  }

  void display () {
    stroke(127);
    strokeWeight(1);
    fill(255);
    ellipseMode(CENTER);
    ellipse(location.x, location.y, 25, 25);
    stroke(0);
    text(int(health), location.x - 12, location.y - 22);
  }

  void rotateit() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(rotatenumber);

    stroke(127);
    strokeWeight(1);
    ellipseMode(CENTER);
    ellipse(12.5, 0, 15, 15);
    popMatrix();
  }
}



