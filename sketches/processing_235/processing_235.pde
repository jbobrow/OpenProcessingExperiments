
import processing.pdf.*;

boolean pdfoutput;

int numSprings = 7;
int numSprings2 = 7;
int numSprings3 = 7;
Spring2D[] s = new FixedSpring [numSprings];
Spring2D[] t = new FixedSpring [numSprings];
Spring2D[] u = new FixedSpring [numSprings];

float gravity = 2.0;
float mass = 3.0;

Spring2D[] v = new FixedSpring [numSprings2];
Spring2D[] w = new FixedSpring [numSprings2];

Spring2D[] a = new FixedSpring [numSprings3];
Spring2D[] b = new FixedSpring [numSprings3];


void setup(){
  size(800,450);
  smooth();
  fill(0);
  strokeWeight(1);
  for (int i = 0; i < numSprings; i++){
    float damping = 0.6;
    float stiffness = 0.5;
    s[i] = new FixedSpring(0,600, mass, gravity, mass*5, damping, stiffness, 60); 
    t[i] = new FixedSpring(0,700, mass, gravity,mass*5, damping, stiffness, 60);
    u[i] = new FixedSpring(0,500, mass, gravity, mass*5, damping, stiffness, 60);
  }
  
    for (int j = 0; j < numSprings2; j++){
      float damping = 0.25;
    float stiffness = 0.15;
    v[j] = new FixedSpring(0,100, mass, gravity, mass*5, damping, stiffness, 60); 
    w[j] = new FixedSpring(0,200, mass, gravity, mass*5, damping, stiffness, 60);
  }
  
    for (int k = 0; k < numSprings3; k++){
      float damping = 0.35;
    float stiffness = 0.2;
    a[k] = new FixedSpring(0,300, mass, gravity, mass*5, damping, stiffness, 60); 
    b[k] = new FixedSpring(0,400, mass, gravity, mass*5, damping, stiffness, 60);
  }
  
}




void draw(){

  if (pdfoutput) {
    beginRecord(PDF, "frame-####.pdf");
  }

  background (255);
  
  s[0].update(mouseX,600); 
  s[0].display(mouseX, 600);
  t[0].update(s[0].x,s[0].y); 
  t[0].display(s[0].x, s[0].y);
  u[0].update(s[0].x, s[0].y); 
  u[0].display(s[0].x, s[0].y);
  
  v[0].update(s[0].x,s[0].y);
  v[0].display(s[0].x,s[0].y);
  w[0].update(s[0].x,s[0].y);
  w[0].display(s[0].x,s[0].y);
  
  a[0].update(s[0].x,s[0].y);
  a[0].display(s[0].x,s[0].y);
  b[0].update(s[0].x,s[0].y);
  b[0].display(s[0].x,s[0].y);
  
  
  for (int i = 1; i < numSprings; i++){
    s[i].update(s[i-1].x, s[i-1].y);
    s[i].display(s[i-1].x, s[i-1].y);
    t[i].update(s[i].x, s[i].y);
    t[i].display(s[i].x, s[i].y);
    u[i].update(s[i].x, s[i].y);
    u[i].display(s[i].x, s[i].y);
    stroke (0);
    line (t[i-1].x, t[i-1].y, t[i].x, t[i].y); 
    line (s[i-1].x, s[i-1].y, t[i].x, t[i].y);
    line (u[i-1].x, u[i-1].y, s[i].x, s[i].y); 
    line (u[i-1].x, u[i-1].y, u[i].x, u[i].y);
  }
   for (int j = 1; j < numSprings2; j++){
    v[j].update(s[j].x, s[j].y);
    v[j].display(w[j].x, w[j].y);
    w[j].update(s[j].x, s[j].y);
    w[j].display(a[j].x, a[j].y);
    stroke (0);
    line (v[j-1].x, v[j-1].y, v[j].x, v[j].y);
    line (w[j-1].x, w[j-1].y, w[j].x, w[j].y);
    line (v[j-1].x, v[j-1].y, w[j].x, w[j].y);
   }
   
    for (int k = 1; k < numSprings3; k++){
    a[k].update(s[k].x, s[k].y);
    a[k].display(b[k].x, b[k].y);
    b[k].update(s[k].x, s[k].y);
    b[k].display(u[k].x, u[k].y);
    stroke (0);
    line (a[k-1].x, a[k-1].y, a[k].x, a[k].y);
    line (b[k-1].x, b[k-1].y, b[k].x, b[k].y);
    line (a[k-1].x, a[k-1].y, b[k].x, b[k].y);
   }

  if (pdfoutput) {
    endRecord();
    pdfoutput = false;
  }
}


class Spring2D{
  float vx, vy;   //the x and y axis velocities
  float x, y;  //the x and y coordinates
  float gravity;  
  float mass;
  float radius = 15;
  float stiffness = 0.2;
  float damping = 0.5;

  Spring2D(float xpos, float ypos, float m, float g, float r, float damp, float stif){
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
    radius = r;
    damping = damp;
    stiffness = stif;
  } 

  void update (float targetX, float targetY){
    float forceX = (targetX - x)*stiffness;
    float ax = forceX/mass;
    vx = damping*(vx + ax);
    x += vx;
    //float forceY = (targetY- y) * stiffness;
    //forceY += gravity;
    //float ay = forceY/mass;
    //vy = damping * (vy +ay);
    //y += vy;

  }

  void display (float nx, float ny){
    noStroke();
    fill(100,100);
    ellipse (x, y, radius*2, radius*2);
    fill(0,100);
    ellipse (x, y, radius/1.5, radius/1.5);
    stroke(200,20,0,80);
    line (x, y, nx, ny);

  }
}

class FixedSpring extends Spring2D{
  float springLength;

  FixedSpring(float xpos, float ypos, float m, float g, float r, float damp, float stif, float s){
    super(xpos, ypos, m, g, r, damp, stif);
    springLength = s;
  } 

  void update (float newX, float newY){
    float dx = x - newX;
    float dy = y - newY;
    float angle = atan2(dy, dx);
    float targetX = newX + cos(angle) * springLength;
    float targetY = newY + sin(angle) * springLength;
    //Activate update method from Spring2D
    super.update(targetX, targetY);
    //constrain to display windowcl
    x = constrain(x, radius, width-radius);
    y = constrain(y, radius, height-radius);
  }
}


void keyPressed(){
  if (key == 'a')pdfoutput = true;
}



