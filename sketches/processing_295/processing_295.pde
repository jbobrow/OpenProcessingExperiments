
class Agent {
  int agentIndex;
  float agentSize = 15;
  
  Vector3D loc;
  Vector3D vel;
  Vector3D acc; //beschleunigung
  Vector3D accDir;  
  Vector3D tar = new Vector3D(random(width),random(height));
  float tarTol = 20.0;
  int tarCount;
  
  float agentMass;
  float max_vel;
  float bounce = 1.0; // How "elastic" is the object
  float accX = 0.01;
  float accY = 0.01;
  
  int col;
  Vector3D impact;
  Vector3D impulse;
  float impactSpeed;
  
  
//___________________________________________________________________________CONSTRUCTOR    
  Agent(Vector3D a, Vector3D v, Vector3D l, float m_, int in) {
    acc = a.copy();
    vel = v.copy();
    loc = l.copy();
    agentMass = m_;
    max_vel = 3.0;
    agentIndex = in;
  }
//___________________________________________________________________________RETURNS AND GETS
  Vector3D getLoc() {
    return loc;
  }

  Vector3D getVel() {
    return vel;
  }
  float getMass() {
    return agentMass;
  }
  
  void add_force(Vector3D liquidAcc) {
    liquidAcc.div(agentMass);  // Newton's second law
    vel.add(liquidAcc);    // Accumulate acceleration
  }

  void set_target(float a, float b){
    tar = new Vector3D(a,b);
    tarCount = 0;
  }
//___________________________________________________________________________UPDATE
  // Main method to operate object
  void go() {
    collision();
    accelerate();
    update();
    borders();
    render();
  }
  
  
  
  void collision(){
    col=155;
    for (int i=0; i<agentAmount; i++){
      if(i!=agentIndex){
        if( Vector3D.distance(loc, myAgent[i].loc)<agentSize/2+myAgent[i].agentSize/2){
          impact = Vector3D.sub(vel, myAgent[i].vel);
          impulse = Vector3D.sub(loc, myAgent[i].loc);
          impulse.normalize();
          impactSpeed = impact.dot(impulse);
          float a = sqrt(abs(impactSpeed*agentMass*myAgent[i].agentMass));
          impulse.mult(a);
          
          impulse.div(agentMass);
          vel.add(impulse);
          println(impactSpeed);
          println(a + "\t" +impulse.x);
          
          col =255;    
          
        }      
      }
    }
    
  }
  
  void accelerate(){
    tarCount++;
    if (tarCount == 500) tar.setXYZ(random(width),random(height),0.0);
    
    if (loc.x > tar.x+tarTol) acc.setX(accX*-1);
    else if (loc.x < tar.x-tarTol) acc.setX(accX*1);
    else acc.setX(0.0);
    if (loc.y > tar.y+tarTol) acc.setY(accY*-1);
    else if (loc.y < tar.y-tarTol) acc.setY(accY*1);
    else acc.setY(0.0);
  }
  
  // Method to update location
  void update() {
    vel.add(acc);
    vel.limit(max_vel);
    loc.add(vel);
    //acc.setXYZ(0.0,0.0,0.0);
  }
  
  // Check for bouncing off borders
  void borders() {
    if (loc.y > height) {
      vel.y *= -bounce;
      loc.y = height;
    }
    if ((loc.x > width) || (loc.x < 0)) {
      vel.x *= -bounce;
    }    
    if (loc.x < 0)     loc.x = 0;
    if (loc.x > width) loc.x = width;
  }  
  
  // Method to display
  void render() {
    ellipseMode(CENTER);
    noStroke();
    fill(col,90);
    ellipse(loc.x,loc.y,agentSize,agentSize);
    if (showVectors) {
      drawVector(vel,loc,10);
    }
  }
}

