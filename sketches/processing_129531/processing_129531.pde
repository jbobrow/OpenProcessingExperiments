
/////////////////////////////////
// SCIMA-200-13                //
// Homework for 20131028       //
//                             //
//                             //
//   By                        //
//   William Felker            //
//                             //
/////////////////////////////////

float angle = 0 ;// ie Global Variable
float xradius = 1;
float yradius = 1;

void setup() {
  size(1280, 720, "processing.core.PGraphicsRetina2D");
  background(0);
  imageMode(CENTER);
}

void draw() {


  float xpos = xradius * cos(radians(angle)) +640; //ie local Variables
  float ypos = yradius * sin(radians(angle)) +360;
  float sleep = 255*cos(radians(angle));
  sleep = abs(sleep); // Absolute value or make it possitive
  angle+=mouseX;

  stroke(random(0, 255), random(0, 255), random(0, 255));
  //fill(random(0,255),random(0,255),random(0,255));
  ellipse(xpos, ypos, 10, 10);
  angle+=137.5; // Speed of orbit (Golden Number 137.5)
  xradius +=.1;
  yradius +=.1;
}



