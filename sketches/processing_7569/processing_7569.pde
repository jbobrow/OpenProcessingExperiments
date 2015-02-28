
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/7569*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */

// by Asher Salomon 2/11/10

int predictions = 300;
float dt;

PVector[] flyingStuff;
PVector[] previousStuff;
int nextStuff = 0;

void setup() {
  size(500, 400);
  setup_planets();
  PVector Xo = new PVector(bodies[3].X[predictions].x
                   + (363104.0+405696.0)/2*1000/mPerAU,
                   bodies[3].X[predictions].y);
  PVector Vo = new PVector(bodies[3].V[predictions].x,
                   bodies[3].V[predictions].y
                   + 1022.0/mPerAU*sPerDay);
  Rocket = new SpaceShip(Xo, Vo);
  ellipseMode(CENTER);
  noStroke();
  smooth();
  PicsPerAU = width / (2 * pow(10, 9)) * mPerAU;
  max_zoom = width / (1 * pow(10, 8)) * mPerAU;
  min_zoom = width / (1.1 * pow(10, 13)) * mPerAU;
  dt = 0.01; // day
  fontA = loadFont("ArialMT-10.vlw");
  fontB = loadFont("Arial-BoldMT-12.vlw");
  flyingStuff = new PVector[500];
  previousStuff = new PVector[flyingStuff.length];
  for (int i=0; i<flyingStuff.length; i++) {
    flyingStuff[i] = new PVector(
                      random(0,width),random(0,height));
    previousStuff[i] = new PVector(
                flyingStuff[i].x,flyingStuff[i].y);
    flyingStuff[i].x -= width/2;
    flyingStuff[i].y -= height/2;
    flyingStuff[i].x /= PicsPerAU;
    flyingStuff[i].y /= PicsPerAU;
    flyingStuff[i] = PVector.add(flyingStuff[i], camCenter);
  }
}

int camCpl = 3;
PVector camCenter = new PVector();
float PicsPerAU;

PFont fontA;
PFont fontB;

int buff = 0;
void draw() {
  if (paused) {
    fill(0);
    noStroke();
    rect(0, 0, 150, 50);
    textFont(fontA, 10);
    fill(255);
    text("Game paused.\nPress 'P' to start.", 10, 20);
  } else {
      
    if (buff < predictions) {
      buff++;
      IncrimentTime();
      AstroPhysicsLoop();
      background(0);
      textFont(fontA, 10);
      fill(255);
      text("Game starts in " + (predictions-buff)/60
           + " seconds...\n       It's worth waiting.", 10, 20);
    } else if (buff == predictions) {
      buff++;
//      displayHelp();
    } else {
      Rocket.theta = atan2(mouseY-height/2,mouseX-width/2);
      Rocket.turnW = 0;
      if(mousePressed&&mouseButton==RIGHT){
        zooming = pow(zoomSpeed,1-2*float(mouseY)/height);
        zoomDamp = false;
      }
      zoom();
      thrustF = 30.0*mag(float(mouseX-width/2),
        float(mouseY-height/2))/(height/2)/PicsPerAU;
      Rocket.update_FVX();
      camCenter = Rocket.X;
      background(0);
      IncrimentTime();
      AstroPhysicsLoop();
      for (int i=0; i<flyingStuff.length; i++) {
        PVector dX = new PVector();
        dX = PVector.sub(flyingStuff[i], camCenter);
        dX.x *= PicsPerAU;
        dX.y *= PicsPerAU;
        dX.x += width/2;
        dX.y += height/2;
        stroke(50);
        strokeWeight(1);
        line(dX.x,dX.y,previousStuff[i].x,previousStuff[i].y);
        previousStuff[i] = new PVector(dX.x,dX.y);
      }
      for (int i=0; i<50; i++) {
        flyingStuff[nextStuff] = new PVector(
                          random(0,width),random(0,height));
        previousStuff[nextStuff] = new PVector(
             flyingStuff[nextStuff].x,flyingStuff[nextStuff].y);
        flyingStuff[nextStuff].x -= width/2;
        flyingStuff[nextStuff].y -= height/2;
        flyingStuff[nextStuff].x /= PicsPerAU;
        flyingStuff[nextStuff].y /= PicsPerAU;
        flyingStuff[nextStuff] = PVector.add(
                          flyingStuff[nextStuff], camCenter);
        nextStuff++;
        if(nextStuff>=flyingStuff.length){nextStuff=0;}
      }
      float closest = 3.40282347E+38;
      for (int i=0; i<=numPL; i++) {
        PVector dX = new PVector();
        dX = PVector.sub(bodies[i].X[0], camCenter);
        if(dX.mag()/bodies[i].rad<closest){
          closest = dX.mag()/bodies[i].rad;
          camCpl = i;
        }
        dX.x *= PicsPerAU;
        dX.y *= PicsPerAU;
        dX.x += width/2;
        dX.y += height/2;
        float radius = bodies[i].rad * PicsPerAU;
        
        if (radius >= 1) {
          noStroke();
          fill(bodies[i].clr);
          ellipse(dX.x, dX.y, 2*radius, 2*radius);
        } else {
          set(int(dX.x), int(dX.y), bodies[i].clr);
        }
        
        textFont(fontA, 10);
        fill(255);
        text(bodies[i].name, dX.x + 5 + radius, dX.y + 5);
        
      }
    
      Rocket.drawShip();
      draw_path(Rocket.X, Rocket.V);
      textFont(fontA, 10);
      fill(255);
      text(bodies[camCpl].name + " Selected", 10, 20);
      
    }
    
  }
}

float zoomSpeed = 1.02;
float zooming = 1;
boolean zoomDamp = true;

float max_zoom;
float min_zoom;

void zoom() {
  PicsPerAU *= zooming;
  if(zoomDamp){zooming = 1.0 + 0.9 * (zooming - 1);}
  if (PicsPerAU > max_zoom) {
    PicsPerAU = max_zoom;
  }
  if (PicsPerAU < min_zoom) {
    PicsPerAU = min_zoom;
  }
}

boolean paused = false;
void keyPressed() {
  if (key == '=') {
    zooming = 1 / zoomSpeed;
    zoomDamp = false;
  }
  if (key == '-') {
    zooming = zoomSpeed;
    zoomDamp = false;
  }
//  if (key == ']') {
//    camCpl += 1;
//    if (camCpl > numPL) {camCpl = 0;}
//  }
//  if (key == '[') {
//    camCpl -= 1;
//    if (camCpl < 0) {camCpl = numPL;}
//  }
  if ((key == 'p')||(key == ' ')) {
    if (paused) {
      paused=false;
    } else {
      paused=true;
    }
  }
  if ((key == '/')||(key == '?')) {
    displayHelp();
  }  
//  if (keyCode == UP){Rocket.thrust=true;}
//  if (keyCode == DOWN){Rocket.Rthrust=true;}
//  if (keyCode == RIGHT){Rocket.turnR=true;}
//  if (keyCode == LEFT){Rocket.turnL=true;}
}
void keyReleased() {
  if ((key == '-')||(key == '=')) {
    zoomDamp = true;
  }
//  if (keyCode == UP){Rocket.thrust=false;}
//  if (keyCode == DOWN){Rocket.Rthrust=false;}
//  if (keyCode == RIGHT){Rocket.turnR=false;}
//  if (keyCode == LEFT){Rocket.turnL=false;}
}

void displayHelp() {
  paused=true;
  textFont(fontB, 12);
  fill(255);
  text(  "        ~~ Controls ~~\n"
//       + "Arrow Keys := Turn & Burn Thrusters\n"
//       + "             -   =   := Zoom In & Out\n"
//       + "             [   ]  := View Trajectory Relative to the\n"
//       + "                          Selected Planets Coordinates\n"
       + "               P     := Pause\n"
       + "\n"
       + "       ~~ Objectives: ~~\n"
       + "[1] Orbit the Moon\n"
       + "[2] Orbit Mars\n"
       + "[3] Orbit the Moons of Jupiter\n"
       + "    [a] Callisto\n"
       + "    [b] Ganymede\n"
       + "    [c] Europa\n"
        , 20, 100);
}
float thrustF;
void mousePressed(){
  if(mouseButton==LEFT){
    Rocket.thrust=true;
  }
}
void mouseReleased(){
  Rocket.thrust=false;
  zoomDamp = true;
}

// all data courtesy of Wikipedia.org

int numPL = 13;
planet[] bodies;

class planet {
  String name;
  float rad;
  float mass;
  color clr;
  
  PVector[] X = new PVector[predictions+1];
  PVector F;
  PVector[] V = new PVector[predictions+1];
  
  // used to initialize a planet
  planet(String name0, float rado, float masso, color clro, 
         float orbit, float speed, float phase) {
        
    name = name0;
    rad = rado / mPerAU;
    mass = masso / kgPerE;
    clr = clro;
    
    for (int i=0; i<predictions; i++) {
      X[i] = new PVector();
      V[i] = new PVector();
    }
    X[predictions] = new PVector(cos(phase)*orbit/mPerAU,
                    sin(phase)*orbit/mPerAU);
    F = new PVector();
    V[predictions] = new PVector(-sin(phase)*speed
                    /mPerAU*sPerDay,
                    cos(phase)*speed
                    /mPerAU*sPerDay);
  }
  
  // used to initialize a moon
  planet(String nameo, float rado, float masso, color clro, 
         float orbit, float speed, float phase, planet parent) {
    name = nameo;
    rad = rado / mPerAU;
    mass = masso / kgPerE;
    clr = clro;
    
    for (int i=0; i<predictions; i++) {
      X[i] = new PVector();
      V[i] = new PVector();
    }
    X[predictions] = new PVector(parent.X[predictions].x
                    + cos(phase)*orbit/mPerAU,
                    parent.X[predictions].y
                    + sin(phase)*orbit/mPerAU);
    F = new PVector();
    V[predictions] = new PVector(parent.V[predictions].x
                    - sin(phase)*speed
                    /mPerAU*sPerDay,
                    parent.V[predictions].y + cos(phase)*speed
                    /mPerAU*sPerDay);
  }
  
  void update_VX() {
    V[predictions].add(PVector.mult(F, dt/mass));
    F.x = 0;
    F.y = 0;
    X[predictions].add(PVector.mult(V[predictions], dt));
  }
}

void setup_planets() {
  bodies = new planet[numPL + 1];
  bodies[0] = new planet("Sun",
                         6.955 * pow(10, 8), // radius m
                         1.9891 * pow(10, 30), // mass kg
                         #FFFF6A, // color
                         0.0, // orbit m
                         0.0, // speed m/s
                         0.0); // phase radians
  bodies[1] = new planet("Mercury",
                         2439700.0,
                         3.3022 * pow(10, 23),
                         #F0D98F,
                         (69816900.0+46001200.0)/2*1000,
                         47870.0,
                         0.0);
  bodies[2] = new planet("Venus",
                         6051800.0,
                         4.8685 * pow(10, 24),
                         #F2E4B5,
                         (108942109.0+107476259.0)/2*1000,
                         35020.0,
                         PI);
  bodies[3] = new planet("Earth",
                         6371000.0,
                         5.9736 * pow(10, 24),
                         #6977E8,
                         (152097701.0+147098074.0)/2*1000,
                         29783.0,
                         PI/2);
  bodies[4] = new planet("Moon",
                         1737100.0,
                         7.3477 * pow(10, 22),
                         #B1B8BC,
                         (363104.0+405696.0)/2*1000,
                         1022.0,
                         PI,
                         bodies[3]); // parent planet of the moon
  bodies[5] = new planet("Mars",
                         3396200.0,
                         6.4185 * pow(10, 23),
                         #E8AB31,
                         (249209300.0+206669000.0)/2*1000,
                         24077.0,
                         PI*3/2);
  bodies[6] = new planet("Jupiter",
                         71492000.0,
                         1.8986 * pow(10, 27),
                         #E0A971,
                         (816520800.0+740573600.0)/2*1000,
                         13070.0,
                         PI/3);
  bodies[7] = new planet("Callisto",
                         4821.0/2*1000,
                         10.8 * pow(10, 22),
                         #6F6153,
                         1882709000.0,
                         8204.0,
                         PI*5/3,
                         bodies[6]);
  bodies[8] = new planet("Ganymede",
                         5262.0/2*1000,
                         14.8 * pow(10, 22),
                         #B2AFAC,
                         1070412000.0,
                         10880.0,
                         PI*4/3,
                         bodies[6]);
  bodies[9] = new planet("Europa",
                         3122.0/2*1000,
                         4.8 * pow(10, 22),
                         #C6B29E,
                         671034000.0,
                         13740.0,
                         PI*2/3,
                         bodies[6]);
  bodies[10] = new planet("Io",
                         3643.0/2*1000,
                         8.9 * pow(10, 22),
                         #FA9D23,
                         421700000.0,
                         17334.0,
                         PI/3,
                         bodies[6]);
  bodies[11] = new planet("Saturn",
                         60268000.0,
                         5.6846 * pow(10, 26),
                         #B2A97E,
                         (1513325783.0+1353572956.0)/2*1000,
                         9690.0,
                         PI*4/3);
                                                                          
  bodies[12] = new planet("Uranus",
                         25559000.0,
                         8.6810 * pow(10, 25),
                         #A6E5E8,
                         (3004419704.0+2748938461.0)/2*1000,
                         6810.0,
                         PI*2/3);
  bodies[13] = new planet("Neptune",
                         24764000.0,
                         1.0243 * pow(10, 26),
                         #76A2EA,
                         (4553946490.0+4452940833.0)/2*1000,
                         5430.0,
                         0.0);
}

float mPerAU = 149.60 * pow(10, 9); // m/AU
float kgPerE = 5.9736 * pow(10, 24); // kg/earth
float sPerDay = 60.0 * 60.0 * 24.0; // s/day
float gravConst = 6.673 * pow(10, -11) // m^3 kg^-1 s^-2
                  / (pow(mPerAU, 3)
                  * pow(kgPerE, -1)
                  * pow(sPerDay, -2)) ;
                  
void AstroPhysicsLoop() {
  for (int i=1; i<=numPL; i++) {
    for (int j=0; j<i; j++) {
      PVector dX = PVector.sub(bodies[j].X[predictions],
                               bodies[i].X[predictions]);
      float Fmag = gravConst * bodies[j].mass * bodies[i].mass
                                     / pow(dX.mag(), 2);
      dX.normalize();
      bodies[i].F.x += Fmag * dX.x;
      bodies[i].F.y += Fmag * dX.y;
      bodies[j].F.x -= Fmag * dX.x;
      bodies[j].F.y -= Fmag * dX.y;
    }
  }
  for (int i=0; i<=numPL; i++) {
    bodies[i].update_VX();
  }
}

void IncrimentTime() {
  for (int i=0; i<=numPL; i++) {
    for (int j=0; j<predictions; j++) {
      bodies[i].X[j].x = bodies[i].X[j+1].x;
      bodies[i].X[j].y = bodies[i].X[j+1].y;
      bodies[i].V[j].x = bodies[i].V[j+1].x;
      bodies[i].V[j].y = bodies[i].V[j+1].y;
    }
  }
}
SpaceShip Rocket;
int numJetParticles = 25;

class SpaceShip {
  float theta;
  float turnW;
  boolean thrust;
  boolean Rthrust;
  boolean turnR;
  boolean turnL;
  PVector X;
  PVector F;
  PVector V;
  jetParticle[] Jet;
  SpaceShip(PVector Xo, PVector Vo) {
    Jet = new jetParticle[numJetParticles+1];
    for (int i=0; i<=numJetParticles; i++) {
      Jet[i] = new jetParticle();
    }
    X = Xo;
    F = new PVector();
    V = Vo;
    
  }
  void update_FVX() {
    for (int j=0; j<=numPL; j++) {
      PVector dX = PVector.sub(bodies[j].X[0], X);
      float Fmag = gravConst * bodies[j].mass // NOTE: no mass
                       / pow(dX.mag(), 2);
      dX.normalize();
      F.x += Fmag * dX.x;
      F.y += Fmag * dX.y;
    }
    if (thrust) {
      F.x += thrustF * cos(theta);
      F.y += thrustF * sin(theta);
    }
    if (Rthrust) {
      F.x -= 0.5 * thrustF * cos(theta);
      F.y -= 0.5 * thrustF * sin(theta);
    }
    float turnF = 0.004;
    if (turnR) {
      turnW += turnF;
    }
    if (turnL) {
      turnW -= turnF;
    }
    V.add(PVector.mult(F, dt)); // NOTE: no mass
    float c = 299792458.0 / mPerAU * sPerDay; // m/s
    if (V.mag() > c/2) {
      V.mult(c/2 / V.mag());
    }
    F.x = 0;
    F.y = 0;
    theta += turnW;
    
    turnW -= 0.05 * (turnW);
    X.add(PVector.mult(V, dt));
  }
  void drawShip() {
      // The points that make up the ship
      PVector tip = rotatePoint(10,0,theta);
      PVector leftCorner = rotatePoint(-10,-5,theta);
      PVector rightCorner = rotatePoint(-10,5,theta);
      PVector base = rotatePoint(-5,0,theta);
      
      noFill();
      strokeWeight(1);
      stroke(#A803FC);

      beginShape();
        vertex(width/2 + tip.x, height/2 + tip.y);
        vertex(width/2 + leftCorner.x, height/2 + leftCorner.y);
        vertex(width/2 + base.x, height/2 + base.y);
        vertex(width/2 + rightCorner.x, height/2 + rightCorner.y);
        vertex(width/2 + tip.x, height/2 + tip.y);
      endShape();
      
      handleJet();  
  }
  int jetN;
  void handleJet() {
    if (thrust) {
      PVector base = rotatePoint(-5,0,theta);
      float vari = random(-PI/16,PI/16);
      PVector baseV = rotatePoint(-2,0,theta+vari);
      Jet[jetN].X = base;
      Jet[jetN].X.x += width/2;
      Jet[jetN].X.y += height/2;
      Jet[jetN].V = baseV;
      Jet[jetN].age = 0;
      jetN++;
      if (jetN > numJetParticles) {jetN=0;};
    }
    for (int i=0; i<=numJetParticles; i++) {
      if (Jet[i].age < numJetParticles) {
        Jet[i].update();
        Jet[i].drawParticle();
      }
    }
  }
}

PVector rotatePoint(float x, float y, float rotation) {
  PVector rotatedPoint = new PVector();
  rotatedPoint.x = cos(rotation) * x - sin(rotation) * y;
  rotatedPoint.y = cos(rotation) * y + sin(rotation) * x;
  return rotatedPoint;
}

void draw_path(PVector Xo, PVector Vo) {
  PVector[] projection = new PVector[predictions + 1];
  projection[0] = new PVector(width/2, height/2);
  
  PVector X = new PVector();
  X.x = Xo.x;
  X.y = Xo.y;
  PVector F = new PVector();
  PVector V = new PVector();
  V.x = Vo.x;
  V.y = Vo.y;
  
  for (int k=1; k<=predictions; k++) {
    for (int j=0; j<=numPL; j++) {
      PVector dX = PVector.sub(bodies[j].X[k-1], X);
      float Fmag = gravConst * bodies[j].mass // NOTE: no mass
                       / pow(dX.mag(), 2);
      dX.normalize();
      F.x += Fmag * dX.x;
      F.y += Fmag * dX.y;
    }
    V.add(PVector.mult(F, dt)); // NOTE: no mass
    float c = 299792458.0 / mPerAU * sPerDay; // m/s
    if (V.mag() > c/2) {
      V.mult(c/2 / V.mag());
    }
    F.x = 0;
    F.y = 0;
    X.add(PVector.mult(V, dt));
    PVector dX = new PVector();
    PVector relate = new PVector();
    for (int m=1; m<=k; m++) {
      relate.add(PVector.mult(bodies[camCpl].V[m], dt));
    }
//    relate = PVector.mult(bodies[camCpl].V[0], dt*k);
    dX = PVector.sub(X, relate);
    dX.sub(camCenter);
//    dX = PVector.sub(X, camCenter);
    dX.x *= PicsPerAU;
    dX.y *= PicsPerAU;
    dX.x += width/2;
    dX.y += height/2;
    projection[k] = new PVector(dX.x, dX.y);
  }
  noFill();
  stroke(#1D6DF2);
  beginShape();
  for (int k=0; k<=predictions; k++) {
    vertex(projection[k].x, projection[k].y);
  }
  endShape();
}

class jetParticle {
  PVector X;
  PVector V;
  float age;
  jetParticle() {
    X = new PVector();
    V = new PVector();
  }
  void update() {
    X.add(V);
    age += 1;
  }
  void drawParticle() {
    noStroke();
    float opk = 255 * (1 - age / numJetParticles);
    fill(#FFCD00, opk);
    rect(X.x, X.y, 1, 1) ;
  }
}


