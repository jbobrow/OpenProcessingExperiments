
/**
 * 
 * Project 3 Template
 * UCLA Design Media Arts, Spring 2011 
 * Prof. Casey Reas
 * 
 * Based on code from Lorenzo Bravi:
 * http://www.lorenzobravi.com/projects/workshop-isia/
 */

PShape zorak;
PShape L_Eye_1;
PShape L_Eye_2;
PShape L_Eye_3;
PShape FaceBody;
PShape Jaw;
PShape R_eye;
PShape L_Antennae;
PShape R_Antennae_1;
PShape R_Antennae_2;
PShape R_Antennae_3;

float v; 
float easing = 1;  // Between 0 and 1
float volumeScalar = 700;
boolean noMic = true;


void setup () {
  shapeMode(CENTER);
  smooth();
  size (500, 500);
  setupVolume();
  zorak = loadShape("ZORAK.svg");
  L_Eye_1 = zorak.getChild ("L eye 1");
  L_Eye_2 = zorak.getChild ("L Eye closing 2");
  L_Eye_3 = zorak.getChild ("L Eye closing 3");
  FaceBody = zorak.getChild("Face and body");
  Jaw = zorak.getChild("Jaw");
  R_eye = zorak.getChild("R eye");
  L_Antennae = zorak.getChild("L Antennae");
  R_Antennae_1 = zorak.getChild("R Antennae");
  R_Antennae_2 = zorak.getChild("R Antennae 2");
  R_Antennae_3 = zorak.getChild("R antennae 3");
}

void draw() {
  
  getVolume();
  if (noMic == true) {
    v = map(mouseX, 0, width, 0, 1000);  
  }  
  
  testFace();

  //saveFrame("mask-####.png");
}



