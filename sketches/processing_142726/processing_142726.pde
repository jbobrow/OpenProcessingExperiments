
//create array with 15 planets
Planet[] planets = new Planet[15];

void setup() {
  size (600, 600);
  background(0);
  smooth();
  noStroke();

  //make loop up to length of planets array (start at i=2 so planets do not overlap with or orbit too close to the sun)
  //planet created every 20 units away from the center of the screen, random sizes, start at random angles, 
  //orbit at random frequencies, have colors that go from white to black as i increases
  for (int i=2; i<planets.length; i++) {
    planets[i] = new Planet(20*i, random(10, 19), random(0, 360), random(0.01, 0.03), 295-20*i);
  }
}

void draw() {

  background(0);
  //draw and update each planet
  for (int i=2; i<planets.length; i++) {
    planets[i].draw();
    planets[i].update();
  }

  //draw sun at center
  fill(255, 0, 0);
  ellipse(width/2, height/2, 40, 40);
}

//class describing planets
class Planet {
  float d; //distance of planet from sun
  float r; //planet size
  float a; //angle planet position makes with horizontal x axis
  float da; //rate of change in angle
  float C; //color

  // initialize planet
  Planet (float d0, float r0, float a0, float da0, float C0) {
    d=d0;
    r=r0;
    a=a0;
    da=da0;
    C=C0;
  }

  //draw ellipse with color determined by value of C, position depends on angle a, and with size r
  void draw() {
    fill(C);
    ellipse(width/2+d*cos(a), height/2+d*sin(a), r, r);
  }

  //update the angle with respect to horizontal x axis
  void update() {
    a+=da;
  }
}



