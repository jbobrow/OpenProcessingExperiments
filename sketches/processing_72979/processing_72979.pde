
//=================================================================
// University of Melbourne
// Master of Architecture// Natural Systems Studio// Semester 2-2012
// Student: Fernando Ghelfi
// Sketch: Emerging City
// Based on sketch "Orbiting Particles" by Gwyllim Jahn
// GUI Bar by Generative Gestaltung
//==================================================================


//=============================
import controlP5.*;
import toxi.geom.*;
import processing.opengl.*;

//=============================

ControlP5 controlP5;

boolean showGUI = false;
Slider[] sliders;
int drawMode = 1;

//=============================
// initialise

ParticleSystem system;

ArrayList<Population> pop = new ArrayList<Population>();
ArrayList<ParticleSystem> forest = new ArrayList<ParticleSystem>();

ArrayList<Vec3D> trail;

int numAgents = 500;
int numTrees = 23;

float crownRadius;

int trailLength  = 500;
float agentSpeed = 5;
float attractScale = 150;
float spin = 500;//the smaller the spin quicker the centre of node expands
float push = 0.05;// bigger the push more concentric pop will go into nodes

// setup

void setup() {
  size(1200, 800, P3D);
  //smooth();
  background(0);

setupLandscape();

setupGUI();
  
}   // ============end of setup

//draw

void draw() {

//background (0);
fill(0,5);
rect(0, 0, width, height);
   
  for (ParticleSystem t :forest) {
    t.run();
  }

  drawGUI();


  //if ((frameCount %50)==0){
 // saveFrame("emergcity16-###.tiff");
 // }
} // ===========end of draw

void keyReleased(){
  if(key=='m' || key=='M') {
    showGUI = controlP5.group("menu").isOpen();
    showGUI = !showGUI;
  }
  if (showGUI) controlP5.group("menu").open();
  else controlP5.group("menu").close();

  if (key == DELETE || key == BACKSPACE) setupLandscape();
}
String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}

