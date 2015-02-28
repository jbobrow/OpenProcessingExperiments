
/* 
 * Cyarts Interactive Logo
 * by Daniel C. Young
 * http://danielcyoung.com/projects/cyarts
 * based on Pyrographie by Ricard Marxer Piñón (caligraft.com)
*/

import geomerative.*;

RShape logo;
Particle[] particles;

static final int MARGIN = 75;
static final int SEGMENT_LENGTH = 18;
static final int VELOCITY = 30;
static final int OFFSET = 2;

int numPoints;           // number of points along logo
boolean isNear = false;  // simulates user proximity

void setup() {
  size(800,600);
  smooth();
  frameRate(30);
  initialize();
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2);
  
  for(int i=0;i<numPoints;i++){
    particles[i].update(logo);
    
    // If user is far, reanimate particles by adding random velocity
    if(!isNear) particles[i].velocity.add(new RPoint(random(-OFFSET,OFFSET),random(-OFFSET,OFFSET)));
    particles[i].draw(g);
  }
  popMatrix();
}

/* Loads svg and create particles with initial velocity based
 * on segments and points
 */
void initialize(){
  RG.init(this);
  logo = RG.loadShape("cx.svg");
  
  // Breaks svg paths into segments
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RCommand.setSegmentLength(SEGMENT_LENGTH);
  
  // Places logo in center with margin
  logo.centerIn(g, MARGIN);
  
  // Obtain points based on segements
  RPoint[] pointsOnLogo = logo.getPoints();
  if(pointsOnLogo != null) numPoints = pointsOnLogo.length;
    
  // Create array of particles based on points
  if(particles == null) particles = new Particle[numPoints];
  for(int i=0;i<numPoints;i++){
    particles[i] = new Particle(g,i);
    particles[i].velocity.add(new RPoint(random(-VELOCITY,VELOCITY),random(-VELOCITY,VELOCITY)));
  }  
}

/* Simulates user proximity to trigger logo animation */
void mousePressed(){
  isNear = !isNear;
}

void keyPressed() {
  if(key == 's'){
    saveFrame();
  }
}

