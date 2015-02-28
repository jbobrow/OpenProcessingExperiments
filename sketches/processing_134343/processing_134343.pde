
ArrayList<Cluster> clusters;
int statusBG;


void setup(){
  size(1250, 800);
  smooth();
  noStroke();
  
  statusBG = 0;
  
  clusters = new ArrayList<Cluster>();
  
  for(int i=100; i<width-50; i+=150){
    for(int j=100; j<height-50; j+=150){
      clusters.add(new Cluster(i, j));
    }
  }
  
  
  
//  clusters.add(new Cluster(width/2-100, height/2));  
//  clusters.add(new Cluster(width/2+100, height/2));
  
}

void draw(){
  
  if(statusBG%3==2)
    background(255);
  if(statusBG%3==0)
    background(0);
  if(statusBG%3==1) {
    background(255);
    for(Cluster c: clusters) {
        c.alpha = 250;
    }  
    for(int i=100; i<width-50; i+=150){
      for(int j=100; j<height-50; j+=150){
        pushStyle();
        fill(245);
        ellipse(i,j,80,80);
        popStyle();
      }
    }
  } else {
      for(Cluster c: clusters) {
        c.alpha = 200;
      }  
  }
  
  for(Cluster c: clusters) {
    c.update();
    c.display();
  }
  
//  stroke(200);
//  line((width/2)+levelH*sin(change),0,(width/2)+levelH*sin(change),height);
//  line(0,(height/2)+levelH*sin(change),width,(height/2)+levelH*sin(change));
  
  
  // show frame rate
  fill(200);
  text(int(frameRate), 20, 20);
}

void mouseReleased(){
  statusBG ++;
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

  void updateY() {

    loc.y += random(change);
  }
  
  void updateX() {

    loc.x += random(change);
  }

  void detectEdge(float _x, float _y) {

    if (loc.y >= _y || loc.y < _y || loc.x >= _x || loc.x < _x)
      change *= -1;
  }
}


class Cluster{
  
  Circle c1;
  Circle c2;
  Circle c3;
  Circle c4;
  
  int levelC;
  int levelH;
  int circleY;
  float randR;
  float randG;
  float randB;
  int alpha;
  float change;
  float centerX;
  float centerY;
  
  
  
  
  Cluster(float _centerX, float _centerY) {
    centerX = _centerX;
    centerY = _centerY;
    levelH = 100;
    levelC = 20;
    change = 0;
    
    
    c1 = new Circle(centerX+levelC*sin(change), centerY, 5);
    c2 = new Circle(centerX-levelC*sin(change), centerY, 5);    
    c3 = new Circle(centerX+levelC*sin(change), centerY-25, 5);
    c4 = new Circle(centerX-levelC*sin(change), centerY-25, 5);
    
    randR = 141;
    randG = 200;
    randB = 216;
    alpha = 200;
  }
  
  
  
  
  void update(){
    // circles
    c1.updateY();
    c2.updateY();
    c3.updateX();
    c4.updateX();
    
    c1.detectEdge(centerX+levelH*sin(change),centerY+levelH*sin(change));
    c2.detectEdge(centerX+levelH*sin(change),centerY+levelH*sin(change));
    c3.detectEdge(centerX+levelH*sin(change),centerY+levelH*sin(change));
    c4.detectEdge(centerX+levelH*sin(change),centerY+levelH*sin(change));
    
    c1.loc.x = centerX+levelC*sin(change);
    c2.loc.x = centerX-levelC*sin(change);
    
    c3.loc.y = centerY+levelC*sin(change);
    c4.loc.y = centerY-levelC*sin(change);
        
    change += 0.01;
  
  }
  
  void display(){
//    c1.display();
//    c2.display();
//    c3.display();
//    c4.display();

    //leftA
    fill(212,236,207,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c1.loc.x, c1.loc.y);
    vertex(c2.loc.x ,c2.loc.y);
    vertex(centerX, centerY);
    endShape();
    
    fill(200,236,207,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c1.loc.x-20, c1.loc.y);
    vertex(c2.loc.x-20, c2.loc.y);
    vertex(centerX, centerY);
    endShape();
    
    //leftB
    beginShape();
    vertex(centerX, centerY);
    vertex(c3.loc.x, c3.loc.y);
    vertex(c4.loc.x ,c4.loc.y);
    vertex(centerX, centerY);
    endShape();
    
    beginShape();
    vertex(centerX, centerY);
    vertex(c3.loc.x-20, c3.loc.y);
    vertex(c4.loc.x-20, c4.loc.y);
    vertex(centerX, centerY);
    endShape();
    
        
    //rightA
    fill(171,250,246,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c2.loc.x, c2.loc.y);
    vertex(c1.loc.x ,c1.loc.y);
    vertex(centerX, centerY);
    endShape();
    
    fill(171,250,246,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c2.loc.x+20, c2.loc.y-10);
    vertex(c1.loc.x+20, c1.loc.y-10);
    vertex(centerX, centerY);
    endShape();
    
    //rightB
    fill(171,250,246,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c4.loc.x, c4.loc.y);
    vertex(c3.loc.x ,c3.loc.y);
    vertex(centerX, centerY);
    endShape();
    
    fill(171,250,246,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c4.loc.x+20, c4.loc.y-10);
    vertex(c3.loc.x+20, c3.loc.y-10);
    vertex(centerX, centerY);
    endShape();    

    //topA
    fill(255,246,226,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c2.loc.x, c2.loc.y);
    vertex(c1.loc.x ,c1.loc.y);
    vertex(centerX, centerY);
    endShape();
    
    fill(255,206,206,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c2.loc.x+20, c2.loc.y-10);
    vertex(c1.loc.x-20, c1.loc.y-10);
    vertex(centerX, centerY);
    endShape();
    
    //topB
    fill(255,246,226,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c4.loc.x, c4.loc.y);
    vertex(c3.loc.x ,c3.loc.y);
    vertex(centerX, centerY);
    endShape();
    
    fill(255,206,206,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c4.loc.x+20, c4.loc.y-10);
    vertex(c3.loc.x-20, c3.loc.y-10);
    vertex(centerX, centerY);
    endShape();
    
    //bottomA
    fill(255,250,100,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c1.loc.x, c1.loc.y);
    vertex(c2.loc.x ,c2.loc.y);
    vertex(centerX, centerY);
    endShape();
    
    fill(240,250,29,alpha-50);
    beginShape();
    vertex(centerX, centerY);
    vertex(c1.loc.x+30, c1.loc.y-10);
    vertex(c2.loc.x-30, c2.loc.y-10);
    vertex(centerX, centerY);
    endShape();
    
    //bottomB
    fill(255,250,100,alpha);
    beginShape();
    vertex(centerX, centerY);
    vertex(c3.loc.x, c3.loc.y);
    vertex(c4.loc.x ,c4.loc.y);
    vertex(centerX, centerY);
    endShape();
    
    fill(240,250,29,alpha-50);
    beginShape();
    vertex(centerX, centerY);
    vertex(c3.loc.x+30, c3.loc.y-10);
    vertex(c4.loc.x-30, c4.loc.y-10);
    vertex(centerX, centerY);
    endShape();
   
        
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
