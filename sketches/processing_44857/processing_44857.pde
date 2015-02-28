

// camera origin (xyz), yaw
//float eyex, eyey, eyez, phi;
float phi;
PVector eyepos = new PVector(0,0,0);
PVector eyevel = new PVector(0,0,0);
float velocity, turnrate; // multipliers for movement, turning
boolean[] keys = new boolean[256]; // ASCII
boolean[] keycodes = new boolean[256]; // codes: arrows, etc.

Body[] bodies = new Body[48];

void setup() {
  size(640, 480, P3D);
  lights();
  sphereDetail(10);
  
  // default perspective, but with a better clip plane
  perspective(PI / 3.0, float(width)/float(height),
      height / 1000.0, height * 50.0 );

  // establecer reglas de mover
  //eyex = eyey = eyez = phi = 0;
  phi = HALF_PI;
  velocity = 0.5;
  turnrate = 3;
  for(int i = 0; i < keys.length; i++)
    keys[i] = false; // obviamente no se presione ningunas llaves
  
  for(int i = 0; i < bodies.length; i++)
    bodies[i] = new Body(0, eyepos.y+2, 0);
    
}

void draw()
{
  background(220,220,255);
  ambientLight(220, 220, 220);
  directionalLight(0,255,255,0,1,-3);
  
  // check for movement/action; actualiza eye, phi
  Impulse();
  
  // nota que el sistema de coordenadas es izquierdista-orientado
  // (con +x al derecho y +y al bajo)
  camera(eyepos.x, eyepos.y, eyepos.z,
      eyepos.x + cos(phi),eyepos.y + sin(phi),eyepos.z,
      0,0,-1);
  //println(eyepos);
  
  for(int i = 0; i < bodies.length; i++)
  {
    bodies[i].flY += bodies[i].flSpeed;
    pushMatrix();
    translate(bodies[i].flX,-bodies[i].flY,bodies[i].flZ);
    bodies[i].think();
    popMatrix();
    
    if(bodies[i].flY > (eyepos.y + 2))
    {
      bodies[i] = null;
      bodies[i] = new Body(random(-250,250), random(eyepos.y-1000,eyepos.y-400), random(-150,150));
      bodies[i].randomize();
    }
    
    if(dist(bodies[i].flX,bodies[i].flY,bodies[i].flZ,eyepos.x,eyepos.y,eyepos.z) < 100)
    {
      bodies[i].flSpeed = max(0.75,bodies[i].flSpeed*0.9);
      bodies[i].setAbstraction(min(1.01*bodies[i].flAbstraction,5));
    }
  }
  
}







void keyPressed()
{
  if(key < 256)
  {
    if(key == CODED)
      keycodes[key] = true;
    else
      keys[key] = true;
  }
}

void keyReleased()
{
  if(key < 256)
  {
    if(key == CODED)
      keycodes[key] = false;
    else
      keys[key] = false;
  }
}

void Impulse()
{
  // aquí se prueba todas llaves para movimiento etcetera
  if(keys['w'])
  {
    eyevel.set(velocity*cos(phi), velocity*sin(phi), 0);
    //eyevel.set(Collide(eyepos, eyevel));
    //eyevel.sub( // sub the proj of eyevel onto surfacenormal
    //  PVector.mult(surfacenormal,eyevel.dot(surfacenormal))
    //  );
    eyepos.add(eyevel);
  }
  if(keys['s'])
  {
    eyevel.set(-velocity*cos(phi), -velocity*sin(phi), 0);
    //eyevel.set(Collide(eyepos, eyevel));
    eyepos.add(eyevel);
  }
  if(keys['a'])
  {
    phi -= turnrate * 0.01;
  }
  if(keys['d'])
  {
    phi += turnrate * 0.01;
  }
  if(keys['i'])
  {
    eyevel.set(0, 0, velocity);
    //eyevel.set(Collide(eyepos, eyevel));
    //eyevel.sub( // sub the proj of eyevel onto surfacenormal
    //  PVector.mult(surfacenormal,eyevel.dot(surfacenormal))
    //  );
    eyepos.add(eyevel);
  }
  if(keys['k'])
  {
    eyevel.set(0, 0, -velocity);
    //eyevel.set(Collide(eyepos, eyevel));
    eyepos.add(eyevel);
  }
}




class Body
{
  float flRadius = 4, flSpeed = 2, flFlapRate = 1, flAlpha = 0;
  float flX = 0, flY = 0, flZ = 0;
  float flAbstraction = 1;
  
  Wing wLeft = new Wing(8, 26, 14);
  Wing wRight = new Wing(8, 26, 14);
  float flLeftTheta = PI, flLeftPhase = 0, flLeftRange = QUARTER_PI;
  float flRightTheta = 0, flRightPhase = PI, flRightRange = QUARTER_PI;
  
  Body(float x, float y, float z)
  {
    flX = x;
    flY = y;
    flZ = z;
  }
  
  void randomize()
  {
    flRadius = random(1,3);
    flSpeed = random(1,5);
    flFlapRate = random(0.5,2);
    flLeftRange = flRightRange = random(QUARTER_PI / 2.0,HALF_PI);
  }
  void setAbstraction(float f)
  {
    flAbstraction = f;
    wLeft.setAbstraction(f);
    wRight.setAbstraction(f);
  }
  
  void think()
  {
    if(flAlpha < 255)
    {
      flAlpha += 10;
      wLeft.setAlpha(flAlpha);
      wRight.setAlpha(flAlpha);
    }
    
    pushMatrix();
    translate(0,0,2*cos(flLeftPhase));
    
    fill(32, 32, 48, flAlpha);
    noStroke();
    if(flAbstraction > 1)
      stroke(flAbstraction);
    sphere(flRadius + (flAbstraction - 1));
    
    pushMatrix(); // left wing
    translate(-flRadius*0.9, 0, 0);
    rotateY(flLeftTheta + flLeftRange * sin(flLeftPhase));
    wLeft.think();
    flLeftPhase += TWO_PI / (frameRate * flFlapRate);
    popMatrix();
    
    pushMatrix(); // right wing
    translate(flRadius*0.9, 0, 0);
    rotateY(flRightTheta + flRightRange * sin(flRightPhase));
    wRight.think();
    flRightPhase += TWO_PI / (frameRate * flFlapRate);
    popMatrix();
    
    popMatrix();
  }
}

class Wing
{
  float flBreadth = 64, flLength = 32;
  float ifeathers = 8;
  float flSpread = HALF_PI;
  float flAbstraction = 1;
  float flAlpha = 255;
  
  Feather[] feathers;
  
  Wing(int f, float b, float l)
  {
    ifeathers = f;
    flBreadth = b;
    flLength = l;
    fillWing();
  }
  Wing()
  {
    fillWing();
  }
  
  void fillWing()
  {
    feathers = new Feather[(int)ifeathers];
    for(int i = 0; i < ifeathers; i++)
      feathers[i] = new Feather();
  }
  void setAlpha(float a)
  {
    flAlpha = a;
  }
  void setAbstraction(float f)
  {
    flAbstraction = f;
    for(int i = 0; i < ifeathers; i++)
      feathers[i].setAbstraction(f);
  }
  
  void think()
  {
    stroke(32,32,64,flAlpha);
    
    pushMatrix();
    rotateZ(-flSpread / ifeathers);
    for(int i = 0; i < ifeathers; i++)
    {
      rotateZ(flAbstraction * flSpread / ifeathers);
      feathers[i].flLength = flAbstraction * flLength - (flLength * sqrt(i / (ifeathers * 1.5)));
      feathers[i].flWidth = feathers[i].flLength * 4;
      feathers[i].think();
    }
    popMatrix();
  }
}

class Feather
{
  float flLength = 64, flWidth = 64, flDensity = 4;
  float flAbstraction = 1;
  
  void setAbstraction(float f)
  {
    flAbstraction = f;
  }
  
  void think()
  {
    strokeWeight(1);
    curve(
      -1, flAbstraction*0.5*flWidth*sin(PI / flLength * -1), flAbstraction - 1,
      0, 0, 0,
      flLength, 0, 0,
      flLength + 1, 0.5*flWidth*sin(PI / (flLength+1) * -1), 0
    );
    curve(
      -1, -0.5*flWidth*sin(PI / flLength * -1), 0,
      0, 0, 0,
      flLength, 0, 0,
      flLength + 1, flAbstraction*-0.5*flWidth*sin(PI / (flLength+1) * -1), 0
    );
  }
}

