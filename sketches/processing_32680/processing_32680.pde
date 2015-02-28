
import processing.opengl.*;

NonlinearSystem NLS;
int curr_system = 1;
float angle = 0;

void setup() {
  size(900, 560, OPENGL);
  smooth(); 
  stroke(255, 40);  
  NLS = new NonlinearSystem(curr_system);
}

void draw() {
  background(0);
  lights();
  angle += PI/180;
  pushMatrix();  
  translate(width/2, height/2); 
  /* this next block of code was borrowed from 'Felix Woitzel'
   ** the code is used to control the angle of the camer
   ** source: http://www.openprocessing.org/visuals/?visualID=30490
   */
  //Begin borrowed code
  if (mouseY == 0)
    mouseY = 1;
  float w1 = (float) mouseX / (float) width * PI * 2;
  float w2 = (float) mouseY / (float) height * PI;    
  camera(width * cos(w1) * sin(w2), cos(w2) * width, width * sin(w1) * sin(w2), 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f);
  //END borrowed code  
  rotateX(PI/7);  
  rotateY(PI/3);
  scale(0.9);  
  NLS.Render();
  popMatrix();  
  //if (frameCount % 300 == 0) saveFrame("rossler-####.jpg");
}

void keyPressed() {
  if (key == '1')
    curr_system = 0; 
  if (key == '2')
    curr_system = 1;      
  //disrupt the system and create the new system specified by the curr_system parameter
  NLS.Disrupt(curr_system);
}


