
// additional code by Jeremy Ryan Peterson, December 2011
// original code by Claus Rytter Bruun de Neergaard, March 2011
// (use of PVector learned from Daniel Shiffmann tutorial)
 
// GLOBAL VARIABLES ///////////////////////////////
float xchange = 500; 
float ychange =  500; 
int n = 20000;      // number of agents
float s = 9.0;     // maximum agent velocity
int pointColorR = 100; 
int pointColorG = 150;
int pointColorB = 255;
int pointAlpha = 100;

float direction = .2;
 
int count = 0;
 
Agent[] agents = new Agent[n];
 
// SETUP //////////////////////////////////////////
 
void setup() {
  size(1000, 1000);
  noFill();
  stroke(pointColorR, pointColorG, pointColorB);
//  strokeWeight(0);
//  frameRate(40); 
   
  for (int i = 0; i < agents.length; i++) {
    agents[i] = new Agent();
  }
   
}
 
// DRAW ///////////////////////////////////////////
 
void draw() {
   
  background(0);
   
 
  // calling functions of all of the objects in the array
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
    vel = new PVector(0,0);
    speed = s;
  }
 
  void update() {
 
    //perfect pattern
//    PVector mouse = new PVector(500, 500);

    //moving the form
    
    
    if (keyPressed) {
      
        if (key == 'j' || key == 'J')  
    n = 500;
      
      
      if (key == 'r' || key == 'R')  
    xchange = 500;
   if (key == 't' || key == 'T')  
    ychange = 500;
      
    if (key == 'g' || key == 'G')  
      
    xchange= xchange*.1;
    ychange= ychange*-.1;
    
  } if (keyPressed) {
      
    if (key == 'h' || key == 'H')  
    xchange= xchange*-.1;
    ychange= ychange*.1;
    
     if (key == 'd' || key == 'D')  
    xchange= random(0, width);
    ychange= random(0, height);
    
    if (key == 'w' || key == 'W')  
    xchange= 500;
    ychange= 500;
    
    
      
   if (key == 'f' || key == 'F')  
   
    xchange= mouseX;
    if (key == 'f' || key == 'F')  
    ychange= mouseY;
    
    
   
    
    else {
    s=s;
    xchange= xchange;
    ychange= ychange;
  }

    
  } 
  
  
    PVector mouse = new PVector(xchange, ychange);
    
    
    PVector dir = PVector.sub(mouse, loc); 
    dir.normalize();                       
    dir.mult(direction);                        
    acc = dir;                             
 
    vel.add(acc);
    vel.limit(speed);
    loc.add(vel);
  }
   
  void edges() {
 
    if (loc.x > width) {
//      loc.x = 0;
        vel.limit(speed*-1);
    } else if (loc.x < 0) {
//      loc.x = width;
      vel.limit(speed*-1);
    }
 
    if (loc.y > height) {
//      loc.y = 0;
vel.limit(speed*-1);
    }  else if (loc.y < 0) {
//      loc.y = height;
vel.limit(speed*-1);
    }
 
  }
 
  void display() {
    point(loc.x, loc.y);
    
    
  }
   
}
void keyPressed(){
  
    if (key == 'a' || key == 'A')  
      
    xchange= xchange+10;
    ychange= ychange-10;
    
 
      
    if (key == 's' || key == 'S')  
    xchange= xchange-10;
    ychange= ychange+10;
  
 if (key == 'x' || key == 'X')  
    s= s*1.1;
    if (key == 'z' || key == 'Z')  
    s= s*.9;
    if (key == 'c' || key == 'C')  
    s= 9;
  
  
  println("s");
 println(s);
 println("y");
    println(xchange);
    println("x");
    println(ychange);
}
void mousePressed(){
 
   if (mousePressed == true) {
     xchange= mouseX;
   
    ychange= mouseY;
  } else {
    xchange= xchange;
    ychange= ychange;
  }
   



}


