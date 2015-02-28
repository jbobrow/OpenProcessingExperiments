
class Branch2D 
{
  float vx, vy; // x and y velocities
  float x, y; 
  float gravity;
  float mass;
  float radius = 10;
  float stiffness = 0.1; // controls elasticity
  float damping = 0.5; // controls oscillation
    
  Branch2D(float xpos, float ypos, float m, float g) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
  }
  
  void update(float targetX, float targetY) // other body that gravity is attracting
  {
    float forceX = (targetX - x) * stiffness; // force of attraction on x axis
    float ax = forceX / mass; // Newton's 2nd Law :) on x
    vx = damping * (vx + ax); // adds acceletation to velocity to increase velocity and damping to control oscillation on x
    x += vx; // adds velocity to x location (anywhere x location is (every loop run) it will increase velocity)
    
    float forceY = (targetY - y) * stiffness; // force of attraction on y axis
    forceY += gravity; // adds gravity to the Y axis
    float ay = forceY / mass; // Newton's 2nd Law :) on y
    vy = damping * (vy + ay); // adds acceletation to velocity to increase velocity and damping to control oscillation on y
    y += vy; // adds velocity to y location (anywhere x location is (every loop run) it will increase velocity)
  }
  
  void display(float nx, float ny) // defines other body location, draws ellipse on one end of string and draws spring
  {
    noStroke();
    ellipse(x, y, radius, radius);
    stroke(255);
    line(x, y, nx, ny);    
  }
  
    void addBranch(float Xpos, float Ypos) // add branch function repeats update and display functions jus once for now
  {
    update(Xpos, Ypos); 
    display(Xpos, Ypos);
    
    // RECURSIVE BRANCHING RULE IS CURRENTLY BEING REVIEWED
    
  }
  
  void repulse( Branch2D b) // gets appraching branch
  {    
    float dx = b.x - x; // distance between actual and approaching branch on x 
    float dy = b.y - y; // distance between actual and approaching branch on y
    float distance = sqrt(sq(dx) + sq(dy)); // gets distance through pithagoras
    float minDist = radius; // sets minimum distance to be the branch end radius     
    if (distance <= minDist) 
    { 
      b.x = b.x - 2*radius; // sets approching branch back by two times its size
      x = x + 2*radius; // sets current branch back by two times its size
    }
  } 
}

