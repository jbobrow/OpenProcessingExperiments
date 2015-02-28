

ArrayList<Dust> dusts;
Character blue, blueInner;
color dustColor;
color blueColor;


void setup(){
  size(500, 500);
  smooth();
  dusts = new ArrayList<Dust>();
  
  for (int i=0; i<width; i+=30) {
    for (int j=0; j<height; j+=30) {
      if (dist(i,j,width/2,height/2)>width/2.3){
        dusts.add(new Dust(i+random(-5,5),j+random(-5,5),20));
      }
    }
  }
  
  blueColor = color(38,234,233,100);
  blue = new Character(width/2, height/2-50, 30, blueColor);
  blueColor = color(38,234,233,230);
  blueInner = new Character(width/2, height/2-50, 20, blueColor);  
}

void draw(){
  background(0);
  
  for(Dust d: dusts){
    d.display();
    d.update();
  }

  blue.applyForce(new PVector(0,0.1));
  blue.update();
  blue.checkEdges();  
  blue.display();
  
  blueInner.applyForce(new PVector(0,0.1));
  blueInner.update();
  blueInner.checkEdges();  
  blueInner.display();

  //println(dusts.size());
  
  // show frame rate
//  fill(250);
//  text(int(frameRate), 20, 20);

}

void mouseReleased() {
  
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
    radius = constrain(radius, 0, width/5);
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


