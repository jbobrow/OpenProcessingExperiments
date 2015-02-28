
// To Do
// *Draw the borders [DONE]
// *Helios Ball Class 
//   - Ball that falls to the ground [DONE]
//   - Ball that has collition detection with other balls
// *Collision detection between borders and balls [DONE]
// *Convert balls to live Helios gadgets (communication with gadget server)

Balls newBalls;

float Th;
float Tw;
float Bh;
float Tangle;

void setup()
{
  size(900,900);
  
  newBalls = new Balls();
  
  // calculate border angle
  Th = 50;
  Tw = 300;
  Bh = height - 50;
  
  Tangle = degrees(atan(Tw/Bh));
}

//boolean sketchFullScreen() {
//  return true;
//}

void draw()
{
  background(0);
    
  PVector gravity = new PVector(0,0.1*5);
  
  // friction
  float c = .1;
  PVector friction = newBalls.velocity.get();
  friction.mult(-1);
  friction.normalize();
  friction.mult(c); 
   
  newBalls.applyForce(friction); 
  newBalls.applyForce(gravity);
 
  newBalls.update();
  newBalls.display();
  newBalls.checkEdges(Tangle);
  
  drawBorders();
}

void drawBorders()
{
  stroke(128);
  fill(255);
  
  beginShape(TRIANGLES);
  // Left Triangle;
  vertex(0, Th);
  vertex(0, height);
  vertex(Tw, height);
  
  // Right Triangle
  vertex(width, 50);
  vertex(width, height);
  vertex(width-300, height);
  endShape();
}

class Balls
{
  PVector location;
  PVector velocity;
  PVector acceleration; 
  
  float mass;
  float size;
  float strokeThickness;
  
 Balls()
 {
    mass = 2;
    size = 30*mass;
    strokeThickness = 3*mass;
    location = new PVector(100,-20);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
 }

  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);  
  }
  
  void display(){
     noStroke();
     fill(255,255,60);
     strokeWeight(strokeThickness);
     stroke(90); 
     ellipse(location.x,location.y,size,size);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void checkEdges(float _tAngle)
  {
   float _o = (location.y + size/2) * tan(radians(_tAngle));
   if(location.y + size/2 > height)
   {
    velocity.y *= -1;
    location.y = height-size/2;
   }
   if(location.x-size/8 <= _o)
   {
     velocity.x += 5;
   }
   if(location.x + size/8 >= (width -_o))
   {
     velocity.x -= 5;
   }
  }
}
