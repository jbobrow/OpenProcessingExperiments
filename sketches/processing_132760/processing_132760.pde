
int x, y;
float randR;
float randG;
float randB;
float change;

int levelC;
int levelH;
int circleY;
int interval;

Circle c1;
Circle c2;

void setup(){
  size(500, 500);
  smooth();
  noStroke();
  
  levelH = 23;
  levelC = 50;
  change = 0;
  
  circleY=0;
  interval = 10;
  
  c1 = new Circle(width/2+levelC*sin(change), circleY, 5);
  c2 = new Circle(width/2-levelC*sin(change), circleY, 5);
  
  randR = 141;
  randG = 200;
  randB = 216;
}

void draw(){
  background(255);
  
  // circles
  c1.update();
  c2.update();
  c1.detactEdge((height/2+200)+levelH*sin(change));
  c2.detactEdge((height/2+200)+levelH*sin(change));
  
//  c1.display();
//  c2.display();

  c1.loc.x = width/2+levelC*sin(change);
  c2.loc.x = width/2-levelC*sin(change);
      
  change += 0.03;
  
  //left
  fill(212,236,207,100);
  beginShape();
  vertex(0,0);
  vertex(c1.loc.x, c1.loc.y);
  vertex(c2.loc.x ,c2.loc.y);
  vertex(0, height);
  endShape();
  
  fill(200,236,207,100);
  beginShape();
  vertex(0,0);
  vertex(c1.loc.x-20, c1.loc.y-10);
  vertex(c2.loc.x-20, c2.loc.y-10);
  vertex(0, height);
  endShape();
  
  //right
  fill(255,230,139,100);
  beginShape();
  vertex(width,0);
  vertex(c2.loc.x, c2.loc.y);
  vertex(c1.loc.x ,c1.loc.y);
  vertex(width, height);
  endShape();
  
  fill(255,200,139,100);
  beginShape();
  vertex(width,0);
  vertex(c2.loc.x+20, c2.loc.y-10);
  vertex(c1.loc.x+20, c1.loc.y-10);
  vertex(width, height);
  endShape();
  
  //top
  fill(255,246,226,150);
  beginShape();
  vertex(0,0);
  vertex(c2.loc.x, c2.loc.y);
  vertex(c1.loc.x ,c1.loc.y);
  vertex(width, 0);
  endShape();
  
  fill(255,206,206,60);
  beginShape();
  vertex(0,0);
  vertex(c2.loc.x+20, c2.loc.y-10);
  vertex(c1.loc.x-20, c1.loc.y-10);
  vertex(width, 0);
  endShape();
  
  //bottom
  fill(141,200,216,80);
  beginShape();
  vertex(0,height);
  vertex(c1.loc.x, c1.loc.y);
  vertex(c2.loc.x ,c2.loc.y);
  vertex(width, height);
  endShape();
  
  fill(171,250,246,100);
  beginShape();
  vertex(0,height);
  vertex(c1.loc.x+30, c1.loc.y-10);
  vertex(c2.loc.x-30, c2.loc.y-10);
  vertex(width, height);
  endShape();
  
  // horizontal
  loadPixels();
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      int pixelLoc = x + width*y;
      float wave = (height/2+200)+levelH*sin(change);
      
      if(y<wave) {
//        randR = 255;
//        randG = 255;
//        randB = 255;
//        color c = color(randR,randG,randB);
//        pixels[constrain(pixelLoc, 0, pixels.length-1)] = c;
      } else {

        color c = color(randR,randG,randB);
        pixels[constrain(pixelLoc, 0, pixels.length-1)] = c;
      }
    }
  }
  

  updatePixels();
  
  // show frame rate
//  fill(200);
//  text(int(frameRate), 20, 20);
}

class Character{

  PVector location;
  PVector velocity;
  PVector acceleration;
  float w;
  float mass;
  int r,g,b,a;
  color c;
  float angle, angleOld, angleNew, angleChange;
  
  Character(float x, float y, float _w, color _c) {
    w = _w;
    mass = 5;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = _c;
    angle = 45;
    angleOld = 45;
    angleNew = 45;
    angleChange = 180;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    
  }
  
  void display() {
    noStroke();
    fill(c);
    angle = lerp(angle, angleNew, 0.02);
    
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(angle));
        
    
    rectMode(CENTER);
    rect(0, 0, w, w);
    ellipse(0+w, 0+w, w/5, w/5);
    ellipse(0+w, 0-w, w/5, w/5);
    ellipse(0-w, 0+w, w/5, w/5);
    ellipse(0-w, 0-w, w/5, w/5);
    popMatrix();
  }
  
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
    
    // once hit ground
    if (location.y > (height/2+50)) {
      velocity.y *= -1;
      location.y = height/2+50;
      angleNew += angleChange;
      //println(angle + " " + angleChange);
      
    } else if (location.y < 0) {
      location.y = 0;
      velocity.y *= -1;
    }
  }

}
class Circle {
  PVector loc;
  float radius;
  int change;


  Circle(float x, float y, float r) {
    loc = new PVector(x, y);
    radius = r;
    change = -1;
  }

  void display() {
    noStroke();
    fill(200);
    ellipse(loc.x, loc.y, radius, radius);
  }

  void update() {

    loc.y += change;
  }

  void detactEdge(float _y) {

    if (loc.y >= _y+20)
      change *= -1;
    if (loc.y < _y-height+50)
      change *= -1;
  }
}

class Dust {
  PVector loc;
  float radius, radiusOri;
  float speedX, speedY;
  float speedS, speedChange;
  int r;
  int g;
  int b;
  int alpha;
  int time;
  boolean fade;
  
  Dust(float _x, float _y, float _r){
    loc = new PVector(_x, _y);
    radius = _r;
    radiusOri = _r;
    r = 237;
    g = 20;
    b = 0;
    alpha = (int)(255/radius+80);
    
    speedX = random(2/(radius/2)+0.1);
    speedY = random(2/(radius/2)+0.1);
    speedS = random(10);
    speedChange = .1;
    time = (int)random(150);
    fade = false;
  }
  
  void display() {
    
    noStroke();
    fill(r, g, b, alpha);
    
    pushStyle();
    alpha = (int)(((255/radius+random(70,130)))/2 + abs(((255/radius+130))/2*sin(speedS)));
    
    ellipse(loc.x, loc.y, radius, radius);
    popStyle();

  }
  
  void update() {
    loc.x += random(-speedX,speedX);
    loc.y += random(-speedY,speedY);
    speedS += speedChange;
    radius += random(-radiusOri,radiusOri);
    radius = constrain(radius, 0, width/4);
  }
  
  
  void wind() {
    
    if (frameCount%(300-time) > 250-time){
      speedX += random(0.01);
      speedY += random(0.005);
    }
    else {
      speedX -= random(0.005);
      speedY -= random(0.001);
    }
  }
  
  
}


