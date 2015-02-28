
//Controls:
// - WASD to move Sun
// - R to randomize planets
// - Left-Click to randomize planets at mouse Location

PlanetG planet[] = new PlanetG[10] ;
int sunRad = 30;
int sunX, sunY;
float sunM = 4.5;
float gravCst = 1000; //in reality it is: 6.6726*pow(10, -11)

void setup() {
  size(500, 450);
  background(255);
  smooth();
  sunX = width/2;
  sunY = height/2;
  planet[0] = new PlanetG("Earth", 53, 55, 15, gravCst, 2.0, 0, 0);
  planet[1] = new PlanetG("Mars", 100, 25, 7, gravCst, 1.0, 0, 1);
  planet[2] = new PlanetG("Pluto", 150, 125, 4, gravCst, 3.7, 0, 2);
  planet[3] = new PlanetG("Saturn", 401, 225, 20, gravCst, 7.0, 0, 3);
  planet[4] = new PlanetG("Neptune", 300, 325, 16, gravCst, 4.2, 0, 4);
}

void draw() {
  background(255);

  for (int j = 0; j <=4; j++) {
    planet[j].update();
    planet[j].display();
    textAlign(CORNER);
    text(planet[j].pName + " is at: (" + str(round(planet[j].x)) + ", " + str(round(planet[j].y)) + ")", 20, 15*j + 20);
  }

  textAlign(CENTER);
  line(sunX, 0, sunX, height);
  line(0, sunY, width, sunY);

  ellipseMode(CENTER);
  ellipse(sunX, sunY, sunRad*2, sunRad*2);
  text("Sun", sunX, sunY - sunRad - 5);
}

class PlanetG {
  float x; //x position
  float y; //y position
  float sX = random(-2, 2); // y speed
  float sY = random(-2, 2); //x speed
  float dX; //delta X
  float dY; //delta Y
  float G; // gravitational constant
  float Fg; //force of gravity
  float r; // radius
  float aX; // acceleration X
  float aY; // acceleration Y
  float mass; //mass of first object
  color c; //color of planet
  int pR; //planet radius
  String pName;
  int varSpeed = 6; //randomizing speed constant
  int id; //id of the planet

  PlanetG(String iP, float iX, float iY, int iRP, float iG, float iM, color ic, int iid) {
    x = iX;
    y = iY;
    G = iG;
    mass = iM;
    c = ic;
    pName = iP;
    pR = iRP;
    id = iid; 
  }

  void update() {


    dX = sunX - x;
    dY = sunY - y;
    r = sqrt(sq(dX) + sq(dY));
    //omega = atan(dY / dX);

    if (abs(dX) > 0 && abs(dY) > 0) {
      aX = dX*G*mass*sunM / pow(r, 3);
      aY = dY*G*mass*sunM / pow(r, 3);
      sX = sX + aX;
      sY = sY + aY;
    }
    
    x = sX + x;
    y = sY + y;

    if (mousePressed == true) {
      background(0);
      x = mouseX + pR;
      y = mouseY - pR;
      sX =random (-varSpeed, varSpeed);
      sY =random (-varSpeed, varSpeed);
    }
  }

  void display() {
    textAlign(CENTER);
    fill(c);
    ellipse(x, y, pR*2, pR*2);
    text(pName, x, y - pR - 3);
  }
}

void keyPressed() {
  switch(key) {
  case 'a':
  case 'A':
    sunX -=5;
    break;
  case 'd':
  case 'D':
    sunX +=5;
    break;
  case 's':
  case 'S':
    sunY += 5;
    break;
  case 'w':
  case 'W':
    sunY -=5;
    break;
  case 'r':
  case 'R':
    for (int j = 0; j <=4; j++) {
      planet[j].x = random(0, 500-(planet[j].pR*2));
      planet[j].y = random(0, 500-(planet[j].pR*2));
      planet[j].sX =random (-planet[j].varSpeed, planet[j].varSpeed);
      planet[j].sY =random (-planet[j].varSpeed, planet[j].varSpeed);
    }
  }
}

