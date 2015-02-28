
/**
 * Mouse 2D. 
 * 
 * Moving the mouse changes the position and size of each box. 
 */
 
 Orb robot;
Orb gps_guess;
Orb accel_guess;
Orb khal_guess;

Coord old;
Coord older;
Coord oldest;

void setup() {
  size(600,400);
  noStroke();
  
  robot = new Orb();
  gps_guess = new Orb();
  accel_guess = new Orb();
  khal_guess = new Orb();
  old = new Coord();
  older = new Coord();
  oldest = new Coord();
  gps_guess.set_color(255,0,0);
  accel_guess.set_color(0,0,255);
  khal_guess.set_color(255,0,255);
}

void draw() 
{   
  background(0);
  
  // calculating acceleration
  
  oldest = older;
  older = old;
  old = new Coord(mouseX, mouseY);
  Coord vnew = subtract(old, older);
  Coord vold = subtract(older, oldest);
  Coord accel = subtract(vnew, vold);
  
  robot.follow();
  robot.render();
  
  Coord gps_coord = get_gps(robot.pos);
  accel = get_accel(accel);
  
  gps_guess.set_pos(gps_coord);
  gps_guess.render();
  
  accel_guess.accel(accel);
  accel_guess.update();
  accel_guess.render();
  
  // weighted average of measured position with old position + speed
  float gps_coeff = 1;
  float accel_coeff = 10;
  
  
  Coord guess = new Coord();
  guess = addc( mult(gps_coeff,gps_coord), mult(accel_coeff, addc(khal_guess.pos, accel_guess.vel)));
  guess = mult(1/(gps_coeff + accel_coeff), guess);
  
  khal_guess.set_pos(guess);
  khal_guess.render();
  
}

// adds gaussian noise to actual coordinate
Coord get_gps(Coord c) {
  float std = 50;
  return new Coord(c.x + std*random(-1,1), c.y + std*random(-1,1));
}

// adds gaussian noise to accelerometer data
Coord get_accel(Coord c) {
  float std = .020;
  return new Coord(c.x + std*random(-1,1), c.y + std*random(-1,1));
}

// utility functions for doing vector math
Coord subtract(Coord a, Coord b) {
  return new Coord(a.x - b.x, a.y - b.y);
}
Coord addc(Coord a, Coord b) {
  return new Coord(a.x + b.x, a.y + b.y);
}
Coord mult(float s, Coord c) {
  return new Coord(s*c.x, s*c.y);
}

class Coord
{
  public float x;
  public float y;
  
  public Coord() {
    this.x = 0;
    this.y = 0;
  }
  
  public Coord(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

class Orb
{
  public Coord pos;
  public Coord vel;
  
  public int draw_size;
  public int r;
  public int g;
  public int b;
  
  public Orb() {
    this.pos = new Coord();
    this.vel = new Coord();
    
    this.draw_size = 10;
    this.set_color(255,255,255);
  }
 
  public void set_color(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }

  public void set_pos(Coord p) {
    this.pos = p;
  }
  
  public void render() {
    fill(this.r, this.g, this.b);
    ellipse(this.pos.x, this.pos.y, this.draw_size, this.draw_size);
  }
  
  public void follow() {
    this.pos.x = mouseX;
    this.pos.y = mouseY;
  }
  
  public void accel(Coord c) {
    this.vel = addc(this.vel, c);
  }
  
  public void update() {
    this.pos = addc(this.pos, this.vel);
  }
}




