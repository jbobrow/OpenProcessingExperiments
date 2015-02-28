
int counter;
Star sun;
Planet[] planets;
Starship ship;
ArrayList galaxy;
boolean paused;

void setup() {  //setup function called initially, only once
  size(1000, 800);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  sun = new Star(width/2, height/2, width/2, "sun");
  galaxy = new ArrayList();
  sun.generateChildren();
  console.log(galaxy.size());
  ship = new Starship(500, 400);
  paused = false;
  frameRate(60);
  galaxy.add(ship);
  galaxy.add(sun);
}

void draw() {  //draw function loops 
  if(paused == false) {
    background(0);
    fill(255);
    text("fps: "+int(frameRate)+" travelSideways: "+ship.travelSideways, 5, 20);
    sun.displer();
    ship.display();
  }
}

void keyReleased() {
  if(key != CODED) {
    if(key == 'p' || key == 'P') { if(paused) {paused = false;} else { paused = true; } }
  }
}

void keyPressed() {
  if(key != CODED) {
      int randMove = int(floor(random(1, 10)));
      //if(key == 'w' || key == 'W') {ship.ypos-= randMove; ship.xpos+= ship.travelSideways; translate(xpos-ship.travelSideways, randMove);}
      if(key == 'w' || key == 'W') { ship.move('w'); }
      else if(key == 's' || key == 'S') {ship.ypos+= randMove; translate(0, -randMove);}
      else if(key == 'a' || key == 'A') {ship.travelSideways--;}
      else if(key == 'd' || key == 'D') {ship.travelSideways++;}
  }
}

class SpaceObject {
  int xpos;
  int ypos;
  SpaceObject parent;
  int index;
  int gravityRadius;
  int diam;
  
  float getDistance(SpaceObject ggyj) {
    return sqrt( abs(pow((xpos - ggyj.xpos), 2)) + abs(pow((ypos - ggyj.ypos), 2)) );
  }
}

class Starship extends SpaceObject {
  int travelSideways = 20;
  Starship(int x, int y) {
    xpos = x;
    ypos = y;
    travelSideWays = 0;
    diam = 100;
    index = 0;
  }
  void display() {
    int side = 100;
    int x = xpos;
    int y = ypos - side/2;
    translate(xpos, ypos);
    if(travelSideways >= -100) {
      rotate(radians(travelSideways*18));
    } else {
      rotate(radians(180+travelSideways*18));
    }
    translate(-xpos, -ypos);
    if(keyPressed) {
      noStroke();
      fill(random(200, 260), random(50, 140), 48);
      ellipse(x+side/5, y+3*side/5, 20, 20);
      fill(random(200, 260), random(50, 140), 48);
      ellipse(x-side/5, y+3*side/5, 20, 20);
      stroke(0);
    }
    x -= side/2;
    beginShape();
    stroke(0);
    fill(210);
    vertex(x+50, y);
    vertex(x+100, y+90);
    vertex(x+70, y+50);
    vertex(x+50, y+75);
    vertex(x+30, y+50);
    vertex(x+0, y+90);
    endShape();
  }
  
  void move(char d) {
    int randMove = int(floor(random(1, 10)));
    if(travelSideways < 0) { travelSideways = 20+(travelSideways % 20); }
    else if(travelSideways > 20) { travelSideways -= 20; }
    if(d == 'w' || d == 'W') {
      if(travelSideways % 20 == 5) { //The ship is completely sideways(right)
        xpos += randMove;
        translate(-randMove, 0);
      }
      else if(travelSideways % 20 == 10) { //The ship is looking down
        ypos += randMove;
        translate(0, -randMove);
      }
      else if(travelSideways % 20 == 15) { //The ship is looking left
        xpos -= randMove;
        translate(randMove, 0);
      }
      else if(travelSideways % 20 == 0) { //The ship is looking up
        ypos -= randMove;
        translate(0, randMove);
      }
      else if(travelSideways % 20 >= 0 && travelSideways % 20 > 15) { //The ship is looking upper left
        xpos -= ((20-travelSideways) % 20);
        ypos -= randMove-1;
        translate((20-travelSideways) % 20, randMove-1);
      }
      else if(travelSideways % 20 >= 0 && travelSideways % 20 < 5) { //The ship is looking upper right
        xpos += travelSideways % 20;
        ypos -= randMove;
        translate(-(travelSideways % 20), randMove);
      }
      else if(travelSideways % 20 > 5 && travelSideways % 20 < 10) { //The lower right
        xpos += travelSideways % 20;
        ypos += randMove;
        translate( -(travelSideways % 20), -randMove);
      }
      else if(travelSideways % 20 > 10 && travelSideways % 20 < 15) { //The ship is looking lower left
        xpos -= (20-travelSideways) % 20;
        ypos += randMove;
        translate((20-travelSideways) % 20, -randMove);
      }
    }
  }
}

class Planet extends SpaceObject {
  int[] orbitX;
  int[] orbitY;
  int axisX;
  int axisY;
  float step;
  int col;
  int diam;
  int years;
  float speed;
  
  Planet(String n, int x, int y, float sp, Star s) {
    name = n;
    axisX = x;
    axisY = y;
    orbitX = new int[360];
    orbitY = new int[360];
    col = color(random(0, 255), random(0, 255), random(0, 255));
    step = 0;
    parent = s;
    diam = int(random(s.diam/16, s.diam/4));
    years = 0;
    speed = sp;
    gravityRadius = diam + speed*10;
  }
  
  void update(boolean show) {
    step += speed;
    if(step >= 360) { step = 0; years++; }
    int oX = parent.xpos + int(axisX * cos(radians(step)));
    int oY = parent.ypos + int(axisY * sin(radians(step)));
    stroke(0);
    fill(col);
    ellipse(oX, oY, diam, diam);
    orbitX[floor(step)] = oX;
    orbitY[floor(step)] = oY;
    if(show) {drawOrbit();}
  }
  
  void drawOrbit() {
    if(years > 0) {
      for(int i = 0; i <= step; i++) {
        strokeWeight(5);
        stroke(col);
        point(orbitX[i], orbitY[i]);
        strokeWeight(1);
      }
    }
  }
}

class Star extends SpaceObject{
  int xpos;
  int ypos;
  int diam;
  
  Star(int x, int y, int d, String n) {
    xpos = x;
    ypos = y;
    diam = d;
    gravityRadius = diam*3;
    name = n;
  }
  
  void displer() {
    fill(200, 176, 13);
    ellipse(xpos, ypos, diam, diam);
  }
  
  void update() {
    
  }
  
  void generateChildren() {
    int hjkplanets = random(0, 10); //A random amount of planets from 0-9
    int hjkcomets = random(0, 5); //A random amount of comets from 0-4
    for(int i = 0; i < hjkplanets; i++) { //Constructs each planet and adds it to the galaxy
      int hjlrad = int(random(diam, 4*diam));
      Planet pl = new Planet(galaxy.length+i, hjlrad+floor(random(2,20)), hjlrad+floor(random(2,20)), random(0.5, 4.0), this);
      galaxy.add(pl);
    }
  }
}
