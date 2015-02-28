
////////////\\\\\\\\\\\\\// rocket test

import fisica.*;

FWorld world;

//FBox rocket;
FPoly rocket;

boolean[] keys = new boolean[256];

float l = 0.0;

float across = 2000.0;

// setup
void setup() {
  PFont font = loadFont("CenturyGothic-24.vlw");
  textFont(font);
  // display
  size(880,440);
  smooth();
  // Fisica
  Fisica.init(this);
  // FWorld
  world = new FWorld(0,0,across,440);
  world.setGravity(0,0);
  world.setEdges(0,0,across,440,color(0,0,0,0));
  // Rocketship
//  rocket = new FBox(10.0,10.0);
  rocket = new FPoly();
  float s = 5;
  rocket.vertex(-s,3*s);
  rocket.vertex(-s,s);
  rocket.vertex(0,0);
  rocket.vertex(s,s);
  rocket.vertex(s,3*s);
  rocket.vertex(0,2*s);
  rocket.setDensity(0.025);
  rocket.setNoStroke();
  rocket.setFill(0,0,0);
  float x = across/2;
  float y = 120 + 200*noise(x/100.0) - 75*noise((x+1257)/50.0);
  rocket.setPosition(x,y);
  rocket.setAngularDamping(0.5);
  world.add(rocket);
  //
//  FBox wall = new FBox(40.0,200.0);
//  wall.setNoStroke();
//  wall.setFill(0,0,0);
//  wall.setDensity(0.3);
//  wall.setStatic(true);
//  wall.setPosition(220,300);
//  world.add(wall);
  //
  FPoly fline = new FPoly();
  fline.vertex(0,440);
  for(float i = 0; i <= across; i+=10.0) {
    float x1 = i;
    x1 = constrain(x1, 0.0, across);
    float y1 = 120 + 200*noise(i/100.0) + 200*noise((i/200));
    fline.vertex(x1,y1);    
  }
  fline.vertex(across,440);
  fline.setStatic(true);
  fline.setNoStroke();
  fline.setFill(0,0,0);
  fline.setFriction(10);
  world.add(fline);
//  
//  fline = new FPoly();
//  fline.vertex(0,0);
//  for(float i = 0; i <= width; i+=10.0) {
//    float x1 = i;
//    float y1 = 120 + 200*noise(i/100.0) - 150*noise((i+1257)/50.0);
//    fline.vertex(x1,y1);    
//  }
//  fline.vertex(440,0);
//  fline.setStatic(true);
//  fline.setNoStroke();
//  fline.setFill(0,0,0);
//  world.add(fline);    
}

// draw
void draw() {
  l = lerp(l,rocket.getVelocityX(),0.01);
//  l = lerp(l,rocket.getX(),0.1);
  float vx = constrain(rocket.getX() + l, width*0.5, across-width*0.5);
  translate(-vx + width*0.5,0);
  background(255);
  //
  fill(200); noStroke();
  beginShape();
  vertex(0,440);
  for(float i = 0; i <= across; i+=10.0) {
    float x1 = i;
    float y1 = 160 + 100*noise((i+52477)/100.0);
    vertex(x1,y1);    
  }
  vertex(across,440);
  endShape();  
  //
  fill(150); noStroke();
  beginShape();
  vertex(0,440);
  for(float i = 0; i <= across; i+=10.0) {
    float x1 = i;
    float y1 = 190 + 100*noise((i+2324)/100.0);
    vertex(x1,y1);    
  }
  vertex(across,440);
  endShape();
  control();
  world.step();
  world.draw();
  fill(255,120,100,160);
  rect(0,0,across,440);
  fill(255);
  textAlign(CENTER);
  text("controls = z and m", across/2,50);
}

// controls
void control() {
  float power = - 0.3;
  float torque = 0.003;
  float angle = rocket.getRotation();
  // left
  if(keys[90]) {
    rocket.addForce(-power*sin(angle), power*cos(angle));
    rocket.addTorque(torque);
  }
  // right
  if(keys[77]) {
    rocket.addForce(-power*sin(angle), power*cos(angle));
    rocket.addTorque(-torque);
  }  
  // more circles
  if(mousePressed) {
    FCircle circle = new FCircle(random(10.0,60.0));
    circle.setPosition(mouseX,mouseY);
    circle.setFill(0,0,0);
    circle.setNoStroke();
    circle.setDensity(0.02);
//    world.add(circle);
  }
  rocket.addForce(0,0);
}


// keys
void keyPressed() {
  keys[keyCode] = true;
  println(keyCode);
  world.setGravity(0,50);
}

void keyReleased() {
  keys[keyCode] = false;
}

