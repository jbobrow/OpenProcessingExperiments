
// To do

class GravityBall {
  PVector Pos;                // Position
  PVector Vel=new PVector();  // Velocity
  PVector Acc=new PVector();  // Aceleration
  float Rot;                  // Rotation

  float Radius = 20;          // Size of the visible object
  float Friction = 0;
  float NormalSpeed = 7;
  int BorderDistance = 40;    // The distance from the edge of the window before the push back occurs

  boolean Finished;

  GravityBall(PVector Position, final float Direction, PVector EmmiterVel) {
    Pos = new PVector(Position.x, Position.y);
    Vel = new PVector(cos(Direction), sin(Direction));
    Vel.mult(NormalSpeed);   // Emmit int the direction of the ship 
    Vel.add(EmmiterVel);      // add the velocity of the ship
    Finished = false;
  }

  void Run() {
    Calculate();
    Move();
    Display();
  }
  
  void Calculate() {
    Acc = new PVector();
    CheckCollisions();
    CheckEdges();
  }
  
  void CheckEdges() {
    if (Pos.x > width -BorderDistance) Acc.x -= .5*BorderDistance/(width-Pos.x);
    if (Pos.x <        BorderDistance) Acc.x += .5*BorderDistance/(Pos.x);
    if (Pos.y > height-BorderDistance) Acc.y -= .5*BorderDistance/(height-Pos.y);
    if (Pos.y <        BorderDistance) Acc.y += .5*BorderDistance/(Pos.y);
  }

  void CheckCollisions() {
    // !! To do !!
  }

  void Display() {
    pushMatrix();
      translate(Pos.x, Pos.y);
      rotate(Rot);
      fill(130, 198, 214);
      stroke(5);
      ellipseMode(CENTER);
      ellipse(0, 0, Radius, Radius/3);
    popMatrix();
  }  
  
  void Move() {
    Vel.add(Acc);
    Vel.mult(1-Friction);
    Pos.add(Vel);
    
    Rot = atan2(Vel.x, Vel.y);
    Rot = HALF_PI - Rot;
  }
}

