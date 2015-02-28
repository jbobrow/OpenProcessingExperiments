
ArrayList balls;

void setup() {
  size(600, 600);
  balls = new ArrayList();
}

//Move balls around
void draw() {
  int i;
  int n = balls.size();
  Ball ball;
  background(255);
  makeTitle("Bubble balls", "mouse-left: +\nmouse-right: -", "guillaume riflet, 2013");
  //interact
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
  if ( mouseButton == RIGHT ){
    for (int i=0; i < balls.size(); i++) {
      Ball ball = (Ball)balls.get(i);
      if (ball.isHere(mousePos)) {
        balls.remove(i);
      }
    }
  } else {
    balls.add(genBall(mousePos));
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
  float radius = random(10., 40.);
  float[] vel = { random(-1.5, 1.5), random(-1.5, 1.5)};
  return new Ball(color(r, g, b, 60), radius, pos, vel);
}

//two-ball interaction functions
boolean twoBallsCollide(Ball one, Ball two){
  boolean collision = false;
  return collision;
}
void twoBallExchange(Ball one, Ball two){
}
void twoBallVisualBlast(Ball one, Ball two){
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
    mass = pow(radius,3); //mass proportional to the volume of the ball.
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
    ellipse(pos[0],pos[1],radius,radius);
  }
  //move the ball around
  void move(){
    float dt = 1.;
    pos[0] = (pos[0] + vel[0]*dt + domain[0])%domain[0];
    pos[1] = (pos[1] + vel[1]*dt + domain[1])%domain[1];    
  }
  void accel(float[] dvel){
    vel[0] = vel[0] + dvel[0];
    vel[1] = vel[1] + dvel[1];    
  }
  //Is the ball located at these coordinates? 
  boolean isHere(float[] p) {
    boolean isHere = false;
    if (distance(p, pos) <= radius){
      isHere = true;
    }
    return isHere;
  }
  //Calculate the minimum distance 
  //between two points in a cyclic domain.
  float distance(float[] p1, float[] p2){
    float[] d2 = new float[2];
    d2[0] = min(  
              pow(p1[0] - p2[0], 2), 
              pow((p1[0]+domain[0]/2)%domain[0] - (p2[0]+domain[0]/2)%domain[0], 2) 
            );
    d2[1] = min(  
              pow(p1[1] - p2[1], 2), 
              pow((p1[1]+domain[1]/2)%domain[1] - (p2[1]+domain[1]/2)%domain[1], 2) 
            );
    return sqrt(d2[0] + d2[1]);
  }
}


