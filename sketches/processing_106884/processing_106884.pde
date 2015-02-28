
float x, y;
float r, z, R, G, B;

// Angle and angular velocity, accleration
float theta;
float theta_vel;
float theta_acc;

void setup() {
  size(800, 800);
  background(0);
  x = random(600);
  y = random(300);
  background(30, 30);
  frameRate(1000);
    
  // Initialize all values
  r = height * 0.5;
  theta = 0;
  theta_vel = -5;
  theta_acc = random(0.0001);
  R=0;
  G=random(255);
  B=random(125);
}

void draw() {

//COLORS RGB
  R++;
  G--;
  B++;
  if (R>170) {
    R=0;
    R--;
  }
  if  (G<100) {
    G-=R;
    G++;
  }
  if (B>250) {
    B-=G;
    B--;
  }
  
  z++;
  if (z>mouseX) {
    z=0;
  }

  r--;
  if (r<-400) {
    r++;
  }

  
  // Convert polar to cartesian
  float x = mouseX * cos(theta);
  float y = mouseY * sin(theta);
  
   // Translate the origin point to the center of the screen 
    translate(width/2, height/2);
  
  // Draw the ellipse at the cartesian coordinate
  ellipseMode(CENTER);
  stroke(random(255),R, G, B);
  noFill();
  ellipse(x, y, 32+-z, 32+-z);
  
  // Apply acceleration and velocity to angle (r remains static in this example)
  theta_vel += theta_acc*r;
  theta += theta_vel*z;
  y--;
  if (y<400) {
    y=400;
  }

  x++;
  if (x>800) {
    x = 0;
  }
  stroke(255-random(100));
  point(random(800-x), random(600-x));
  point(random(x), random(random(800)));
  point(random(800), random(800));
  stroke(random(200), 40, 60+random(70));
  point(x+100, random(300)*2);
  point(random(600-y), random(1000-x));
  point(random(x), random(y));
  point(x+200, random(600)*2);
  noFill();
  stroke(random(100));
  point(-100+random(200),-100+random(200));
  rect(-100+random(200),-100+random(200),-100+random(200),-100+random(200));
  stroke(B, G, -y, x/3);
  point(-300+random(600),-300+random(600));
  stroke(30, random(30)+50, x/3);
  rect(-300+random(600),-300+random(800), -300+random(600),-300+random(600));
  point(-300+random(600),-300+random(800));
  stroke(R, random(G));
  point(-200+random(800),-200+random(800));
  stroke(-y, random(255), R, 70);
  point(-200+random(800),-200+random(800));
  noStroke();
  fill(30+random(50), 20+random(20));
  stroke(100+random(155));
  point(100-random(200), 100-random(200));
  
}
