
//Flo Wilson
//DSDN 142 - Particle exploration
//Based on the particle system tutorial by Daniel Shiffman

//draw a shape with the mouse and move it x, y axis to change
//3D effect 
ParticleSystem particleController;
public int w, h;  

void setup() {
  size(600, 600, P3D);
  
  smooth();
  noStroke();
  
  w = width;
  h = height;
  
  particleController = new ParticleSystem();
}
void update() {

  if(mousePressed == true) {
    PVector m = new PVector(mouseX, mouseY, pmouseX);
    particleController.addParticles(150, m); //lower particle add = faster programme response
  } 

  particleController.update();
  particleController.draw(); //call particle system to draw all the particles
}

void draw() {

  background(0);
  update();
}

 //function for taking pictures of the code image
void keyPressed() {
 if (key == 'r') {
  save(frameCount + "Project 2.jpg");
 } 
}

