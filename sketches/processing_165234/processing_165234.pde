
ArrayList<Particle> particles;
float x= 332;
float y = 267;
float z = 0;

float endX=332;
float endY=259;
 
void setup() {
  size(900, 510, P3D);
      background(100);
    particles = new ArrayList<Particle>();
}
 
void draw() {

  //ground
  fill(0);
  rect(0, 488, 1900, 30);
  //chimny1
  rect(0, 350, 20, 100);
  //fac1
  rect(40, 425, 110, 90);
  fill(255);
  rect(40,440,30,50);
  //fac2
  fill(0);
  triangle(150, 370, 60, 470, 180, 470);
  triangle(200, 370, 110, 470, 230, 470);
  triangle(250, 370, 160, 470, 280, 470);
  triangle(300, 370, 210, 470, 330, 470);
  //fac3
  rect(355, 445, 100, 50);
  //chimny2
  rect(330, 350, 15, 180);
  //chimny3
  rect(360, 370, 15, 150);
  //fac4
  rect(465, 425, 150, 90);
  fill(255);
  rect(450,440,30,50);
  //chimny4
  fill(0);
  rect(550, 360, 15, 110);
  //fac5
  rect(600, 440, 150, 60);
  fill(255);
  rect(600,450,60,30);
  //fac6
  fill(0);
  triangle(750,370,660,470,780,470);
  triangle(800,370,710,470,830,470);
  triangle(850,370,760,470,880,470);
  triangle(900,370,810,470,900,470);
  //chimny5
  rect(880,270,20,275);
  
    if (mousePressed == false) {
  x = lerp(x, endX, 0.01);
  y = lerp(y, endY, 0.01);
  z = lerp(z, 0,0.01);
  particles.add(new Particle(new PVector(x,y,z)));
  }
  // Looping through backwards to delete
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}
  
  
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float angle;
  float aVelocity;
  float lifespan;
  float radius = 6;
  float xl = radius*cos(PI/6);
  float yl = radius*sin(PI/6);
  float zl = radius*tan(PI/6);
  int a;
  int b;
  int c;
  
  Particle(PVector l) {
    acceleration = new PVector(random(-0.03,0.5),random(-0.1,0.1));
    velocity = new PVector(random(-1, 1), random(-2, 0));
    aVelocity = random(-1,1)*noise(random(0.05,0.03))/3;
    location = l.get();
    lifespan = 255.0;
    a = int(random(0,200));
    b = int(random(255,255));
    c = int(random(0,255));
    //C = color(a,b,c);
  }
  
  void run() {
    update();
    display();
  }
  
  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
      
    angle += aVelocity;
  }
  
  // Method to display
  void display() {
    noStroke();
    fill(a,b,c, lifespan);
    //fill(c, lifespan);
      
    rectMode(CENTER);
    pushMatrix();
      translate(location.x,location.y);
      rotate(angle);
      triangle(-xl, +yl, +xl, +yl, yl, -radius);
    popMatrix();
  }
  
  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    }
    else {
      return false;
    }
  }
}

