
Introducing Plus+ Membership!
Enjoy the next level for your sketches
while supporting OpenProcessing
Bigger uploads, no ads,
custom license & private sketches
 
dashboard
my portfoliolog out
Please verify your email.
Send verification email again?
browse classrooms collectionsbooksgo plus+jobs    Gernot Rahm    
fullscreen
abgabe2b_js.pde
Flock flock;
int hi =1080/2;
int wi = 1920/3;
 
int AID=0;
float It=0;
 
void setup() {
  size(640, 540);
  frameRate(30);
  colorMode(HSB, 255);
  background(166,166,44);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 500; i++) {
    flock.addBoid(new Boid((int)random(0,wi), (int)random(0,hi)));
    AID+=1;
  }
}
 
void draw() {
  It=frameCount;
  fill(136,166,50,14);
  if (It%20==0){
    fill(166,166,44,17);
  }
  rect(0,0,wi,hi);
  flock.run();
}
 
 
class Boid {
 
  PVector loc;
  PVector velocity;
  float r;
  float ID0;
 
    Boid(float x, float y) {
    velocity = new PVector(0, 0);
    ID0=AID%250; //Boid recieves its modifier for coolor & behaviour
    float angle = random(TWO_PI);
    velocity = new PVector(cos(angle), sin(angle));
    loc = new PVector(x, y);
    r = 2.0;
  }
 
  void run(ArrayList<Boid> boids) {
    noiseDetail(2,0.5);
    float noiseVal = noise(loc.x*0.02, loc.y*0.02,It/2000);
    stroke(160,160,160);;
    float n2= noiseVal-0.46;
    // V hier ist der erste fehler V
    PVector desiredpos  =AngleCalc((sqrt(ID0)+1)*n2);
    velocity=PVector.add(desiredpos, velocity);
    velocity.normalize();
    velocity=rotate2D(velocity, 0.2*n2);
    loc = PVector.add(loc, velocity);
    borders();
    render();
  }
   
  PVector AngleCalc(float TAngle){
    PVector TVec = new PVector(cos(TAngle)/20, sin(TAngle)/20);
    return TVec;
  }
   
  PVector rotate2D(PVector v, float theta) {
    float xTemp = v.x;
    v.x = v.x*cos(theta) - v.y*sin(theta);
    v.y = xTemp*sin(theta) + v.y*cos(theta);
    return v;
  }
   
  void render() {
     
    stroke(200-ID0/4,190-ID0/4,125+ID0/2);
    pushMatrix();
    translate(loc.x, loc.y);
    point(0, 0);
    popMatrix();
  }
 
  // Wraparound
  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r;
  }
}
 
 
class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids
 
  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }
 
  void run() {
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }
 
  void addBoid(Boid b) {
    boids.add(b);
  }
 
}
