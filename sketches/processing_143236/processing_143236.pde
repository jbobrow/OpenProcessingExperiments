
System particles;
Boolean renderMode = true;

void setup(){
  size(500,500);
  background(255);
  noFill();
  particles = new System();
  for (int i=0;i<500;i++){
    particles.addCircle();
  }
}

void draw(){
  if (!renderMode){
    background(255);
  }
  particles.interact();
  particles.update();
}

void keyPressed(){
  background(255);
}

void mouseClicked(){
  renderMode = !renderMode;
}
class Body {
  PVector pos, speed, accln;
  float mass;
  float drag = 0.999;
  
  Body(PVector pos_, PVector speed_, PVector accln_, float mass_){
    pos = pos_;
    speed = speed_;
    accln =  accln_;
    mass = mass_;
  }
  
  void update(){
    speed.add(accln);
    pos.add(speed);
    speed.mult(drag);
    
   // bounce off the walls
    if (pos.x<0){speed.x = -speed.x;}
    if (pos.x>width){speed.x = -speed.x;}
    if (pos.y<0){speed.y = -speed.y;}
    if (pos.y>height){speed.y = -speed.y;}
    accln.set(0,0,0);
  }
  
  void applyForce(PVector force){
    force.mult(1/mass);
    accln.add(force);
  }
  
  void changeSpeed(PVector newSpeed){
    speed = newSpeed;
  }
  
  void render(){
  }
}
class Circle extends Body {
  
  float r;
  
  Circle(PVector pos_, PVector speed_, PVector accln_, float mass_, float r_){
    super(pos_, speed_, accln_, mass_);
    r = r_;
  }
  
  void render(){
    ellipseMode(CENTER);
    fill(100,100);
    noStroke();
    ellipse(pos.x,pos.y,5,5);
  }
  
  void update(){
    super.update();
  }
  
  void applyForce(PVector force){
    super.applyForce(force);
  }
  
  void changeSpeed(PVector newSpeed){
    //super.changeSpeed(newSpeed);
  }
}
class Square extends Body {
  
  float r;
  
  Square(PVector pos_, PVector speed_, PVector accln_, float mass_, float r_){
    super(pos_, speed_, accln_, mass_);
    r = r_;
  }
  
  void render(){
    rectMode(CENTER);
  }
}
class System {
  ArrayList circles;
  ArrayList squares;
  
  System() {
    circles = new ArrayList();
    squares = new ArrayList();
  }
  
  void addCircle(){
    Circle p = new Circle(new PVector(random(0,width),random(0,height)),new PVector(random(-1,1),random(-1,1)),new PVector(0,0),10.0,10.0);
    circles.add(p);
  }
  
  void addSquare(){
    Square p = new Square(new PVector(random(0,width),random(0,height)),new PVector(random(-1,1),random(-1,1)),new PVector(0,0),10.0,10.0);
    squares.add(p);
  }
  
  void update() {
    for (int i = circles.size() - 1; i >= 0; i-- ) {
      Circle p = (Circle) circles.get(i);
      p.update();
      if (!renderMode){
        p.render();
      }
    }
    for (int i = squares.size() - 1; i >= 0; i-- ) {
      Square p = (Square) squares.get(i);
      p.update();
      p.render();
    }
  }
  
  void interact(){
    // self interact circles
    for (int i = circles.size() - 1; i >= 0; i-- ) {
      Circle p = (Circle) circles.get(i);
      for (int j = i; j >= 0; j-- ) {
        Circle q = (Circle) circles.get(j);
        PVector temp = PVector.sub(p.pos,q.pos);
        if (temp.mag()<20 & temp.mag()>1){
          temp.normalize();
          temp.mult(0.1);
          p.applyForce(temp);
          temp.mult(-1);
          q.applyForce(temp);
          if (renderMode){
              stroke(10*temp.mag(),10);
          } else {
              stroke(10*temp.mag(),100);
          }
          line(p.pos.x,p.pos.y,q.pos.x,q.pos.y);
        }
      }
    }
  }
}

