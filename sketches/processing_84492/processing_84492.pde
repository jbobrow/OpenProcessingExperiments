
ArrayList targets = new ArrayList();
PVector gravity = new PVector (0,0.02);
int shotX = -100;
int shotY = -100;
int addMore;
PGraphics pg;
int test;
float currMillis = millis();
int cursorAcc = 15;  //lower value is better

void setup()
{
  size(800, 600);
  noCursor();
  smooth(4);
  pg = createGraphics(800, 600);
  pg.beginDraw();
  pg.endDraw();
  frameRate(60);
  for(int i =0; i < 15; i++){
    targets.add(new Target(100,10*i,int(random(50,100)),int(random(50,100))));
  }
}

void draw()
{  
  //println(frameRate+"                   ");
  background(200,200,200);
  image(pg, 0, 0);
  for(int i = 0; i < targets.size(); i++) //render targets
  {
    Target t = (Target)targets.get(i);
    t.run();
  }
  for(int i = targets.size()-1; i >= 0; i--) //check if target is hit
  {
    Target t = (Target)targets.get(i);
    if(t.getActive() == false){
      targets.remove(t);
      addMore++;
    }else{
      t.checkShot();
    }  
  }
  
  manageSpawn();
  displayCursor();
  playerShoot();
  
  fill(0);
  text(frameRate, 10, 20);
  fill(255);
}

void manageSpawn(){ //spawn targets
  for(int i = 0; i < addMore; i++) 
  { 
    int locY = int(random(0,height));
    int h = int(random(50,100));
    int floorY = locY + h/2;
    targets.add(new Target(0,locY,int(random(50,100)),h)); 
  }
  addMore = 0;
}

void displayCursor(){
  stroke(200,100,0,200);
  rectMode(CENTER);
  
  rect(mouseX,mouseY-cursorAcc, 3, 15);  //north cursor bit
  rect(mouseX,mouseY+cursorAcc, 3, 15);  //south 
  rect(mouseX-cursorAcc,mouseY, 15, 3);  //west
  rect(mouseX+cursorAcc,mouseY, 15, 3);  //east
  rectMode(CORNER);
  noStroke();
}  

void playerShoot(){
  shotX = -100; //reset shot location each loop
  shotY = -100; 
  if(mousePressed && (mouseButton == LEFT)){
    if(millis()>currMillis+120){ // ROF
      shotX = int(mouseX);
      shotY = int(mouseY);
      currMillis = millis();
    }  
  }
}

class Particle
{
  PVector location;
  PVector acceleration;
  PVector velocity;
  boolean active = true; //is particle still needed?
  boolean bounce = false;
  int floorY;
  
  Particle(float originX, float originY, int floorY){
    this.floorY = floorY;
    this.bounce = bounce;
    location = new PVector(originX, originY);
    acceleration = new PVector(0,0);
    velocity = new PVector(random(-2,2),random(-2,2));
  }
  
  void run(){
    render();
    update();
  }

  void render(){
    rectMode(CENTER);
    rect(location.x,location.y,random(5),random(5));
  }  
  
  void update(){ //update location and status
    acceleration.add(gravity);
    velocity.add(acceleration);
    location.add(velocity);
    if(location.y > floorY){
      location.y = floorY; 
      if(bounce == true){
        velocity.y *= -1;
        bounce = false;
      }else{
        active = false;
      }
    }  
  }  
  
  boolean getActive(){
    return active;
  }
}
class ParticleBlood extends Particle
{
  PVector prevLocation;
  int type;
  
  ParticleBlood(float originX, float originY, int floorY){
    super(originX, originY, floorY);
    prevLocation = new PVector(location.x,location.y);
    type = int(random(1,21));
    
    if(type > 18){ //lines spawn with higher vel
      velocity.x = random(-4,4);
      velocity.y = random(-4,0);
    }
    
  }  
  
  void render(){
    fill(180,0,0);
    noStroke();
    if(type < 18){
      ellipseMode(CENTER);
      ellipse(location.x,location.y,random(3),random(3));
    }else{
      stroke(180,0,0);
      strokeWeight(random(2));
    }
    
    line(location.x,location.y, prevLocation.x, prevLocation.y);
    prevLocation.x = location.x;
    prevLocation.y = location.y;
    fill(255);
  }    
  
  void update(){ //update location and status
    acceleration.add(gravity);
    velocity.add(acceleration);
    location.add(velocity);
    if(location.y > floorY){
      location.y = floorY; 
      if(bounce == true){
        velocity.y *= -1;
        bounce = false;
      }else{
        pg.beginDraw(); //ground splatter
          pg.fill(180,150,150);
          pg.noStroke();
          pg.ellipse(location.x,location.y+random(-10,10),random(6),random(2));
        pg.endDraw();
        active = false;
      }
    }  
  }  
}
class ParticleCollection
{
  ArrayList particleSpawners = new ArrayList();
  PVector parentLocation;
  int parentFloor;
  
  ParticleCollection(PVector parentLocation, int parentFloor)
  {
    this.parentLocation = parentLocation;
    this.parentFloor = parentFloor;
  }
  
  void run(){
    for(int i = 0; i < particleSpawners.size(); i++)
    {
      ParticleSpawner ps = (ParticleSpawner)particleSpawners.get(i);
      ps.run();
      if(ps.getActive() == false){
        particleSpawners.remove(ps);
      };
    }
  }

  void spawnParticles(){
     particleSpawners.add(new ParticleSpawner(parentLocation, parentFloor)); 
  }  
}
class ParticleSpawner
{
  ArrayList particles = new ArrayList();
  PVector originLocation;
  PVector originOffset;
  boolean active = true; //is spawner still needed?
  int particlesPerBurst;
  int totalBurstsLeft;
  int burstInterval = 100;
  float currMillis;
  int floorY;
  
  ParticleSpawner(PVector parentLocation, int parentFloor)
  {
    floorY = parentFloor;
    totalBurstsLeft = int(random(1,11));
    originLocation = parentLocation;
    currMillis = millis();
    originOffset = new PVector(shotX-originLocation.x,shotY-originLocation.y);
    spawnBurst();
  }
  
  ParticleSpawner(float x, float y, float floorY, String type)
  {
  }

  void run(){
    //print(particles.size());
    for(int i = particles.size()-1; i >= 0; i--)
    {
      Particle p = (Particle)particles.get(i);
      if(p.getActive() == false){
        particles.remove(p);
      }
      p.run();
    }
    if((millis() > currMillis + burstInterval) && (totalBurstsLeft > 0)){
      spawnBurst();
      totalBurstsLeft --;
      currMillis = millis();
    }else{
      update();  
    }
  }  
  
  void spawnBurst(){
    particlesPerBurst = int(random(1,11));
    for(int i = 0; i < particlesPerBurst; i++){
      particles.add(new ParticleBlood(originLocation.x+originOffset.x, originLocation.y+originOffset.y, floorY));
    }     
  }
  
  void update(){
    if(particles.size() == 0){
      active = false;
    }
  }
  
  boolean getActive(){
    return active;
  }
}  
class Target
{
  PVector location;
  PVector velocity;
  int w;
  int h;
  int floorY;
  float currMillis;
  ParticleCollection particleCollection;
  boolean active = true;
  
  Target(int x, int y, int w, int h)
  {
    location = new PVector(x,y);
    velocity = new PVector(int(random(1,4)),0);
    this.w = w;
    this.h = h;
    floorY = int(location.y + h/2);
    currMillis = millis();
    particleCollection = new ParticleCollection(location, floorY);  
  }

  void run(){
    render();
    particleCollection.run();
    update();
  }

  void render(){
    strokeWeight(1);
    stroke(0);
    rectMode(CENTER);
    rect(location.x,location.y,w,h);
    noStroke();
  }  
  
  void update(){
    location.add(velocity);    
    if(location.x > width || location.x < 0 || location.y > height || location.y < 0){
      active = false;
    }
    floorY = int(location.y + h/2);
  }
  
  float getFloor(){
    return floorY;
  }  
  
  PVector getLocation(){
    return location;
  }
  
  boolean getActive(){
    return active;
  }
  
  void checkShot(){
    if(shotX > location.x-w/2 && shotX < location.x+w/2 && shotY > location.y-h/2 && shotY < location.y+h/2 ){
      particleCollection.spawnParticles();
      shotX = -100;
      shotY = -100;
    }  
  }
}


