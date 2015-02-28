
////////////////////////////////////////////////////
//                                                //
// Particle Instructions from Processing Handbook //
// by Casey Reas and Ben Fry, MIT Press           //
//                                                //
////////////////////////////////////////////////////

Particle[] s = new Particle[59];
Particle[] m = new Particle[59];
Particle[] h = new Particle[23];
int timeSec, timeMin, timeHour;
float radius;
float velX, velY;
float x,y;
int sRad = 10;
int mRad = 25;
int hRad = 67;

void setup() {
  size(600,600);
  noStroke();
  smooth();
  createParticles(s, sRad);
  createParticles(m, mRad);
  createParticles(h, hRad);
}  
void draw() {
  background(0, 26);
  timeSec = second();
  timeMin = minute();
  timeHour = hour();
  for (int i = 0; i < timeSec; i++) {
    s[i].update();
    s[i].display(); 
  }
  for (int i = 0; i < timeMin; i++) {
    m[i].update();
    m[i].display();
  }  
  for (int i = 0; i < timeHour; i++) {
    h[i].update();
    h[i].display();
  } 
}

void createParticles(Particle[] t, float r) {
  //if (t == 1) {
    for( int i = 0; i < t.length; i++) {
      makeRandom();
      t[i] = new Particle(x,y, velX, velY, r);
    }
}

void makeRandom() {
  velX = random(-2,2);
  velY = random(-2,2);
  x = random(0,width);
  y = random(0,height);
}  


