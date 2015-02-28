
//Controls: Press B to toggle visibility of balls
//          Press L to toggle the lines
//          Press C to toggle collisions
//          Press T to toggle gravity (Very Messy)
//          Press UP/DOWN to increase/decrease number of balls
//          Press RIGHT/LEFT to increase/decrease length of lines
//          Press X/Z to increase/decrease the strength of gravity
//
//  Booleans for controls:
boolean seeTheBalls = true;
boolean seeTheLines = true;
boolean seeTheCollisions = true;
boolean gravity = false;
int totalBoids = 500;
int boidsToSee = 210;
int distForLines = 200;
float gravityStrength = -0.5;

ArrayList points = new ArrayList();


void setup() {
  size(700, 700, P2D); 
  for (int i = 0; i < totalBoids; i++) {
    points.add(new Boid(random(width), random(height) ) );
  }
}

void draw() {
  background(0);
  for (int i = 0; i < boidsToSee; i++) {
    Boid myBoid = (Boid) points.get(i);
    if (seeTheBalls) myBoid.make(); 
    myBoid.move();
    myBoid.bounce();
    if(gravity) myBoid.gravity(gravityStrength);

    for (int j = 0; j < boidsToSee; j++) {
      Boid myOtherBoid = (Boid) points.get(j);
      if (myBoid != myOtherBoid) {
        if (seeTheLines) drawLines(myBoid, myOtherBoid);
        if (seeTheCollisions) checkCollision(myBoid, myOtherBoid);
      }
    }
  }
}

  void checkCollision(Boid a, Boid b) {
    if ( a.pos.dist(b.pos) < a.radius + b.radius ) {
      float size = 3* a.pos.dist(b.pos);
      noStroke();
      fill(255, 255, 128);
      ellipse(a.pos.x, a.pos.y, size, size);
    }
  }

  void drawLines(Boid a, Boid b) {
    stroke(75, 50);
    if ( a.pos.dist(b.pos) < distForLines) {
      line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
    }
  }

  void keyReleased() { //for things that need to be toggle on/off (fine control)
    if (key == 'B' || key == 'b') {
      if (seeTheBalls) seeTheBalls = false;
      else seeTheBalls = true;
    }
    if (key == 'L' || key == 'l') {
      if (seeTheLines) seeTheLines = false;
      else seeTheLines = true;
    }
    if (key == 'C' || key == 'c') {
      if (seeTheCollisions) seeTheCollisions = false;
      else seeTheCollisions = true;
    }
    if (key == 'G' || key == 'g'){
     if(gravity) gravity = false;
     else gravity = true;
    } 
    if (key == 'X' || key == 'x'){ 
        gravityStrength += .1; 
        println("Gravity is : " + gravity + " Strength is: " + gravityStrength);
      }
      if(key == 'Z' || key == "z"){ //MINUS SIGN
        gravityStrength -= .1;
         println("Gravity is : " + gravity + " Strength is: " + gravityStrength);
      }
  }

  void keyPressed() { //for values that need to be moved down quickly (coarse control_
    if (keyCode == RIGHT) {
      distForLines++;
      println("distForLines: " + distForLines);
    }
      if (keyCode == LEFT) {
        distForLines--;
        println("distForLines: " + distForLines);
      }
      if (keyCode == UP) {
        if (boidsToSee < totalBoids) boidsToSee++;
        println("Visible Boids: " + boidsToSee);
      }
      if (keyCode == DOWN) {
        if (boidsToSee > 0) boidsToSee--;
        println("Visible Boids: " + boidsToSee);
      }
      
    }


class Boid{
  PVector pos = new PVector();
  PVector vel = new PVector();
  float radius = 2;
  
  Boid(float x, float y){
   pos.x = x;
   pos.y = y;
   vel.x = random(-3, 3);
   vel.y = random(-3, 3); 
  }
  
  void make(){
    ellipseMode(RADIUS);
    noStroke();
    stroke(0,255,128);
    ellipse(pos.x,pos.y,radius,radius);   
  }
  
  void move(){
   pos.add(vel); 
  }
  
  void bounce(){
    if (pos.x + radius > width) {  pos.x = width - radius - 1;  vel.x = abs(vel.x) * -1; }
    if (pos.x - radius < 0)     {  pos.x = radius + 1;          vel.x *= -1;             }
    if (pos.y + radius > height){  pos.y = height - radius - 1; vel.y = abs(vel.y) * -1; }
    if (pos.y - radius < 0)     {  pos.y = 1 + radius;          vel.y *= -1;             }
  }
  
  void repel(float area, float strength){
    PVector mouse = new PVector(mouseX, mouseY);
    float distance = mouse.dist(pos);
    
    if(distance < area)
    {
      PVector v = new PVector();
      if(pos.x >= mouseX) v.x += (area-distance) * -strength * 0.01;
      else v.x -= (area-distance) * -strength * 0.01;
      if(pos.y >= mouseY) v.y += (area-distance) * -strength * 0.01;
      else v.y -= (area-distance) * -strength * 0.01;
      vel.sub(v);
    }
  }
  
  void attract(float area, float strength){
    PVector mouse = new PVector(mouseX, mouseY);
    float distance = mouse.dist(pos);
    
    if(distance < area)
    {
      PVector v = new PVector();
      if(pos.x >= mouseX) v.x += (area-distance) * strength * 0.01;
      else v.x -= (area-distance) * strength * 0.01;
      if(pos.y >= mouseY) v.y += (area-distance) * strength * 0.01;
      else v.y -= (area-distance) * strength * 0.01;
      vel.sub(v);
    }
  }
  
  
  
  void gravity(float strength){
    vel.y -= strength;
  }
  
  
  
}


