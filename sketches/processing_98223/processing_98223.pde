
PFont font;
int towerHeight; //Height of towers holding bungee cords, m 
double u; //Displacement from equilibrium, m
double L; //Equilibrium position, m
double m; //Mass, kg
double g; //Damping constant
double k; //Effective elasticity constant, N/m
int f; //External force, N
double gravity; //Gravitational constant, m/s^2
double t0; //Initial system time, s
int u0; //Initial position, m
int u0p; //Initial velocity, m/s
double t; //Change in time, s
int x; //Horizonal position, pixels
int y; //Vertical position, pixels
double capsuleHeight; //Current height from ground, m
double velocity; //Current velocity, m/s

//Slide bars & start button:
boolean start;
boolean mouseStart;
int massX;
boolean slidingMass;
boolean mouseMass;
int springX;
boolean slidingSpring;
boolean mouseSpring;
int dampingX;
boolean slidingDamping;
boolean mouseDamping;
boolean click; //To detect leading edge of a click


void setup() {
  /* //For Java mode:
  if (displayHeight <= displayWidth)
    size((5*displayHeight/6), (5*displayHeight/6));
  else
    size((5*displayWidth/6), (5*displayWidth/6));
  */
  //For JavaScript mode:
  size(640,640);
  smooth();
  ellipseMode(CENTER);
  rectMode(CENTER);
  font = createFont("Arial",16,true);
  textFont(font,36);
  x = width/2;
  
  //Default values:
  start = false;
  click = false;
  gravity = 9.81; //9.81
  towerHeight = 50; //50
  m = 200; //200;
  g = 15; //15;
  k = 155; //155;
  f = 0; //0;
  L = gravity*m/k;
  u0 = (int)(towerHeight - L - map(25/2 + 25, 0, height, 0, 2*towerHeight));
  u0p = 0;
  
  //Slide bar defaults:
  massX = (int)(width/6);
  springX = (int)(width/4);
  dampingX = (int)(width/4);
}

void draw() {
  //Sky:
  background(100,207,255);
  fill(0,203,15);
  noStroke();
  //Grass:
  rect(width/2, height-20, width, 40);
  //Start button:
  textAlign(CENTER);
  textFont(font,36);
  if (!start){
    fill(0,203,15);
    stroke(0);
    rect(85, 245, 120, 75);
    fill(0);
    text("Start", 85, 258);
  } else {
    fill(255,0,0);
    stroke(0);
    rect(85, 245, 120, 75);
    fill(0);
    text("Stop", 85, 258);
  }
  
  if (!mousePressed){
    click = false;
    mouseStart = (mouseX > 25 && mouseX < 145 && mouseY > 207.5 && mouseY < 282.5);
    mouseMass = (mouseX > 15 && mouseX < width/2 + 35 && mouseY > 20 && mouseY < 60);
    slidingMass = false;
    mouseSpring = (mouseX > 15 && mouseX < width/2 + 35 && mouseY > 80 && mouseY < 120);
    slidingSpring = false;
    mouseDamping = (mouseX > 15 && mouseX < width/2+ 35 && mouseY > 140 && mouseY < 180);
    slidingDamping = false;
  } 
  if (mousePressed && !click) {
    click = true;
    if (mouseStart) {
      start = !start;
      //For Java version:
      //t0 = System.nanoTime()/1000000000.0;
      //For JavaScript version:
      t0 = millis()/1000.0;
    } else if (mouseMass){
      slidingMass = true;
    } else if (mouseSpring){
      slidingSpring = true;
    } else if (mouseDamping){
      slidingDamping = true;
    }
  }
  
  if (!start){
    if (mousePressed && slidingMass){
      massX = mouseX - 25;
      if (massX < 0)
        massX = 0;
      else if (massX > width/2)
        massX = width/2;
      m = map(massX, 0, width/2, 50, 500);
    } else if (mousePressed && slidingSpring){
      springX = mouseX - 25;
      if (springX < 0)
        springX = 0;
      else if (springX > width/2)
        springX = width/2;
      k = map(springX, 0, width/2, 10, 300);
    } else if (mousePressed && slidingDamping){
      dampingX = mouseX - 25;
      if (dampingX < 0)
        dampingX = 0;
      else if (dampingX > width/2)
        dampingX = width/2;
      g = map(dampingX, 0, width/2, 0, 30);
    }
  }
  
  //Slide Bars:
  fill(192);
  noStroke();
  rect(width/4 + 25, 40, width/2, 20);
  rect(width/4 + 25, 100, width/2, 20);
  rect(width/4 + 25, 160, width/2, 20);
  fill(128);
  rect(25 + massX, 40, 20, 40);
  rect(25 + springX, 100, 20, 40);
  rect(25 + dampingX, 160, 20, 40);
  fill(0);
  textFont(font,24);
  textAlign(LEFT);
  text("Mass = " + (int)m + "." + (int)((m*10)%10) + " kg", width/2 + 45, 48);
  text("Spring k = " + (int)k + "." + (int)((k*10)%10) + " N/m", width/2 + 45, 108);
  text("Damping = " + (int)g + "." + (int)((g*10)%10) + " kg/s", width/2 + 45, 168);
  
  if (start)
    t = millis()/1000.0 - t0;
  else
    t = 0;
  L = gravity*m/k;
  u0 = (int)(towerHeight - L - map(25/2 + 25, 0, height, 0, 2*towerHeight));
  double mu = Math.sqrt(4*k*m - g*g)/(2*m);
  double A = u0 - f/k;
  double B = (u0p + (A*g)/(2*m))*(1/mu);
  if (start){
    u = Math.exp((-1*g*t)/(2*m))*(A*Math.cos(mu*t) + B*Math.sin(mu*t)) + f/k + L;
    velocity = -1*(((-1*g)/(2*m))*Math.exp((-1*g*t)/(2*m))*(A*Math.cos(mu*t) + B*Math.sin(mu*t)) + Math.exp((-1*g*t)/(2*m))*(-1*A*mu*Math.sin(mu*t) + B*mu*Math.cos(mu*t)));
    if (u > towerHeight - map(25/2 + 25, 0, height, 0, 2*towerHeight)){
      u = towerHeight - map(25/2 + 25, 0, height, 0, 2*towerHeight);
      velocity = 0.0;
    }
  } else {
    u = towerHeight - map(25/2 + 25, 0, height, 0, 2*towerHeight);
    velocity = 0.0;
  }
  y = (int)map((float)u, -towerHeight, towerHeight, 0, height);
  capsuleHeight = towerHeight - u;
  fill(0);
  stroke(0);
  ellipse(x,y,25,25);
  line(width/4, height/2, width/2-12, y);
  line(width/4, height/2, width/4 + 30, height-25);
  line(width/4, height/2, width/4 + 33, height-25);
  line(width/4, height/2, width/4 - 30, height-20);
  line(width/4, height/2, width/4 - 33, height-20);
  line(3*width/4, height/2, width/2+12, y);
  line(3*width/4, height/2, 3*width/4 + 30, height-20);
  line(3*width/4, height/2, 3*width/4 + 33, height-20);
  line(3*width/4, height/2, 3*width/4 - 30, height-25);
  line(3*width/4, height/2, 3*width/4 - 33, height-25);
  //Print time, height, and velocity, each rounded to one decimal:
  textFont(font,28);
  textAlign(RIGHT);
  text("Time:", width - 10, height/2 - 50);
  text((int)t + "." + ((int)(t*10))%10 + "s", width - 15, height/2 - 10);
  text("Height:", width - 10, height/2 + 50);
  text((int)capsuleHeight + "." + Math.abs(((int)(capsuleHeight*10))%10) + "m", width - 18, height/2 + 90);
  text("Velocity:", width - 10, height/2 + 150);
  if (velocity < 0 && velocity > -1)
    text("-" + (int)velocity + "." + Math.abs(((int)(velocity*10))%10) + "m/s", width - 10, height/2 + 190);
  else
    text((int)velocity + "." + Math.abs(((int)(velocity*10))%10) + "m/s", width - 10, height/2 + 190);
  
  //Personal plug:
  textFont(font,14);
  textAlign(CENTER);
  text("Jeff Kraus ~ University of Kansas ~ 2013", width/2, height - 5);
}


