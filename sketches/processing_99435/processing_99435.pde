
//Mover myball;
//import processing.video.*;

ArrayList balls;
PVector location= new PVector(0, 0);
PVector speed= new PVector(0, 0);
PVector acceleration= new PVector(0, 0);
PVector wind = new PVector(0.01, 0);
PVector gravity;// = new PVector(0, 0.001);
float mass;
//MovieMaker theMovie;
//boolean blnRecordMovie, blnStopMovie;

void setup() {
  size(400, 400);
  textSize(16);
  balls = new ArrayList();
  /*location = new PVector(width/3,height/3);//(random(width), random(height/3));
  mass=2;
  balls.add(new Mover(location, mass));
  location = new PVector(width/2,height/3);//(random(width), random(height/3));
  mass=random(3);
  balls.add(new Mover(location, mass));*/
  for (int i=0;i<43;i++) {
    location = new PVector(random(width),height/3);//(random(width), random(height/3));
    mass=random(2, 5);
    balls.add(new Mover(location, mass));
  }
  //------------quicktime
  //theMovie = new MovieMaker(this, width, height, "myMovie.mov", 
  //30, MovieMaker.ANIMATION, MovieMaker.MEDIUM);

  //blnRecordMovie = false;
}

void draw() {
  background(255);
  fill(0, 102, 153);
  for (int j=0;j<balls.size();j++) {
    Mover myball = (Mover) balls.get(j);
    gravity= new PVector(0, 0.01*myball.mass);
    
    if (mousePressed) { 

      myball.applyForce(wind);
    }
    myball.applyForce(gravity);
    myball.Move();
    myball.display();
    myball.checkEdges();
    myball.collide();
  }
  //------------quicktime record after everything is drawn!
  /*if (blnRecordMovie) {
    theMovie.addFrame();
  }*/
  //saveFrame();
}
void keyPressed() {
  if (key == 'p') {
    acceleration.x+=0.001;
    acceleration.y+=0.01;
  }
  if (key == 'm') {
    acceleration.x-=0.001;
    acceleration.y-=0.01;
  }
  if (key == 'n') {
    location = new PVector(random(width), random(height/3));
    mass=random(2, 8);
    balls.add(new Mover(location, mass));
  }
  /*if (key == 'r') {
    if (blnRecordMovie == false) {
      //start recording
      blnRecordMovie = true;
      println("I have STARTED recording!!!");
    }
    if (key == 's') {
      theMovie.finish();
      println("I have STOPPED recording!!!");
    }
  }*/
}

class Mover {
  PVector location = new PVector();
  PVector speed = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  float mass;
  Mover(PVector location, float mass) {
    this.location=location;
    this.mass=mass;
  }
  void Move() {
    speed.add(acceleration);
    location.add(speed);
    acceleration.mult(0);
  }
  void checkEdges(){
    if (location.x > width-mass*3/2) { 
      speed.x *= -1;
    } 
    else if (location.x < mass*3/2) { 
      speed.x *= -1;
    }
    if (location.y > height-mass*3/2) { 
      speed.y *= -1;
    } 
    else if (location.y < mass*3/2) { 
      speed.y *= -1;
    }
  }
  void applyForce(PVector force){
    PVector f = force.get();  // make a copy
    f.div(mass);
    acceleration.add(f);
  }
  void collide() {
    for (int i=0; i < balls.size() -1; i++) {
      Mover ballA = (Mover) balls.get(i);
      for (int j= i+1; j < balls.size(); j++) {
        Mover ballB = (Mover) balls.get(j);
        if (!ballA.equals(ballB) && ballA.location.dist(ballB.location) < (ballA.mass*3/2+ ballB.mass*3/2)) {
          bounce(ballA,ballB);
        }
      }
    }
  }
  void display() {
    noStroke(); 
    fill(0); 
    ellipse(location.x, location.y, mass*3, mass*3);
  }
  
  void bounce(Mover ballA, Mover ballB) {
    PVector ab = new PVector();
    ab.set(ballA.location);
    ab.sub(ballB.location);
    ab.normalize();
    while(ballA.location.dist(ballB.location) < (ballA.mass*3/2 + ballB.mass*3/2)) {   //*spring) {
      ballA.location.add(ab);
    }
    PVector n = PVector.sub(ballA.location, ballB.location);
    n.normalize();
    PVector u = PVector.sub(ballA.speed, ballB.speed);
    PVector un = componentVector(u,n);
    u.sub(un);
    ballA.speed = PVector.add(u, ballB.speed);
    ballB.speed= PVector.add(un, ballB.speed);
  }

  PVector componentVector (PVector vector, PVector directionVector) {
    directionVector.normalize();
    directionVector.mult(vector.dot(directionVector));
    return directionVector;
  }
}



