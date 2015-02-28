
PImage info;
PImage shadow;
float diametre;
float posX, posY;
float fade;

int n = 200;      // number of agents
float s = 10.0;     // maximum agent velocity
 
int count = 0;
 
Agent[] agents = new Agent[n];
 
// SETUP //////////////////////////////////////////
 
void setup() {
  size(600, 500);
  noFill();
  stroke(255);
  noCursor();

  diametre = 10; // J'assigne la valeur du diametre du cercle.
  posX = 325; // position X du cercle.
  posY = 240; // position Y du cercle.
  fade = 255;
  
  info = loadImage("info.png");
  shadow = loadImage("shadow.png");  
   
  for (int i = 0; i < agents.length; i++) {
    agents[i] = new Agent();
  }
   
}
 
// DRAW ///////////////////////////////////////////
 
void draw() {  
  background(0);

  // calling functions of all of the objects in the array
  
  
  
  // Ellipse_hover
  float distance = dist(mouseX, mouseY, posX, posY);
  
   fill(0);
  text(distance, 5, 20);
 
  stroke(0);
 
  if(distance<diametre*0.5 && fade > 0){ 
    image(info,325,140);
  }
  if(distance>diametre*0.5 && fade < 255){
    fade = fade + 20; 
  }
     
  fill(0);
  ellipse(posX, posY, diametre, diametre);
  
  
  image(shadow, 180,180);
  
   stroke(255);
  
  for (int i = 0; i < agents.length; i++) {
    agents[i].update();
    agents[i].edges();
    agents[i].display();
  }
}
 
// CLASS //////////////////////////////////////////
 
class Agent {
 
  PVector loc;
  PVector vel;
  PVector acc;
  float speed;
 
  Agent() {
    loc = new PVector(random(0, width), random(0, height));
    vel = new PVector(0, 0);
    speed = 50;
  }
 
  void update() {
 
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, loc);     
    dir.normalize();                       
    dir.mult(0.15);                        
    acc = dir;                             
 
    vel.add(acc);
    vel.limit(2);
    loc.add(vel);
  }
   
  void edges() {
 
    if (loc.x > width) {
      loc.x = 0;
    } else if (loc.x < 0) {
      loc.x = width;
    }
 
    if (loc.y > height) {
      loc.y = 0;
    }  else if (loc.y < 0) {
      loc.y = height;
    }
 
  }
 
  void display() {
    point(loc.x, loc.y);
  }
   
}



