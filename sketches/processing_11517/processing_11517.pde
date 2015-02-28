
//////////////////////
//Gravity_Blast v0.1//
//By Justas Medeisis//
//////////////////////
//A gravity-based particle system.

ParticleSystem ps;
int noDiv = 20; //determines number of particles; every horizontal n verticals noDiv unit,
               //generate new particle


void setup() {
  size(500,500);
  background(0);
  smooth();
  
  ps = new ParticleSystem(noDiv);
  
}

void draw() {
  noStroke();
  fill(0);
  rect(0,0,width,height);
   
  ps.run();
}

void mousePressed(){
  ps.well.loc.x = mouseX;
  ps.well.loc.y = mouseY;
}

void mouseDragged(){
  ps.well.loc.x = mouseX;
  ps.well.loc.y = mouseY;
}

