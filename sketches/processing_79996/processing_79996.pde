
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/48118*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//Author: Weiyuh Li
//Fall,Falling,Fallen
//concept:use the effect of gravity(planet and satellite) to creat flying birds,the vectors between attractor and particles form the swing wings 
//       
//mouse left click to add particles 
//mouse right click and drag toadd attractors
// press keyboard to change scene
//reference:http:class exercise by Sheng-Fen Nik Chi
//reference:http://www.openprocessing.org/visuals/?visualID=5152 by Callum Rogers (gravity attractors)
//hand holding grass: http://www.dreamstime.com/royalty-free-stock-image-hand-holding-grass-image6014766

ArrayList attractors = new ArrayList();
ArrayList particles = new ArrayList();
WorldData wd = new WorldData();

boolean addingAttractor = false;
PVector initialPos;
PImage img1; PImage img2;

void setup() {
  size(900, 387);
  img1 = loadImage ("woah.png");
  img2 = loadImage ("grass.png");
  noLoop();
  smooth();
  cursor();
  noStroke();
  frameRate(15);
  ellipseMode(RADIUS);
  //start position
  particles.add(new Particle(wd, new PVector(random(width)-50, random(height)-50)));
  particles.add(new Particle(wd, new PVector(random(width)-50, random(height)-50)));
  particles.add(new Particle(wd, new PVector(random(width)-50, random(height)-50)));
  attractors.add(new Attractor(new PVector(random(width)-50, random(height)-50), 45));
  attractors.add(new Attractor(new PVector(random(width)-50, random(height)-50), 45));
  attractors.add(new Attractor(new PVector(random(width)-100, random(height)-100), 45));
}


void draw() {

  image (img1, 0, 0); 
  cursor (img2);

  if (keyPressed==false) {
    strokeWeight(4);
    stroke(120, 160, 250, 30);
    int step = 13;
    float nlevel = 0.1;
    float lastx = -999;
    float lasty = -999;
    float ynoise = random(10);
    float y;
    for (int x=0; x<=900; x+=step) {
      y = 500 + noise(ynoise) * 80;
      if (lastx > -999) {
        line(x, y, lastx, lasty);
      }
      lastx = x;
      lasty = y;
      ynoise += nlevel;
    }
  }

  if (mousePressed) {
    if (mouseButton == LEFT)
      particles.add(new Particle(wd, new PVector(mouseX, mouseY)));

    if (addingAttractor) {
      fill(50, 50);
      float d = clamp(dist(initialPos.x, initialPos.y, mouseX, mouseY), 3);
      ellipse(initialPos.x, initialPos.y, d, d);

      if (mouseButton != RIGHT) { 
        attractors.add(new Attractor(new PVector(initialPos.x, initialPos.y), d-2));
        addingAttractor = false;
      }
    }
  }
  else if (addingAttractor) {
    float d = clamp(dist(initialPos.x, initialPos.y, mouseX, mouseY), 3);
    attractors.add(new Attractor(new PVector(initialPos.x, initialPos.y), d-2));
    addingAttractor = false;
  }

  for (int i = 0; i < attractors.size(); i++) {
    Attractor a = (Attractor)attractors.get(i);
    a.draw();
  }

  for (int i = 0; i < particles.size(); i++) {
    Particle p = (Particle)particles.get(i);
    p.run(attractors);
  }
}

float clamp(float v, float min) {
 return (v<min)?min:v;
}

void mousePressed() {

  if (mousePressed) {
    if (mouseButton == RIGHT)
      addingAttractor = true;
    initialPos = new PVector(mouseX, mouseY);
  }
  loop();
}



// set attractor

class Attractor {
  PVector position = new PVector(width/2, height/2);
  float strength = 1;

  public Attractor() {
  }

  public Attractor(PVector position, float strength) {
    this.position = position;
    this.strength = strength;
  }

  float getRadius() {
    return 2+strength;
  }

  void draw() {
    noStroke();
    fill(0, 100);
    float radius = getRadius();
    if (keyPressed==true) {
      ellipse(position.x, position.y, radius, radius);
      line(0, 9, 300, 400);
    }
  }
}

//set praticle

class Particle {
  PVector position = new PVector(width/2, height/2);
  PVector speed = new PVector(0, 0);
  PVector maxSpeed = new PVector(35, 35);
  float radius = 7;
  WorldData wd;

  public Particle(WorldData wd) {
    this.wd = wd;
  }

  public Particle(WorldData wd, PVector position) {
    this(wd);
    this.position = position;
  }


  void run(ArrayList attractors) {
    update(attractors);
    if (keyPressed == true ) {
      draw();
    }
  }
  void update(ArrayList attractors) {
    PVector[] components = new PVector[attractors.size()];

    PVector resultant = new PVector(0, 0);
    for (int i = 0; i < attractors.size(); i++) {
      Attractor a = (Attractor)attractors.get(i);
      float d = dist(a.position.x, a.position.y, position.x, position.y)+1;
      float force = 0;
      if (d < a.getRadius() + radius)
        force = wd.gravitationalConstant*d/a.strength;
      else
        force = wd.gravitationalConstant*a.strength/pow(d, 0.9);
      float angle = atan2(a.position.y - position.y, a.position.x - position.x);
      components[i] = new PVector(force*cos(angle), force*sin(angle));
      resultant.add(components[i]);
    }
    speed.add(resultant);

    if (speed.x > maxSpeed.x)
      speed.x = maxSpeed.x;
    if (speed.y > maxSpeed.y)
      speed.y = maxSpeed.y;

    position.add(speed);

    if (position.x < radius)
      speed.x = abs(speed.x);
    else if (position.x > width-radius)
      speed.x = -abs(speed.x);

    if (position.y < radius)
      speed.y = abs(speed.y);
    else if (position.y > height-radius)
      speed.y = -abs(speed.y);


    if (wd.showComps) {
      strokeWeight(1);
      stroke(0, 100);
      for (int i = 0; i < components.length; i++)

        if (keyPressed==false)
          line(position.x, position.y, position.x + 50*components[i].x, position.y + 50*components[i].y);
       
        
        
    }
  }

  void draw() {
    noStroke();

    ellipse(position.x, position.y, radius, radius);
  }
}

public class WorldData {
  public boolean showComps = true;
  public float gravitationalConstant = 1;
}


