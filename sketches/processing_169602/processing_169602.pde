
ArrayList<Asteroid> aField;
Ship s;

float area;
float cameraZ;
float difficulty, spawnrate;

void setup() {
  size(800, 800, P3D);
  frameRate(30);
  smooth(0);
  sphereDetail(3);
  area = 2400;

  aField = new ArrayList<Asteroid>();
  s = new Ship();

  float fov = PI/3.0;
  cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 
  cameraZ/10.0, cameraZ*40.0);
  
  difficulty = 2;
  spawnrate = 60;
}

void draw() {
  //frame.setTitle("as3D @ " + round(frameRate) + "fps x:" + mouseX + " y:" + mouseY);
  if (frameCount <= 1800) difficulty = map(frameCount,0,1800, 2, 4);
  if (frameCount % 300 == 0) { spawnrate = round(spawnrate/2); println(spawnrate); }
  if (mousePressed == true) camera(s.position.x, s.position.y, -45, s.position.x, s.position.y, -250, 0, 1, 0);
  else camera(s.position.x, s.position.y-40, 240, s.position.x, s.position.y, -250, 0, 1, 0);

  background(24);
  lights();
  s.update(sizeToArea(mouseX), sizeToArea(mouseY));
  for (int i = 0; i < aField.size (); i++) {
    Asteroid a = aField.get(i);
    a.update();
    if (PVector.dist(a.position, s.position) <= a.radius*2) {
      s.hits++;
      aField.remove(i); 
      i--;
    }
    if (a.position.z >= a.radius) { 
      aField.remove(i); 
      i--;
    }
  }
  if (frameCount%spawnrate==0) aField.add(new Asteroid(-cameraZ*40, difficulty));
}

float sizeToArea(float a) {
  return map(a, 0, width, -area/2, area/2);
}

void mousePressed() {
}

class Asteroid {
  PVector position;
  float velocity;

  float radius;
  float rX, rY, rZ;
  float rSpeedX, rSpeedY, rSpeedZ;
  color c;

  Asteroid(float startZ, float velMulti) {
    position = new PVector(sizeToArea(random(width+1)), sizeToArea(random(height+1)), startZ);
    velocity = (30+random(20))*velMulti;

    radius = 80;
    rSpeedX = radians(random(8));
    rSpeedY = radians(random(8));
    rSpeedZ = radians(random(8));
    c = color(64 + random(192));
  }

  void move() {
    position.x += sin(rX)*5;
    position.y += sin(rY)*5;
    position.z += velocity;
    
    rX += rSpeedX;
    rY += rSpeedY;
    rZ += rSpeedZ;
  }

  void draw_() {
    pushMatrix();
    translate(position.x, position.y, position.z);
    stroke(36);
    strokeWeight(2);
    fill(c);
    rotateX(rX);
    rotateY(rY);
    rotateZ(rZ);
    sphere(radius);
    popMatrix();
  }

  void update() {
    move();
    draw_();
    //velocity *= 1.01;
  }
}


class Ship {
  PVector position;

  color c;
  float ease = 0.05;
  int hits = 0;

  Ship() {
    position = new PVector(width/2, height/2, 0);

    c = color(255, 128, 0);
  }

  void moveTo(float x, float y) {
    position.x += (x-position.x)*ease;
    position.y += (y-position.y)*ease;
  }

  void draw_(float x, float y) {
    c = color(255, (128 + hits*10)%255, 0);
    pushMatrix();
    translate(position.x, position.y, position.z);
    stroke(2);
    fill(c);
    beginShape(TRIANGLES);
    vertex(0, -10, 0);
    vertex(-25, -10, 50);
    vertex(25, -10, 50);

    vertex(0, 10, 0);
    vertex(-25, 10, 50);
    vertex(25, 10, 50);
    endShape();
    beginShape(QUADS);
    vertex(0, -10, 0);
    vertex(-25, -10, 50);
    vertex(-25, 10, 50);
    vertex(0, 10, 0);

    vertex(0, -10, 0);
    vertex(25, -10, 50);
    vertex(25, 10, 50);
    vertex(0, 10, 0);

    vertex(-25, -10, 50);
    vertex(25, -10, 50);
    vertex(25, 10, 50);
    vertex(-25, 10, 50);
    endShape();

    //translate(0, 10, 51);
    textMode(SHAPE); 
    textAlign(CENTER);
    textSize(22);
    fill(0);
    text(hits, 0, 8, 51);

    popMatrix();
  }

  void update(float x, float y) {
    moveTo(x, y);
    draw_(x, y);
  }
}



