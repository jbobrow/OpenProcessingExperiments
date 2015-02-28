
//for manus nightsky on lsd reduce particle to 100 and activate the connect function!
//else: disable connect function and run up to 700 particles
Particle[] particle = new Particle[150];

void setup() {
  size(850, 850);
  smooth();
  background(0);
  // Initializing all the elements of the array
  for (int i = 0; i < particle.length; i++) {
    particle[i] = new Particle(i);
  }
}

void draw() {
    background(0);

 // noStroke();
 // fill(0, 20);
//  rect(0, 0, width, height);
  for (int i = 0; i < particle.length; i++) {
    particle[i].update();
    particle[i].checkEdges();
    particle[i].display();
    particle[i].connect(); //performance issue... :(
  }
}

class Particle {

  PVector pos;
  PVector vel;
  PVector accel;
  float topspeed;

  float rad;
  float grav=0;
  PVector decel;
  PVector[] randPos = new PVector[5];
  color farbe;

  Particle(int j) {
    pos = new PVector(random(width/2-j,width/2+j), random(height/2-j,height/2+j));
    vel = new PVector(random(-1.3,1.3),0);
    topspeed = 20;
    farbe=color(random(150,255),random(0,10),random(20,100),200);
    rad = random(2,15);
    for(int i=0;i<randPos.length;i++){
      randPos[i]=new PVector(random(-rad,rad),random(-rad,rad));
    }
    decel=new PVector(.98,.98);
  }

  void update() {
    float mouseRad=120;
    float F;
    PVector mouse = new PVector(mouseX,mouseY);
   
    PVector dir = PVector.sub(mouse, pos);
    float dist=2*mag(dir.x,dir.y);   
    if(dist<2*rad)
        dist=2*rad;    
    if(mousePressed){grav = 1;}else{grav=0;}
    
    F = grav*((mouseRad*rad)/(dist*dist*1));  
    
    PVector accel = PVector.mult(dir, F);
    accel = PVector.div(accel, rad);
    vel = PVector.add(accel, vel);
    vel.limit(topspeed);
    pos.add(vel);
    vel.mult(decel);
  }

  void display() {
    stroke(0,90);
    fill(farbe);
    beginShape();
    for(int i=0;i<randPos.length;i++){
      vertex(pos.x+randPos[i].x,pos.y+randPos[i].y);
    }
    endShape(CLOSE);
  }

  void checkEdges() {

    if (pos.x > width) 
      pos.x = 0;
    else if (pos.x < 0) 
      pos.x = width;
    if (pos.y > height) 
      pos.y = 0;    
    else if (pos.y < 0) 
      pos.y = height; 
  }
  void connect(){
    stroke(200,50);
    PVector maximum=new PVector(50,50);
    for(int i=0;i<particle.length;i++){
      float x = pos.dist(particle[i].pos);
      if(x>50 && x<55 && rad > 10)
        line(pos.x,pos.y,particle[i].pos.x,particle[i].pos.y);
    }
  }
}

void keyReleased() {
  for(int i=0;i<particle.length;i++){
    particle[i].pos=new PVector(random(width),random(height));
    particle[i].vel = new PVector(0,0);
  }
}
