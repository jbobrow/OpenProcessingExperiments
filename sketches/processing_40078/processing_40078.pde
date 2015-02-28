
class Graph {
  float topleftx,toplefty,bottomrightx,bottomrighty;
  ArrayList valpoints;
  float speed;
  float middle;
  color col;
  Graph(float ttopleftx,float ttoplefty,float tbottomrightx,float tbottomrighty,color tcol) {
    topleftx = ttopleftx;
    toplefty = ttoplefty;
    bottomrightx = tbottomrightx;
    bottomrighty = tbottomrighty;
    col = tcol;
    valpoints = new ArrayList(0);
    middle = (toplefty+bottomrighty)/2;
    speed = 3;
  }
  void update(float val) {
    noStroke();
    fill(100,100,100,10);
    rect(topleftx,toplefty,bottomrightx,bottomrighty);
    for(int i=valpoints.size()-1;i>=0;i--) {
      PVector segment = (PVector) valpoints.get(i);
      if(i != 0) {
        PVector psegment = (PVector) valpoints.get(i-1);
        pushMatrix();
        stroke(col);
        strokeJoin(ROUND);
        strokeWeight(2);
        translate(0,middle);
        line(segment.x,segment.y,psegment.x,psegment.y);
        popMatrix();
        segment.x -= speed;
        if(segment.x<topleftx) {
          valpoints.remove(0);
        }
      }
    }
    stroke(0);
    line(topleftx,middle,bottomrightx,middle);
    valpoints.add(new PVector(bottomrightx,-val*20));

  }
}

class Body {
  float mass;
  PVector position;
  PVector velocity;
  PVector acceleration;
  float arrowScale;
  color col;
  float rad;
  float collisionrad;
  Body(float startx,float starty,color tcol) {
    mass = random(40)+4;
    position = new PVector(startx,starty);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    arrowScale = 10;
    col = tcol;
    rad = 10*sqrt(mass);
    collisionrad = rad/2;
  }
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    if(position.x<collisionrad) {
      position.x = collisionrad;
      velocity.x *= -1;
    }
    if(position.x>width-collisionrad) {
      position.x = width-collisionrad;
      velocity.x *= -1;
    }
    if(position.y<collisionrad) {
      position.y = collisionrad;
      velocity.y *= -1;
    }
    if(position.y>height-collisionrad) {
      position.y = height-collisionrad;
      velocity.y *= -1;
    }
  }
  void display() {
    fill(col);
    noStroke();
    ellipseMode(CENTER);
    ellipse(position.x,position.y,rad,rad);
    new Vector(position,PVector.add(position,PVector.mult(velocity,arrowScale)),color(0,0,255),mass/20.);
    new Vector(position,PVector.add(position,PVector.mult(acceleration,arrowScale*50.)),color(255,0,0),mass/10.);
    fill(0.);
    text(mass,position.x-20,position.y-rad/2.);
  }
  void applyForce(float forcex,float forcey) {
    acceleration = PVector.div(new PVector(forcex,forcey),mass);
  }
}
  
  
  
  
class Vector {
  PVector start;
  PVector end;
  PVector vcomponent;
  float ang;
  float magnitude;
  color col;
  float weight;

  Vector(PVector tempstart, PVector tempend, color tempcol, float tempweight) {
    start = tempstart;
    end = tempend;
    col = tempcol;
    weight = tempweight;
    update();
    display();
  }
  void update() {
    vcomponent = PVector.sub(end,start);
    ang = atan2(vcomponent.x,vcomponent.y);
    magnitude = dist(0,vcomponent.x,0,vcomponent.y);
  }
  void display() {
    stroke(col);
    fill(col);
    strokeWeight(weight);
    line(start.x,start.y,end.x,end.y);
    pushMatrix();
    translate(end.x,end.y);
    rotate(-ang);
    strokeJoin(MITER);
    quad(0,0,-6,0,0,6,6,0);
    popMatrix();
  }
}
Graph velgraph;
Graph accgraph;
Graph velgraphx;
Graph velgraphy;
Graph accgraphx;
Graph accgraphy;

PFont font;
ArrayList bodies;
Body active;
float cutoff;
float forcemag;

/*int leng;
PVector[] vectors; */
void setup() {
  size(800,600);
  font = loadFont("Silom-48.vlw");
  textFont(font,12);
  cutoff = 12;
  bodies = new ArrayList(0);
  bodies.add(new Body(random(width),random(height),color(0,255,0)));
  velgraph = new Graph(0,height-100,width,height+100,color(0,0,255));
  accgraph = new Graph(0,height-100,width,height+100,color(255,0,0));
  velgraphx = new Graph(0,0,width/2,200,color(0,0,255));
  accgraphx = new Graph(0,0,width/2,200,color(255,0,0));
  velgraphy = new Graph(width/2,0,width,200,color(0,0,255));
  accgraphy = new Graph(width/2,0,width,200,color(255,0,0));
  active = (Body) bodies.get(bodies.size()-1);
  /*leng = 7;
  vectors = new PVector[leng];
  for (int i = 0;i < leng;i++) {
    vectors[i] = new PVector(random(width),random(height));
    if(i != 0) {
      Vector vector = new Vector(vectors[i-1],vectors[i]);
      vector.update();
      vector.display();
    }
  }  */
}
void mouseClicked() {
  if (mouseButton == RIGHT) {
    for (int i=bodies.size()-2;i>=0;i--) {
      bodies.remove(i);
    }
  }  else {
    Body pbody = (Body) bodies.get(bodies.size()-1);
    pbody.col = color(100,100,100);
    bodies.add(new Body(random(width),random(height),color(0,255,0)));
    active = (Body) bodies.get(bodies.size()-1);
  }
}

void draw() {
  background(255);
  noStroke();
  fill(200,200,100);
  ellipse(mouseX,mouseY,40,40);
  for(int i=bodies.size()-1;i>=0;i--) {
    Body body = (Body) bodies.get(i);
    float distance = dist(mouseX,mouseY,body.position.x,body.position.y);
    if (distance > cutoff) {
      forcemag = 100./distance/distance;
    } else {
      forcemag = 100./cutoff/cutoff;
    }
    body.update();
    body.display();
    body.applyForce(forcemag*(mouseX-body.position.x),forcemag*(mouseY-body.position.y));
  }
  velgraph.update(active.velocity.mag());
  accgraph.update(active.acceleration.mag()*10);
  velgraphx.update(active.velocity.x);
  velgraphy.update(active.velocity.y);
  accgraphx.update(active.acceleration.x*10);
  accgraphy.update(active.acceleration.y*10);
  fill(0,0,255);
  text("speed",width/2-100,height-100);
  fill(0);
  text("              and                                vs. time",width/2-100,height-100);
  text("vx and ax vs. time",width/4,210);
  text("vy and ay vs. time",width/4*3,210);
  fill(255,0,0);
  text("                      |acceleration|",width/2-100,height-100);
}

