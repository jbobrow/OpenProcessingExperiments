
ArrayList balls;

void setup() {
  size(600, 600);
  balls = new ArrayList();
}

//Move balls around
void draw() {
  int i,j;
  int n = balls.size();
  Ball ball, bi, bj;
  background(255);
  makeTitle("Bouncing balls", "mouse-click", "guillaume riflet, 2013");
  //interact
  for (j=0; j<n; j++) {
    bj = (Ball) balls.get(j);
    //with another ball
    for (i=0; i<j; i++) {
      bi = (Ball) balls.get(i);
      if (twoBallsCollide(bi, bj)) {
        twoBallDisjoint(bi,bj);
        twoBallExchange(bi, bj);
      }
    }
    //with wall
    bj.rebound();
  }
  //move
  for (i=0; i < n; i++) {
    ball = (Ball) balls.get(i);
    ball.move();
  }
  //draw
  for (i=0; i < n; i++) {
    ball = (Ball) balls.get(i);
    ball.display();
  }
}

//On mouse press add ball if empty. Otherwise remove ball(s).
void mousePressed() {
  float[] mousePos = {mouseX, mouseY};
  boolean remove = false;
  for (int i=0; i < balls.size(); i++) {
    Ball ball = (Ball)balls.get(i);
    if (ball.isHere(mousePos)) {
      balls.remove(i);
      remove = true;
    }
  }
  if (!remove) {
    balls.add(genBall(mousePos));
    print("a" + random(-10*width, 10*width)%width + "\b");
  }
}

//Domain data
void makeTitle(String title, String instructions, String credits) {
  textSize(64);
  fill(0, 102, 153);
  text(title, width/9, height/8);
  //Instructions
  textSize(28);
  text(instructions, width/3, height/2);
  //Credits
  text(credits, width/4, height*11/12);
}

//Ball factory function
Ball genBall(float[] pos) {
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  float radius = random(5., 80.);
  float[] vel = { random(-1.5, 1.5), random(-1.5, 1.5)};
  return new Ball(color(r, g, b), radius, pos, vel);
}

//two-ball interaction functions
boolean twoBallsCollide(Ball one, Ball two){
  boolean collision = false;
  Geometry geo = new Geometry();
  /* ||P2 - P1|| < R1 + R2 */
  if ( geo.distance(one.getPos(), two.getPos()) <= one.getRadius() + two.getRadius() ){
    collision = true;
    print("Collision!\n" + height);
  }
  return collision;
}

void twoBallExchange(Ball one, Ball two){
 /*
  Let us consider two objects with respective 
  masses and velocities given by (m,M) and (v,V).
  Pre-collision velocities are annotated with a subscripted i
  and post-collisions are subscripted with f.
  Let us define the velocity variations post-collision:
  dV = Vf - Vi
  dv = vf - vi
  Applying momentum and kinetic energy conservation laws:
  M*Vi + m*vi = M*Vf + m*vf
  M*Vf^2 + m*vi^2 = M*Vf^2 + m*vf^2
  A little algebra yields:
  dv = 2/(m/M+1)*(Vi-vi)
  dV = 2/(M/m+1)*(vi-Vi)
  and the final velocities are:
  Vf = Vi + dV
  vf = vi + dv
  
  In a 2D domain, this exchange occurs along the axis defined by
  the two ball centres. The "_" symbol indicates a vector whereas
  its absence stands for a scalar.
  Vr =  V_.n_;       
  vr = v_.n_;
  Vt_ = V_ - Vr n_;  
  vt_ = v_ - vr n_;
  dV = 2/(M/m+1)(vr - Vr); 
  dv = 2/(m/M+1)(Vr - vr);  
  Vf_ = Vt_ + (Vr + dV)n_; 
  vf_ = vt_ + (vr + dv)n_.
 */
 
   //Get data from the two balls
   float m1 = one.getMass();
   float[] p1 = one.getPos();
   float[] v1 = one.getVel();

   float m2 = two.getMass();
   float[] v2 = two.getVel();
   float[] p2 = two.getPos();

   //Do some geometrical computations
   Geometry geo = new Geometry();
   //Compute "n", the unit vector that aligns both ball centres.
   float[] n = geo.normalVec(geo.vectorDiffCyclic(p1, p2));

   //Split velocity vector between radial and tangencial
   //components relative to the unit vector "n".
   float vr1 = geo.vectorDotProd(v1, n);
   float[] vt1 = geo.vectorDiff(geo.vectorMul(n, vr1),v1);

   float vr2 = geo.vectorDotProd(v2, n);
   float[] vt2 = geo.vectorDiff(geo.vectorMul(n, vr2),v2);

   //Compute the ball velocity correction along radial component
   // i.e. along "n".
   float dv1 = 2/(m1/m2+1)*(vr2-vr1);
   float dv2 = 2/(m2/m1+1)*(vr1-vr2);

   //Update the ball velocity by adding 
   //tangencial and corrected normal vector velocities.   
   one.setVel(geo.vectorAdd(vt1,geo.vectorMul(n, vr1+dv1)));
   two.setVel(geo.vectorAdd(vt2,geo.vectorMul(n, vr2+dv2)));
}

void twoBallDisjoint(Ball one, Ball two) {
/*
  Correct ball positions to avoid overlapped balls
*/
    Geometry geo = new Geometry();
    float[] p1 = one.getPos();
    float[] p2 = two.getPos();
    float r1 = one.getRadius();
    float r2 = two.getRadius();
    float[] normal = geo.normalVec(geo.vectorDiffCyclic(p1, p2));
    two.setPos(geo.vectorAddCyclic(p1, geo.vectorMul(normal, r1+r2)));
}
class Ball {
  //This class manages the ball kinematics and some of its dynamics.
  
  //properties
  private color paint;
  private float mass;
  private float radius;
  private float[] pos = new float[2];
  private float[] vel = new float[2];
  private float[] domain = new float[2];
  
  //constructor
  Ball(color inC, float inR, float[] inP, float[] inV){
    paint = inC;
    radius = inR;
    mass = pow(radius,2); //mass proportional to the volume of the ball.
    pos[0] = inP[0]; pos[1] = inP[1];
    vel[0] = inV[0]; vel[1] = inV[1];
    domain[0] = float(width); domain[1] = float(height);
  }

  //Sets and Gets
  color getPaint(){ return paint; }
  void setPaint(color c) { this.paint = c; }
  float getMass(){ return mass; }
  void setMass(float m) { this.mass = m; }
  float getRadius() { return radius; }
  void setRadius(float r) { this.radius = r; }
  float[] getPos() { return pos; }
  void setPos(float[] p) { this.pos[0] = p[0]; this.pos[1] = p[1]; }  
  float[] getVel() { return vel; }
  void setVel(float[] v) { this.vel[0] = v[0]; this.vel[1] = v[1]; }
  
  //methods
  void display(){
    stroke(50);
    fill(paint);
    ellipse(pos[0],pos[1],radius*2,radius*2);
  }
  //move the ball around
  void move(){
    Geometry geo = new Geometry();
    pos = geo.vectorAddCyclic(pos, vel);
  }
  void accel(float[] dvel){
    vel[0] = vel[0] + dvel[0];
    vel[1] = vel[1] + dvel[1];    
  }
  //Is the ball located at these coordinates? 
  boolean isHere(float[] p) {
    boolean isHere = false;
    Geometry geo = new Geometry();
    if (geo.distanceCyclic(p, pos) <= radius){
      isHere = true;
    }
    return isHere;
  }
  //Create a copy of the ball
  Ball copyMe(){
     return new Ball(paint, radius, pos, vel);
  }
  void rebound(){
    if (pos[0] + radius >= domain[0]){ 
      vel[0] = -abs(vel[0]);
      pos[0] = domain[0] - radius;
    }
    if (pos[0]-radius <= 0){
      vel[0] = abs(vel[0]);
      pos[0] = radius;
    }
    if (pos[1] + radius >= domain[1]){
      vel[1] = -abs(vel[1]);
      pos[1] = domain[1] - radius;
    }
    if (pos[1]-radius <= 0){
      vel[1] = abs(vel[1]);
      pos[1] = radius;
    }
  }
}
class Geometry{
  /*
  This class is created to deal with cyclic domains
  */
  
  //Properties
  float[] domain;
  
  //Constructor: void
  Geometry(){
    float[] dom = {width, height};
    domain = dom;
  }
  
  //Methods
  float distanceCyclic(float[] p1, float[] p2) {
  /* Computes the euclidian norm of vector p2-p1
  in a cyclic domain*/
    return normVec(vectorDiffCyclic(p1, p2));
  }
  
  float distance(float[] p1, float[] p2) {
    return normVec(vectorDiff(p1,p2));
  }
  
  float[] vectorDiffCyclic(float[] p1, float[] p2){
  /* Returns the vector p2 - p1  in a cyclic domain.*/
    float[] n1 = translateFrame(p1);
    float[] n2 = translateFrame(p2);
    float[] diff = {
      minDist(p2[0]-p1[0], n2[0]-n1[0]),
      minDist(p2[1]-p1[1], n2[1]-n1[1])
    };
    return diff;
  }
  
  float[] vectorDiff(float[] p1, float[] p2){
    float[] diff = { p2[0]-p1[0], p2[1]-p1[1]};
    return diff;  
  }
  
  float[] vectorAddCyclic(float[] p1, float[] p2){
  /* Returns the vector p1 + p2 in cyclic domain*/
    float[] sum = vectorAdd(p1, p2);
    sum[0] = (sum[0]+domain[0])%domain[0];
    sum[1] = (sum[1]+domain[1])%domain[1]; 
    return sum;
  }
  
  float[] vectorAdd(float[] p1, float[] p2){
    float[] sum = {p1[0]+p2[0], p1[1]+p2[1]};
    return sum;    
  }
  
  float[] vectorMul(float[] p, float a){
  /* multiplies vector p by scalar a*/
    float[] mul = {a*p[0], a*p[1]};
    return mul;
  }
  
  float[] vectorMulCyclic(float[] p, float a){
    float[] mul = vectorMul(p, a);
    mul[0] = mul[0]%domain[0];
    mul[1] = mul[1]%domain[1];
    return mul;
  }
  
  float vectorDotProd(float[] p1, float[] p2){
    return p1[0]*p2[0] + p1[1]*p2[1];
  }
  
  float minDist(float p, float n){
  /* returns the minimum of the absolute values of input*/
    float minDist;
    if (abs(p)<abs(n)){
      minDist = p;
    } else {
      minDist = n;
    }
    return minDist;
  }
  
  float[] translateFrame(float[] original){
  /* Does a half-domain-width translation */
    float[] translation = {
      (original[0]+domain[0]/2)%domain[0], 
      (original[1]+domain[1]/2)%domain[1]
    };
    return translation;
  }
  
  float[] normalVec(float[] v){
    /* normalize a vector*/
    float dist = normVec(v);
    float[] normal = {v[0]/dist, v[1]/dist};
    return normal;
  }
  
  float normVec(float[] v){
    /* computes the euclidean norm of a vector */
    return sqrt(vectorDotProd(v,v));
  }

}

