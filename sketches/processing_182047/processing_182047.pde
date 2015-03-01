
ArrayList particles = new ArrayList();

void setup(){
  size(640, 640, P3D);
  noFill();
  frameRate(20);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  rotateX(radians(1+mouseY/3));
  rotateY(radians(1+mouseX/3));
  rotateZ(radians(90));
  for(int i = 0; i < 10; i++){
    float zDiff = random(-0.08, 0.08);
    float xyDiff = random(-50, 50);
    /* Use when it isn't in javascript mode */
    //float xyDiff = noise(i+frameCount)*150;
    particles.add(new Particle(new PVector(sin(radians(xyDiff+frameCount*4))*1.5, zDiff, cos(radians(xyDiff+frameCount*4))*1.5)));
    particles.add(new Particle(new PVector(-sin(radians(xyDiff+frameCount*4))*1.5, zDiff, -cos(radians(xyDiff+frameCount*4))*1.5)));
  }
  for(int i = 0; i < particles.size(); i++){
    Particle p = (Particle) particles.get(i);
    pushMatrix();
    p.draw();
    popMatrix();
    p.move(); 
  }
}

class Particle {
  PVector loc, vel;
  
  float life = random(100, 170);
  float maxLife = life;
  
  Particle(PVector vel){
    loc = new PVector(0, 0, 0);
    this.vel = vel;
  }
  
  void draw(){
    translate(loc.x, loc.y, loc.z);
    float gAndA = map(life, 0, maxLife, 0, 255);
    stroke(map(life, 0, maxLife, 150, 255), gAndA, map(life, 0, maxLife, 255, 0), gAndA);
    strokeWeight(map(life, 0, maxLife, 5, 1));
    point(0, 0, 0);
    life--;
    if(life <= 0){
      particles.remove(this); 
    }
  }
  
  void move(){
    loc.add(vel); 
  }
}



