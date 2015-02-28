
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65055*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/**
 * Retained Texture Sphere (for processing-2.0)
 * by by Martin Prout, based on code by Andres Colubri   
 * modified to use ArcBall  
 * Hold down 'x', 'y' or 'z' key to constrain axis of
 * rotation.
 * 
 * 
 * A 3D textured sphere features arcball rotation control.
 */

PImage texmap;
PShape planet;

float globeRadius = 200;
ArcBall arcball;

void setup() {
  size(640, 480, P3D); 
  arcball = new ArcBall(this, 0, 0, height);
  //texmap = loadImage("world32k.jpg");    
  texmap = loadImage("jupiter.jpg");
  sphereDetail(40); 
  smooth(8);
  noStroke(); 
  planet = createShape(SPHERE, globeRadius);
  planet.texture(texmap);
}

void draw() {    
  background(0, 0, 10);
  lights();  
  ambientLight(40, 40, 40);
  directionalLight(100, 100, 90, 1, -1, 0);
  spotLight(200, 200, 200, 0, 200, 0, -1, -1, 0, PI/8, 200);
  translate(width * 0.5, height * 0.5);
  arcball.update();
  shape(planet);
}




