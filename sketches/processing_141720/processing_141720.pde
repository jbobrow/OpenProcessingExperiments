
WatherJet wathers;
PImage bathtub;
ArrayList<WatherJet> wathers;
ArrayList<Bubble> blueBubbles;
float watherLimit = 242;
String url = "http://farm8.staticflickr.com/7010/13443893484_8acae04227_c";
void setup() {
  bathtub = loadImage(url, "jpg");
  size(800, 518);
  colorMode(HSB, 360, 100, 100);
  wathers = new ArrayList<WatherJet>();
  blueBubbles = new ArrayList<Bubble>();
}
void draw() {
  background(0);
  image(bathtub, 0, 0);

  wathers.add(new WatherJet(new PVector(530, 189)));
  for (int i = 0; i<wathers.size(); i++) {
    WatherJet p = wathers.get(i);

    p.run();

    if (p.isDead()) {
      wathers.remove(i);
    }
  }
  blueBubbles.add(new Bubble(new PVector(300, 280+15)));
  blueBubbles.add(new Bubble(new PVector(400, 300+15)));
  blueBubbles.add(new Bubble(new PVector(250, 400+15)));

  for (int i = 0; i<blueBubbles.size(); i++) {
    Bubble b = blueBubbles.get(i);
    b.run();
    if (b.isDead()) {
      blueBubbles.remove(i);
    }
  }
}

class WatherJet {
  PVector location;
  PVector velocity;
  PVector acceleration;
  private float lifespan;

  WatherJet(PVector l) {
    acceleration = new PVector(0, 0.1);
    velocity = new PVector(random(-0.2, 0), random(-0.1, 0));
    location = l.get();
    lifespan=100;
  }
  void run() {
    update();
    display();
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan-=1;
  }
  void display() {
    int blue = color(195, 27, 99);
    fill(blue,100);
    noStroke();
    ellipse(location.x, location.y, 7, 13);
  }
  boolean isDead() {
    if (location.y > watherLimit) {
      return true;
    }
    else {
      return false;
    }
  }
}

public class Bubble {
  PVector location;
  PVector velocity;
  PVector acceleration;
  private float lifespanB;
  color c1, c2, c3;

  Bubble(PVector l) {
    acceleration = new PVector(0, 0.4);
    velocity = new PVector(random(-5, 5), random(-10, 5));
    location = l.get();
    lifespanB=30;
  }

  void run() {
    update();
    if (location.y < watherLimit) {
      display();
    }
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespanB-=1;
  }

  void display() {

    coloredEllipse();
  }
  void coloredEllipse() {
    defineColors();
    fill(c2, 100);
    stroke(c2, 100);
    ellipse(location.x, location.y, 15, 15);
  }

  boolean isDead() {
    if (lifespanB<0) {
      return true;
    }
    else {
      return false;
    }
  }
  void defineColors() {
   // c1 = color((int)random(300, 360), (int)random(30, 40), (int)random(80, 100));//342,38,95
    c2 = color(195, (int)random(10, 20), (int)random(70, 160)); //13,96
    //c3 = color(75, 47, (int)random(80, 100)); //86
  }
}

