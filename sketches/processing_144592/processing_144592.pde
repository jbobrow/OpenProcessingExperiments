
Mover []myMover;
Attractor myAttractor;

void setup() {
  size(500, 500,P2D);
  background(0);
  //  PVector vol = new PVector(0.0, 0.0);
  //  PVector loc = new PVector(width/2, 0.0);
  //  PVector acc = new PVector(0.0, 0.0);
  myMover = new Mover[500];
  for (int i = 0 ; i< myMover.length ; i++) {
    PVector vol = new PVector(0.0, 0.0);
    PVector loc = new PVector(random(width), random(height));
    PVector acc = new PVector(0.0, 0.0);
    myMover[i] = new Mover(vol, loc, acc);
  }
}

void draw() {
  //blendMode(ADD);
  background(0);
  
  
  myAttractor = new Attractor();
  PVector gravity = new PVector(0, 0.01);
  for (int i = 0 ; i< myMover.length ; i++) {
  PVector attractorForce = myAttractor.attractorForce(myMover[i]);
  //PVector friction = PVector.mult(attractorForce, -1);
  myMover[i].applyForce(attractorForce);

  float c = 0.98;
  PVector friction = myMover[i].vol.get();
  friction.mult(-1); 
  friction.normalize();
  friction.mult(c);

  myMover[i].applyForce(friction);
  //myMover.applyForce(new PVector(0,0.01));
  myMover[i].update();
  myMover[i].display();
  }
}

class Attractor {
  float mass;
  PVector location;
  float G;

  Attractor() {
    location = new PVector(mouseX, mouseY);
    mass = 10;
    G = 40;
  }

  PVector attractorForce(Mover myMover ) {
    PVector force = PVector.sub(location,myMover.loc);
    float distance = force.mag();
//    if(distance <=5){
//      force = new PVector(0,0);
//    }
    distance = constrain(distance,24,25.0);//保证后面的受力是在某一个范围之内
    force.normalize();
    float strength = (G*mass*myMover.mass)/(distance*distance);
    force.mult(strength);
    //println(distance);
    return force;

  }
}

class Mover{
  PVector vol;
  PVector loc;
  PVector acc;
  float mass = 10.0;
  PImage img;
  
  Mover(PVector _vol,PVector _loc,PVector _acc){
    vol = _vol;
    loc = _loc; 
    acc = _acc;
    img = loadImage("texture.png");
  }
  
  void applyForce(PVector _f){
    PVector force = _f;
    force.div(mass);
    acc.add(force);
  }
  
  void update(){
    vol.add(acc);
    loc.add(vol);
    acc.mult(0);
  }
  
  void display(){
    noStroke();
    fill(#00B9FF);
    ellipse(loc.x,loc.y,3,3);
    
//    imageMode(CENTER);
//    tint(#00B9FF);
//    image(img,loc.x,loc.y,5.5,5.5);
    
  }
  
}


