
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

int wS = 10;
int yS = 8;
int sz = 5;
int current;
String planet;
boolean pressed = false;
int count = -1;

Star s;
ArrayList cluster;
PFont sans;
PFont sans2;
Minim m;
AudioPlayer p;

void setup() {
  size(700, 400);
  background(18);
  smooth();
  m = new Minim(this);
  p = m.loadFile("coin.wav");
  cluster = new ArrayList();
  addStars();
  removeStars();
  drawBackground();
  planet = generatePlanet();
}

void draw() {
  background(18);
  redrawStars();
  drawBackground();
  fill(255);
  sans = createFont("verdana.ttf", 15);
  textFont(sans);
  textAlign(CENTER);
  text(planet, width/2, height/2 - 135);
  sans = createFont("verdana.ttf", 10);
  textFont(sans);
  textAlign(LEFT);
  text("'R' to Refresh", 10, height - 10);
  if (disCheck()) line(mouseX, mouseY, width/2, height/2);
  popCheck();
}

void mousePressed() {
  if (mouseButton == LEFT) {
    if (disCheck()) {
      float r =  random(0, cluster.size());
      current = int(r);
      Star s = (Star) cluster.get(current);
      stroke(0);
      line(mouseX, mouseY, s.getX(), s.getY()); 
      s.pop();
      p.loop(0);
      pressed = true;
      count = 1;
    }
  }
  if (mouseButton == RIGHT) {
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    setup();
  }
}

void drawBackground() {
  fill(144);
  noStroke();
  ellipse(width/2, height/2, (width/1/3) + 4, (width/1/3) + 4);
  stroke(0);
  strokeWeight(3);
  fill(80);
  ellipse(width/2, height/2, width/1/3, width/1/3);
  noStroke();
  fill(110);
  ellipse(width/2, height/2, width/1/3 - 20, width/1/3 - 20);
}

void addStars() {
  noStroke();
  fill(255);
  for (int i = 0; i < wS; i++) {
    for (int j = 0; j < yS; j++) {
      cluster.add(new Star(random((width/wS)*i, (width/wS)*(i+1)), random((height/yS)*j, (height/yS)*(j+1)), sz));
    }
  }
}

void removeStars() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < cluster.size(); j++) {
      Star s = (Star) cluster.get(j);
      int x = s.getX();
      int y = s.getY();
      if (disCheck(x, y)) cluster.remove(j);
    }
  }
}

void redrawStars() {
  fill(255);
  noStroke();
  for (int i = 0; i < cluster.size(); i++) {
    Star s = (Star) cluster.get(i);
    s.display();
  }
}

boolean disCheck() {
  if (dist(mouseX, mouseY, width/2, height/2) < ((width/1/3)/2)) return true;
  else return false;
}

boolean disCheck(int x, int y) {
  if (dist(x, y, width/2, height/2) < (((width/1/3)/2) + 15)) return true;
  else return false;
}

void popCheck() {
  if(pressed && count < 15 && count != -1) {
    Star s = (Star) cluster.get(current);
    s.pop();
    count++;
  }
  if(pressed && count >= 15) {
    Star s = (Star) cluster.get(current);
    s.shrink();
    count++;
  }
  if(pressed && count == 25) {
    count = -1;
    pressed = false;
  }
}

String generatePlanet() {
  int ran = int(random(0, 6));
  if (ran == 1) {
    String name = ("HOTH");
    return name;
  }
  if (ran == 2) {
    String name = ("REACH");
    return name;
  }
  if (ran == 3) {
    String name = ("PANDORA");
    return name;
  }
  if (ran == 4) {
    String name = ("HARVEST");
    return name;
  }
  if (ran == 5) {
    String name = ("TATOOINE");
    return name;
  }
  String fail = "EARTH";
  return fail;
}


