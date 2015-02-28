


import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

ArrayList<Mover> movers;

Box2DProcessing box2d;    

Boundary wall;
float wheredamouseatX, wheredamouseatY, wheredamouseat;;
PFont font;
PImage doge;
int bounce;
int time;



void setup() {
  size(1000, 750);
  box2d = new Box2DProcessing(this);  
  box2d.createWorld();

  movers = new ArrayList<Mover>();

  millis();
  doge = loadImage("dogenowords2.jpg");
  font = loadFont("ComicSansMS-Bold-40.vlw");
  randomSeed(1);

  bounce = 2;
  millis();
  time = 0;
  wall = new Boundary(width/2, height-5, width, 60);
  wheredamouseat = 0;
  wheredamouseatX = 0;
  wheredamouseatY = 0;
}

void draw() {
  background(255);
  image(doge, 0, 0);
  box2d.step();
  time = millis();
  //println(time);


  for (int i = 0; i < movers.size(); i++) {

    movers.get(i).display();
  }

  wall.display();
}

void mousePressed() {
  
  Mover p = new Mover(mouseX, mouseY, 20);
  movers.add(p);
// println("mouseX " + mouseX, " mouseY " + mouseY, " wheredamouseatX " + wheredamouseatX, " wheredamouseatY " + wheredamouseatY);
}


//from The Nature of Code  Daniel Shiffman, example 5_09

class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  
  // But we also have to make a body for box2d to know about it
  Body b;

  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
    
    b.setUserData(this);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }

}


class Mover {

  Body body;
  float w =  random(9, 20);
  float h = random(9, 20);
  float r;
  int lifespan = 3000 - time;

  //  String[] words = { 
  //    "wow", "much processing", "very Java", "much codee", "very scare", 
  //    "wow", "box2d", "toxilibs", "very fixture", "much bounce",
  String[] superlatives = {
    "such", "very", "wow", "lol", "much"
  };
  String[] subjects = {
    "box2d", "shiffman", "boids", "physics", "processing", "box2d", "scare", "H-E-L-P", "math", "libraries", "homewokr"
  };

  //  int index = int(random(words.length)); 
  //int index = int(superlatives[superlativeIndex] + " " + subjects[subjectIndex]);
  int superlativeIndex = int(random(superlatives.length));
  int subjectIndex = int(random(subjects.length));


  color[] ArrayOfColors = { 
    color(181, 230, 29), color(63, 72, 204), color(255, 174, 201), color(0, 162, 232), color(255, 127, 39), color(255, 242, 0), color(136, 0, 21), color(212, 176, 190), color(207, 209, 100), color(200, 120, 87)
  };
  color rgb = (ArrayOfColors[(int) random(ArrayOfColors.length)]); 
  int fontSize = int(random(20, 50));
  //  for (int s = 0 ; s<10; s++) {
  //    // int superlativeIndex = int(random(superlatives.length));
  //    // int subjectIndex = int(random(subjects.length));
  //    println(superlatives[superlativeIndex] + " " + subjects[subjectIndex]);
  //  }
  //}
  Mover(float x, float y, float r_) {
    r = r_;
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x, y));
    body = box2d.createBody(bd);

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w);
    float box2dH = box2d.scalarPixelsToWorld(h);  // Box2D considers the width and height of a
    ps.setAsBox(box2dW, box2dH);            // rectangle to be the distance from the
    // center to the edge (so half of what we
    // normally think of as width or height.) 
    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    // Parameters that affect physics
    fd.density = 0.1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    // Attach Fixture to Body               
    body.createFixture(fd);
    lifespan = 3000;
  }


  void display() {
    // if (isDead == false) {
    Vec2 pos = box2d.getBodyPixelCoord(body);    
    float a = body.getAngle();
    wheredamouseat = fontSize;

    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();


    rectMode(CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    textFont(font, fontSize);
    rotate(-a);
    noStroke();
    //  strokeWeight(2);
    beginShape();
    //println(vertices.length);
    // For every vertex, convert to pixel vector
    for (int i = 0; i < ps.getVertexCount(); i++) {
      //Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
      fill(rgb);

      text(((superlatives[superlativeIndex] + " " + subjects[subjectIndex])), w, h);
    }
    endShape(CLOSE);
    popMatrix();
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan >= 3000) {
      return true;
    } 
    else {
      return false;
    }
  }

  void makeBody(Vec2 center) {

    Vec2[] vertices = new Vec2[4];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-15, 25));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(15, 0));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(20, -15));
    vertices[3] = box2d.vectorPixelsToWorld(new Vec2(-10, -10));

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape ps = new PolygonShape();
    ps.set(vertices, vertices.length);

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    body.createFixture(ps, 1.0);


    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }
}



