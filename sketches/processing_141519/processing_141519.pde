
float theta = 0;
int numPlanets = 8;
Planet[] planets = new Planet[numPlanets];
float maxrad, sunrad, planrad;
int winsize = 400;


void setup() {
  size(winsize, winsize);
  colorMode(HSB);
  background(0, 0, 0);
  
  maxrad = width/2;
  sunrad = .071 * maxrad;
  planrad = .129 * maxrad;
  
  planets[0] = new Planet("Mercury", .222 * planrad, .114 * maxrad, 0, 2, false);
  planets[1] = new Planet("Venus", .444 * planrad, .171 * maxrad, 25, 1.5, false);
  planets[2] = new Planet("Earth", .511 * planrad, .242 * maxrad, 44, 1, false);
  planets[3] = new Planet("Mars", .622 * planrad, .342 * maxrad, 96, .5, false);
  planets[4] = new Planet("Jupiter", planrad, .467 * maxrad, 124, 2, false);
  planets[5] = new Planet("Saturn", .756 * planrad, .629 * maxrad, 160, 1.5, false);
  planets[6] = new Planet("Uranus", .778 * planrad, .742 * maxrad, 195, 1, false);
  planets[7] = new Planet("Neptune", .667 * planrad, .893 * maxrad, 214, .5, false);
  //planets[8] = new Planet("Pluto", .178 * planrad, .970 * maxrad, 214, 2, false);
}

void draw() {
  background(0, 0, 0);
  translate(width/2, height/2);

  noFill();
  strokeWeight(2);
  stroke(0, 0, 255, 200);
  ellipse(0, 0, 2 * sunrad, 2 * sunrad);
  

  noFill();
  stroke(0, 0, 255, 50);
  strokeWeight(1);
  for (int i = 0; i < numPlanets; i++) {
    ellipse(0, 0, 2*planets[i].dist, 2*planets[i].dist);
  }

  noStroke();
  for (int i = 0; i < numPlanets; i++) {
    planets[i].display(theta);
  }
  theta+=1;
//  if (frameCount % 6 == 0){
//   saveFrame("frames/###.gif"); 
//   saveFrame("frames/###.png"); 
//  }
}



class Planet {
  String name;
  float diam;
  float dist;
  float col;
  float speed;
  boolean ring;

  Planet(String _name, float _diam, float _dist, float _col, float _speed, boolean _ring) {
    name = _name;
    diam = _diam;
    dist = _dist;
    col = _col;
    speed = _speed;
    ring = _ring;
  }

  void display(float _theta) {
    pushMatrix();

    rotate(radians(theta) * speed);

        fill(col, 255, 255);

    ellipse((dist) * cos(radians(theta)), (dist) * sin(radians(theta)), diam, diam);
    //text(name, (dist) * cos(radians(theta)), (dist) * sin(radians(theta)));



    if (ring == true) {
      noFill();
      stroke(0, 0, 255, 150);
      strokeWeight(1);
      ellipse((dist) * cos(radians(theta)), (dist) * sin(radians(theta)), diam+10, diam+10);
    }
    popMatrix();
  }
}

