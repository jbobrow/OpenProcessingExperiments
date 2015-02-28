
//import peasy.*;

boolean isProcessingJS = true;

float rotationY = -0.4, rotationX = 0, rotationZ = 0;
float rotLeft = 0;
float rotRight = 0;
float rotXUp = 0;
float rotXDown = 0;
float rotZUp = 0;
float rotZDown = 0;
final int stepsPerRotation = 60;
final double rotStep = HALF_PI / stepsPerRotation;  //90 STEPS PER ROTATION (30 FPS = 3 SECS)
boolean spacePressed = false;
PVector ballPos;
int orientation = 0;
int diamScoresX, diamScoresY, scoresX, scoresY;

int boxSize = 400;
int particsPerRow = 5;

Magneto m1, m2, m3;
Particle[] particles = new Particle[ (int)pow(particsPerRow, 3) ];

//PeasyCam cam;


/* Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.*/
void setup() {
  /* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/
  size(1000, 800, P3D);
  
  diamScoresX = round(width * 0.74);
  diamScoresY = round(height * 0.2);

  if (!isProcessingJS) {  
    smooth(8);
    scoresX = diamScoresX + 20;
    scoresY = diamScoresY + 7;
  } 
  else {
    scoresX = diamScoresX + 28;
    scoresY = diamScoresY;
  }

  textSize(30);
  //ballPos = new PVector(0, 0, 0);
  m1 = new Magneto(0, 0, 0, color(254, 245, 0) );
  m2 = new Magneto(0, 0, 0, color(0, 245, 254) );
  m3 = new Magneto(0, 0, 0, color(254, 0, 245) );

  putParticlesOnStage();

//  cam = new PeasyCam(this, width/2, height/2, 0, 700);
//  cam.setMinimumDistance(50);
//  cam.setMaximumDistance(5000);
}
/* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/


/* Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.*/
void draw() {
  /* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/
  background(255);
  displayScores();

  translate (width/2, height/2, 0); 
  applyRotations();

  applyForces();

  drawBox();
  
  //saveFrame("output/pio#####.tga");
}
/* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/


/* Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.*/
void displayScores() {
  /* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/
  noStroke();   
  sphereDetail(4, 2);

  pushMatrix();

  //Yellow diamond
//  translate(850, 200);
  translate(diamScoresX, diamScoresY);
  pushMatrix();
  rotateY(frameCount*0.07);
  rotate(frameCount*0.05);
  fill(color(254, 245, 0));
  stroke(color(255, 255, 0));
  sphere(9);
  popMatrix();

  //Cyan diamond
  translate(0, 30);
  pushMatrix();
  rotateY(frameCount*0.07);
  rotate(frameCount*0.05);
  fill(color(0, 245, 254));
  stroke(color(0, 255, 255));
  sphere(9);
  popMatrix();

  //Pink diamond
  translate(0, 30);
  pushMatrix();
  rotateY(frameCount*0.07);
  rotate(frameCount*0.05);
  fill(color(245, 0, 254));
  stroke(color(255, 0, 255));
  sphere(9);
  popMatrix();

  popMatrix();

  fill(170);
  textSize(18);
  text(m1.diamsAccum, scoresX, scoresY );
  text(m2.diamsAccum, scoresX, scoresY+30 );
  text(m3.diamsAccum, scoresX, scoresY+60 );
}
/* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/


/* Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.*/
void putParticlesOnStage() {
  /* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/
  float beginning = boxSize * -0.5;
  float end = boxSize * 0.5;
  float stepDistance = boxSize / (particsPerRow-1);

  int i = 0;
  for (float x = beginning; x <= end; x+= stepDistance) {
    for (float y = beginning; y <= end; y+= stepDistance) {
      for (float z = beginning; z <= end; z+= stepDistance) {
        particles[i] = new Particle( new PVector(x, y, z), color( map(x, beginning, end, 0, 255), map(y, beginning, end, 0, 255), map(z, beginning, end, 0, 255) ) );
        i++;
      }
    }
  }
}
/* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/


/* Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.*/
void applyRotations() {
  /* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/
  rotateY(rotationY);
  rotateX(rotationX);
  rotateZ(rotationZ);

  if (rotLeft > 0) { 
    rotationY -= rotStep;
    rotLeft --;
  }

  if (rotRight > 0) { 
    rotationY += rotStep;
    rotRight--;
  }

  if (rotXUp > 0) { 
    rotationX += rotStep;
    rotXUp--;
  }

  if (rotXDown > 0) { 
    rotationX -= rotStep;
    rotXDown--;
  }

  if (rotZUp > 0) { 
    rotationZ += rotStep;
    rotZUp--;
  }

  if (rotZDown > 0) { 
    rotationZ -= rotStep;
    rotZDown--;
  }
}
/* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/


/* Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.*/
void applyForces() {
  /* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/
  int theClosest = 15000;
  m1.update();
  m1.display();
  m2.update();
  m2.display();
  m3.update();
  m3.display();

  int howClose = 0;
  for ( int i=0; i < particles.length; i++ ) {    

    PVector force = m1.attract(particles[i].location);
    particles[i].seek(force);
    force = m2.attract(particles[i].location);
    particles[i].seek(force);
    force = m3.attract(particles[i].location);
    particles[i].seek(force);

    particles[i].run();

    if ( i<particles.length-1 && howClose < theClosest ) {
      for (int j = 0; j < particles.length; j++) {
        if (!isProcessingJS) {
          howClose += PVector.sub(particles[i].location, particles[j].location).magSq();
        }else{
          howClose += (PVector.sub(particles[i].location, particles[j].location).x)*(PVector.sub(particles[i].location, particles[j].location).x) + (PVector.sub(particles[i].location, particles[j].location).y)*(PVector.sub(particles[i].location, particles[j].location).y) + (PVector.sub(particles[i].location, particles[j].location).z)*(PVector.sub(particles[i].location, particles[j].location).z); 
        }
      }
    }
  }

  if (howClose < theClosest) {

    for ( int i=0; i < particles.length; i++ ) {

      if (frameCount%10 < 7) { 
        //print("e");
        // linear explosion
        particles[i].velocity = new PVector( random(-2, 2), random(-2, 2), random(-2, 2) );
        particles[i].acceleration = new PVector( random(-200, 200), random(-200, 200), random(-200, 200) );
        particles[i].seek(new PVector( random(-200000, 200000), random(-200000, 200000), random(-200000, 200000) ));
        for (int times = 0; times < frameRate; times++) {
          particles[i].run();
        }
      }
      else {
        // more random explosion
        //print("b");
        particles[i].seek(new PVector( random(-200000, 200000), random(-200000, 200000), random(-200000, 200000) ));
        for (int times = 0; times < frameRate; times++) {
          particles[i].velocity.add( new PVector( random(-0.2, 0.2), random(-0.2, 0.2), random(-0.2, 0.2) ));
          particles[i].acceleration.add( new PVector( random(-2, 2), random(-2, 2), random(-2, 2) ));
          particles[i].run();
        }
      }
    }
  }
}
/* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/


/* Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.*/
void drawBox() {
  /* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/
  fill(230);
  stroke(245, 254, 0); 
  line(0, 0, 0, 200, 0, 0); 
  text("x", 200, 0, 0);
  stroke(0, 254, 245); 
  line(0, 0, 0, 0, 200, 0); 
  text("y", 0, 200, 0);
  stroke(245, 0, 254); 
  line(0, 0, 0, 0, 0, 200); 
  text("z", 0, 0, 200);

  stroke(0);
  noFill();
  box(boxSize);
}
/* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/


/* Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.*/
void keyPressed() {
  /* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/
  //if (!isProcessingJS) println("x: "+rotationX+"   y: "+rotationY+"    or:"+orientation); 
    if (key == CODED) {
      if (!spacePressed) {
        if (keyCode == LEFT && rotLeft < stepsPerRotation*2 ) { 
          rotRight = 0;
          rotLeft += stepsPerRotation;
          orientation++;
          orientation %= 4;
        }
        if (keyCode == RIGHT && rotRight < stepsPerRotation*2) {
          rotLeft = 0;
          rotRight += stepsPerRotation;
          orientation--;
          orientation += 4;
          orientation %= 4;
        }
        if (keyCode == UP) {
          switch (orientation) {
          case 0:
            if (rotXUp < stepsPerRotation * 2) {
              rotXUp += stepsPerRotation;
              rotXDown = 0;
            }
           break;
          case 1:
            if (rotZDown < stepsPerRotation * 2) {
              rotZDown += stepsPerRotation;
              rotZUp = 0;
            }
            break;
          case 2:
            if (rotXDown < stepsPerRotation * 2) {
              rotXDown += stepsPerRotation;
              rotXUp = 0;
            }
            break;
          case 3:
            if (rotZUp < stepsPerRotation * 2) {
              rotZUp += stepsPerRotation;
              rotZDown = 0;
            }
            break;
          }
        }
        if (keyCode == DOWN) {
          switch (orientation) {
          case 0:
            if (rotXDown < stepsPerRotation * 2) {
              rotXDown += stepsPerRotation;
              rotXUp = 0;
            }
            break;
          case 1:
            if (rotZUp < stepsPerRotation * 2) {
              rotZUp += stepsPerRotation;
              rotZDown = 0;
            }
            break;
          case 2:
            if (rotXUp < stepsPerRotation * 2) {
              rotXUp += stepsPerRotation;
              rotXDown = 0;
            }
           break;
          case 3:
            if (rotZDown < stepsPerRotation * 2) {
              rotZDown += stepsPerRotation;
              rotZUp = 0;
            }
            break;
          }
        }
      }
      else {
        if (keyCode == LEFT)  ballPos.x-=3;
        if (keyCode == RIGHT)  ballPos.x+=3;
        if (keyCode == UP)  ballPos.y-=3;
        if (keyCode == DOWN)  ballPos.y+=3;
      }
    }
    else {
      if (key == ' ') spacePressed = true;
    }
}
/* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/


/* Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·Ã�Â·.*/
void keyReleased() {
  /* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/
  if (key == ' ') spacePressed = false;
}
/* Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· . Ã�Â· Ã�Â· Ã�Â· Ã�Â· .*/
class Magneto {

  PVector location;
  PVector velocity;
  PVector acceleration;

  PVector pointToGo;

  float r;
  float maxforce;
  float maxspeed;
  color myColor;

  color diamColor;
  int diamSize;
  int diamsAccum;
  
  final int maxDiamSize = 8;

  Magneto(float x, float y, float z, color _myColor) {
    acceleration = new PVector(0, 0, 0);
    velocity = new PVector(0, 0, 0);
    location = new PVector(x, y, z);
    r = 5.0;
    myColor = _myColor;

    pointToGo = new PVector(random(-200, 200), random(-200, 200), random(-200, 200));
    diamColor = color(245, random(220), random(240) );
    diamSize = round(random(1,maxDiamSize));
    diamsAccum = 0;
  
    maxspeed = 4;
    maxforce = 0.07;
  }


  void update() {
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);

    if (location.dist(pointToGo) < 1) {
      //Point reached. We increase the score and calculate a new point random position.
      diamsAccum += diamSize;
      pointToGo = new PVector(random(-200, 200), random(-200, 200), random(-200, 200));
      diamColor = color(245, random(120), random(170) );
      diamSize = round(random(5,maxDiamSize));
    }
    seek(pointToGo);
  }


  void applyForce(PVector force) {
    acceleration.add(force);
  }


  void seek(PVector target) {
    PVector desired = PVector.sub(target, location);

    float d = desired.mag(); 
    desired.normalize();
    if ( d < 75 ) {
      float magn = map(d, 0, 100, 0, maxspeed);
      desired.mult(magn);
    }
    else {
      desired.mult(maxspeed);
    }

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }


  void display() {    
    stroke(0);
    pushMatrix();
    translate(location.x, location.y, location.z);
    float theta = (isProcessingJS ? atan2(velocity.y, velocity.x) : velocity.heading() ) + HALF_PI;
    rotateZ(theta);
    float theta2 = atan2(velocity.z, velocity.x) + HALF_PI*3;
    rotateY(theta2);
//    float theta3 = atan2(velocity.z, velocity.y) + HALF_PI*3;
//    rotateX(theta3);

    fill(myColor);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);

    fill(0, 180);
    noStroke();
    sphereDetail(20);
    sphere(6);
    popMatrix();

    pushMatrix();
    translate(pointToGo.x, pointToGo.y, pointToGo.z);
    rotateY(frameCount*0.07);
    rotate(frameCount*0.05);
    fill(diamColor);
    stroke(myColor);
    sphereDetail(4, 2);
    sphere(diamSize);
    popMatrix();
  }
  
  
  PVector attract(PVector pLoc) {
    PVector dir = PVector.sub(location, pLoc);
    float d = dir.mag();
    dir.normalize();
    d = constrain(d, 5, 100);
    float force = 100 / d*d;
    dir.mult(force);
    return dir;
  }
}

// Simple Particle System
// Daniel Shiffman <http://www.shiffman.net>
// adapted by jordirosa.com

// A simple Particle class

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;

  PVector pointToGo;

  float maxspeed, maxforce;

  color myColor;

  Particle(PVector l, color _myColor) {
    acceleration = new PVector(0, 0, 0);
    velocity = new PVector(0, 0, 0);
    location = l.get();
    myColor = _myColor;
    
    pointToGo = new PVector(0, 0, 0);

    maxspeed = 18;
    maxforce = 0.065;
  }

  void run() {
    update();
    display();
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  // Method to update location
  void update() { 
    velocity.add(acceleration);
    velocity.limit(maxspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Method to display
  void display() {
    stroke(myColor);
    fill(myColor);
    pushMatrix();
    translate(location.x, location.y, location.z);
    sphereDetail(4);
    sphere(1.5);
    popMatrix();
    //point(location.x, location.y, location.z);
  }


  void seek(PVector target) {

    PVector desired = PVector.sub(target, location);
    
    float d = desired.mag(); 
    desired.normalize();
    if ( d < 25 ) {
      float magn = map(d, 0, 50, 0, maxspeed);
      desired.mult(magn);
    }
    else {
      desired.mult(maxspeed);
    }

    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);
    applyForce(steer);
  }


  void setPointToGo(PVector target) {
    pointToGo = target.get();    
  }
  
}



