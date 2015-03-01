


ArrayList circles = new ArrayList();

PVector pos, vel, acc;
PVector grav;
PVector lWind, rWind;

final int NB_PARTICLES = 200;
ArrayList<Triangle> triangles;
Particle[] parts = new Particle[NB_PARTICLES];
PImage image;
MyColor myColor = new MyColor();

void setup() {
  size(1280, 720, P2D);
  

  pos = new PVector(400, 300);
  vel = new PVector(0, 0);
  acc = new PVector(0, 0);

  grav = new PVector(0, 3);

  lWind = new PVector(-.2, 0);
  rWind = new PVector(.2, 0);

  for (int i = 0; i < NB_PARTICLES; i++)
  {
    parts[i] = new Particle();
  }
  smooth ();
}


void draw() {
  background(30);
  scale(4);
  translate(0, -30);
 
  
  translate(0, +30);
  scale(0.25);
  
  for (int i=0; i<circles.size(); i++) {
    ExpandingCircle ec = (ExpandingCircle) circles.get(i);
    ec.update();
    ec.display();
    if (ec.transparency <= 0) { circles.remove(i); } // remove invisible circles
  }
  
  noStroke();
  fill(200, 200, 200, 100);
  rect(0, 180, 1280, 180);
  
  noStroke();
  fill(200, 200, 200, 50);
  rect(0, 580, 1280, 580);
  
  noStroke();
  fill(200, 200, 200, 50);
  rect(0, 0, 1280, 720);

  myColor.update();
  stroke(255);
  fill(120, 1);
  //background(50);
  triangles = new ArrayList<Triangle>();
  Particle p1, p2;

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, 60);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, -60);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, 30);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, -30);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, -90);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, 90);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, 60);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, 30);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, -30);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, -60);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, -90);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, 90);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-20) / 20);
  translate(0, 270);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-20) / 20);
  translate(0, -270);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(20) / 20);
  translate(0, -270);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(20) / 20);
  translate(0, 270);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(20) / 20);
  translate(0, 330);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-20) / 20);
  translate(0, 330);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-20) / 20);
  translate(0, -330);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(20) / 20);
  translate(0, -330);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(10) / 20);
  translate(0, -330);
  triangle(-120, 120, 0, -120, 120, 120);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-10) / 20);
  translate(0, -330);
  triangle(-120, 120, 0, -120, 120, 120);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(10) / 20);
  translate(0, 330);
  triangle(120, -120, 0, 120, -120, -120);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-10) / 20);
  translate(0, 330);
  triangle(120, -120, 0, 120, -120, -120);
  popMatrix();

  stroke(255);
  noFill();
  triangle(640, 240, 501, 480, 779, 480);

  stroke(255);
  noFill();
  ellipse(640, 360, 120, 120);

  stroke(255);
  noFill();
  ellipse(640, 360, 240, 240);

  stroke(255);
  noFill();
  ellipse(width/2, height/2, 480, 480);

  for (int i = 0; i < NB_PARTICLES; i++) {
    parts[i].move();
  }

  for (int i = 0; i < NB_PARTICLES; i++) {
    p1 = parts[i];
    p1.neighboors = new ArrayList<Particle>();
    p1.neighboors.add(p1);
    for (int j = i+1; j < NB_PARTICLES; j++) {
      p2 = parts[j];
      float d = PVector.dist(p1.pos, p2.pos);
      if (d > 0 && d < Particle.DIST_MAX) {
        p1.neighboors.add(p2);
      }
    }
    if (p1.neighboors.size() > 1) {
      addTriangles(p1.neighboors);
    }
  }
  drawTriangles();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, 60);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, -60);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, 30);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, -30);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, -90);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(30) / 20);
  translate(0, 90);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, 60);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, 30);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, -30);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, -60);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, -90);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-30) / 20);
  translate(0, 90);
  triangle(-30, 30, 0, -30, 30, 30);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-20) / 20);
  translate(0, 270);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-20) / 20);
  translate(0, -270);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(20) / 20);
  translate(0, -270);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(20) / 20);
  translate(0, 270);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(20) / 20);
  translate(0, 330);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-20) / 20);
  translate(0, 330);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-20) / 20);
  translate(0, -330);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(20) / 20);
  translate(0, -330);
  triangle(-60, 60, 0, -60, 60, 60);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(10) / 20);
  translate(0, -330);
  triangle(-120, 120, 0, -120, 120, 120);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-10) / 20);
  translate(0, -330);
  triangle(-120, 120, 0, -120, 120, 120);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(10) / 20);
  translate(0, 330);
  triangle(120, -120, 0, 120, -120, -120);
  popMatrix();

  pushMatrix();
  translate(width/2, height/2);
  rotate(frameCount*radians(-10) / 20);
  translate(0, 330);
  triangle(120, -120, 0, 120, -120, -120);
  popMatrix();

  stroke(255);
  noFill();
  triangle(640, 240, 501, 480, 779, 480);

  stroke(255);
  noFill();
  ellipse(640, 360, 120, 120);

  stroke(255);
  noFill();
  ellipse(640, 360, 240, 240);

  stroke(255);
  noFill();
  ellipse(width/2, height/2, 480, 480);

  if (mouseX < pos.x) acc.add(lWind);
  if (mouseX > pos.x) acc.add(rWind);
  acc.add(grav);

  vel.add(acc);
  pos.add(vel);

  acc.mult(0);

  noFill();
  //triangle(pos.x, pos.y, pos.x-60, pos.y-104, pos.x+60, pos.y-104);

  noFill();
  //triangle(pos.x, pos.y, pos.x-60, pos.y+104, pos.x+60, pos.y+104);

  noFill();
  //triangle(pos.x, pos.y-52, pos.x-60, pos.y+52, pos.x+60, pos.y+52);

  noFill();
  //triangle(pos.x, pos.y+52, pos.x-60, pos.y-52, pos.x+60, pos.y-52);


  if (pos.y > 550) vel.y = ((height - mouseY) * -1) / 7;

  if (pos.x > width) acc.add(lWind);
  if (pos.x < 0) acc.add(rWind);
}

class ExpandingCircle {
  int x,y;
  float radius;
  color c;
  boolean transparencyOn;
  int transparency;
 
  ExpandingCircle(int x, int y, boolean transparencyOn) {
    this.x = x;
    this.y = y;
    this.transparencyOn = transparencyOn;
    c = color(random(150, 255),random(150, 255),random(150, 255), 150);
    //c = color(random(255), 100);
    //c = color(255, 150);
    transparency = 255;
  }
  void update() {
    radius++;
    if (transparencyOn && radius >= 50 && transparency > 0) { transparency--; }
  }
 
  void display() {
    noStroke();
    fill(c,transparency);
    ellipse(x,y,radius,radius);
  }
}

void drawTriangles()
{
  noStroke();
  fill(myColor.R, myColor.G, myColor.B, 13);
  stroke(max(myColor.R-15, 0), max(myColor.G-15, 0), max(myColor.B-15, 0), 13);
  //noFill();
  beginShape(TRIANGLES);
  for (int i = 0; i < triangles.size (); i ++)
  {
    Triangle t = triangles.get(i);
    t.display();
  }
  endShape();
}

void addTriangles(ArrayList<Particle> p_neighboors)
{
  int s = p_neighboors.size();
  if (s > 2)
  {
    for (int i = 1; i < s-1; i ++)
    {
      for (int j = i+1; j < s; j ++)
      {
        triangles.add(new Triangle(p_neighboors.get(0).pos, p_neighboors.get(i).pos, p_neighboors.get(j).pos));
      }
    }
  }
}

void mousePressed()
{
  if (mouseButton == RIGHT) { circles.add(new ExpandingCircle(mouseX,mouseY,false));
  } else { circles.add(new ExpandingCircle(mouseX,mouseY,true)); }
  
  myColor.init();
}

void keyPressed() {
  if (key == ' ') { circles.clear(); }}

class MyColor
{
  float R, G, B, Rspeed, Gspeed, Bspeed;
  final static float minSpeed = .7;
  final static float maxSpeed = 1.5;
  MyColor()
  {
    init();
  }

  public void init()
  {
    R = random(50, 255);
    G = random(50, 255);
    B = random(50, 255);
    Rspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Gspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
    Bspeed = (random(1) > .5 ? 1 : -1) * random(minSpeed, maxSpeed);
  }

  public void update()
  {
    Rspeed = ((R += Rspeed) > 255 || (R < 0)) ? -Rspeed : Rspeed;
    Gspeed = ((G += Gspeed) > 255 || (G < 0)) ? -Gspeed : Gspeed;
    Bspeed = ((B += Bspeed) > 255 || (B < 0)) ? -Bspeed : Bspeed;
  }
}

class Particle
{
  final static float RAD = 4;
  final static float BOUNCE = -1;
  final static float SPEED_MAX = 2.2;
  final static float DIST_MAX = 50;
  PVector speed = new PVector(random(-SPEED_MAX, SPEED_MAX), random(-SPEED_MAX, SPEED_MAX));
  PVector acc = new PVector(0, 0);
  PVector pos;
  //neighboors contains the particles within DIST_MAX distance, as well as itself
  ArrayList<Particle> neighboors;

  Particle()
  {
    pos = new PVector (random(width), random(height));
  }

  public void move()
  {   
    pos.add(speed);

    acc.mult(0);

    if (pos.x < 0)
    {
      pos.x = 0;
      speed.x *= BOUNCE;
    } else if (pos.x > width) {
      pos.x = width;
      speed.x *= BOUNCE;
    }
    if (pos.y < 0) {
      pos.y = 0;
      speed.y *= BOUNCE;
    } else if (pos.y > height) {
      pos.y = height;
      speed.y *= BOUNCE;
    }
  }

  public void display() {
    fill(255, 14);
    ellipse(pos.x, pos.y, RAD, RAD);
  }
}

class Triangle {
  PVector A, B, C;

  Triangle(PVector p1, PVector p2, PVector p3) {
    A = p1;
    B = p2;
    C = p3;
  }

  public void display() {
    vertex(A.x, A.y);
    vertex(B.x, B.y);
    vertex(C.x, C.y);
  }
  
}




