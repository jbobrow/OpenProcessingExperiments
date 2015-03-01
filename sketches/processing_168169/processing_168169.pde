
Mover[] movers = new Mover[20];

void setup() {
  size(600,600,P3D);
  lights();
  smooth();
  // Initializing all the elements of the array
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); 
  }
  
}

void draw() {
  background(0);
if (mousePressed){
  background(0);
    float delta = 5;
    float P=300;
    float cY= map(mouseY,0,600,0,255);
    
    for(float deg=0; deg<360; deg+= delta){
      for(float qDeg=0; qDeg<180; qDeg+= delta){
      float theta= radians(deg);
      float q= radians(qDeg);
      float r= P* sin(q);
      float x= r* cos(theta);
      float y= r* sin(theta);
      float z= P* cos(q);
      
      stroke(cY,60,z);
      point(mouseX+x,mouseY+y,z);
      
      float thetaB= 6.28-theta;
      float qB= 3.14-q;
      float rB= P* sin(qB);
      float xB= rB* cos(thetaB);
      float yB= rB* sin(thetaB);
      float zB= P* cos(thetaB);
      
      stroke(255-cY,zB,40,220);
      strokeWeight(random(0,6));
      point(mouseX-xB,mouseY-yB,zB);
      }
    }
}


  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display(); 
  }
}

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  float Q= random(0,3.14);
  float P= random(10,80);
      float zC= P* cos(Q);

  Mover() {
    location = new PVector(random(width),random(height),random(zC));
    velocity = new PVector(0,0);
    topspeed = 4;
  }

  void update() {

    PVector mouse = new PVector(mouseX,mouseY,zC);
    PVector dir = PVector.sub(mouse,location);  
    dir.normalize();     
    dir.mult(0.5);      
    acceleration = dir;  

    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    float cY= map(mouseY,0,600,0,255);
    
    stroke(cY,zC,100,200);
    pushMatrix();
    translate(location.x-P,location.y+P,zC);
    sphere(random(0,60));
    popMatrix();
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }

  }

}

