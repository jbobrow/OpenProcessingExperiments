
// Pendulum
// Daniel Shiffman <http://www.shiffman.net>

// A Simple Pendulum Class
// Includes functionality for user can click and drag the pendulum

// Created 2 May 2005

class Pendulum  {

  PVector loc;      // Location of pendulum ball
  PVector loc1;      // Location of point on arc
  PVector origin;   // Location of arm origin
  float r;           // Length of arm


  float ballr;       // Ball radius
  float damping;     // Arbitary damping amount
  float maxedisp;
  float theta1;

  boolean dragging = false;


    

  // This constructor could be improved to allow a greater variety of pendulums
  Pendulum(PVector origin_, float r_) {
    // Fill all variables
    origin = origin_.get();
    r = r_;
    theta = 0.0;
    mass = 1.0f;
    
    //calculate the location of the ball using polar to cartesian conversion
    float x = r * sin(theta);
    float y = r * cos(theta);
    loc = new PVector(origin.x + x, origin.y + y);
    loc1= new PVector(r*sin(theta), r*cos(theta));
    theta_vel = 0.0f;
    theta_acc = 0.0f;
    damping = 1.0f;   // Arbitrary damping
    ballr = 30.0f;    // Arbitrary ball radius
    yshiftpe=150;
    yshiftke=150;
    mpe = 0.0f;
    mke = 0.0f;
    tote = 0.0f;
    maxedisp = 2.0 * r;
    maxpe = mass * scaling*G * maxedisp;
    theta1=0.0;

 
    
  }

  void go() {
    update();
    drag();    //for user interaction
    render();
    square();
    
  }

  // Function to update location
  void update() {
    // As long as we aren't dragging the pendulum, let it swing!
    if (!dragging) {
      theta_acc = (-1 * G*scaling / r) * sin(theta);      // Calculate acceleration (see: http://www.myphysicslab.com/pendulum1.html)
      theta_vel += theta_acc;                     // Increment velocity
      theta_vel *= damping;                       // Arbitrary damping
      theta += theta_vel;                        // Increment theta

    }
    
    loc.set(r*sin(theta),r*cos(theta),0);         // Polar to cartesian conversion
    loc.add(origin);                              // Make sure the location is relative to the pendulum's origin
   
    mpe = (mass * scaling*G * (loc.y - r - origin.y) * -1.0);
    mke = tote - mpe;
    maxpe = mass * scaling*G * maxedisp;
    
  }

  void render() {
    stroke(0);
    strokeWeight (2);
    // Draw the arm
    line(origin.x,origin.y,loc.x,loc.y);
    ellipseMode(CENTER);
    fill(3,255,46 );
    if (dragging) fill(0);
    // Draw the ball
    ellipse(loc.x,loc.y,ballr,ballr);
    if(!dragging)  println("PE = "+mpe);
    

  }

  // The methods below are for mouse interaction
  
  // This checks to see if we clicked on the pendulum ball
  void clicked(int mx, int my) {
    float d = dist(mx,my,loc.x,loc.y);
    if (d < ballr) {
      dragging = true;
    }
  }

  // This tells us we are not longer clicking on the ball
  void stopDragging() {
    dragging = false;
  }

  void drag() {
    // If we are draging the ball, we calculate the angle between the 
    // pendulum origin and mouse location
    // we assign that angle to the pendulum
    if (dragging) {
      PVector diff = PVector.sub(origin,new PVector(mouseX,mouseY));   // Difference between 2 points
      theta = atan2(-1*diff.y,diff.x) - radians(90);                      // Angle relative to vertical axis
      loc.set(r*sin(theta),r*cos(theta),0);         // Polar to cartesian conversion
      loc.add(origin);                              // Make sure the location is relative to the pendulum's origin
      tote =  mass * scaling*G * (loc.y - r - origin.y) * -1.0;
      println("Total E = "+tote);
    }
  }

void square (){
  rectMode (CENTER);//background of graph
    fill (201,201,211);
    rect(250,150,350,215);
   if (!dragging) {  
    rectMode(CORNERS);//bars on graph
    fill (255,0,0);
    rect (175, 200-int(yshiftke* mke / maxpe), 225,200);}//KE
    rectMode(CORNERS);
    fill (3,12,255);
    rect (275, 200-int(yshiftpe* mpe / maxpe), 325,200);//PE
   
    line (0,600,600,600);//floor
    
    noFill();
    arc(width/2,height-400,250,250, 0, PI);
//    
    for (theta1 = -PI/2; theta1 < 3*PI/4; theta1 = theta1 +PI/4){
     loc1.set(r*sin(theta1),r*cos(theta1),0);         // Polar to cartesian conversion for the dots on the arc
      loc1.add(origin);
      ellipseMode (CENTER);
      fill (0);
      ellipse(loc1.x,loc1.y,10,10);//first point on arc
   }
 
}

}


