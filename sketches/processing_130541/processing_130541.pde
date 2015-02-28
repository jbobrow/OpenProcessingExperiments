
//elliptical motion

int numPlanets = 25;
Planet[] solarSystem = new Planet[numPlanets];

void setup() {
  size (600, 600);
  smooth();
  for (int i = 0; i<numPlanets; i++) {
    solarSystem[i] = new Planet();
  }
}

void draw() {
  //fill(0,15);
  //rect(-1,-1,width,height);
  //background(0);
  for (int i = 0; i<numPlanets; i++) {
    solarSystem[i].move();
    solarSystem[i].display();
  }
}




class HeavenlyBody {
  float ang;
  float distance;
  float speed;
  float size;
  float x, y, centerX, centerY;
  color c;

  HeavenlyBody() {
    ang = random(-2, 2);
    size = random(8, 50);
    distance = size+random(20, width);
    //    centerX = random(width);
    //    centerY = random(height);    
    centerX = 0;
    centerY = 0;
    speed = random(-.002 ,.002);
    c = color(250);
  }

  void move() {

    x = centerX+(distance*cos(ang));
    y = centerY+(distance*sin(ang));
    ang+=speed;
  }
  void display() {
    noStroke();
    fill(c);
    ellipse(x, y, size, size);
  }
}

class Moon extends HeavenlyBody {

  Moon() {
    super();
    c = color(60,142,124);
    speed *= 10;
  }
}

class Planet extends HeavenlyBody {

  ArrayList<Moon> moonList;

  Planet() {
    super();
    moonList = new ArrayList<Moon>();
    int randNum = (int) random(5);
    for (int i = 0; i < randNum; i++) {
      Moon moon = new Moon();
      moon.centerX = x;
      moon.centerY = y;
      moon.size = random(4, size/2);
      moon.distance = random(size/2, size*2);
      moon.c = color(random(100, 200), random(100,200), random(100, 255));
      moonList.add(moon);
    }
  }

  void move() {
    super.move();
    for ( Moon moon : moonList) {
      moon.centerX = x;
      moon.centerY = y;
      moon.move();
    }
  }

  void display() {
    super.display();
    for ( Moon moon : moonList) {
      moon.display();
    }
  }
}



