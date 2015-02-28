
import netscape.javascript.*;
import traer.physics.*;



float MIN_MASS = 0.5;      // the minimum mass of a particle
float MAX_MASS = 2;      // the maximum mass of a particle
int NTHPIXEL = 7;          // to speed things up multiply this with 2,
// only each nth pixel will get into the particle system
int ELLIPSE_W = (int)(NTHPIXEL*0.8);  // ellipse diameter
int MIN_ELLIPSE_W = (int)(NTHPIXEL*0.2);
int MAX_ELLIPSE_W = (int)(NTHPIXEL*0.3);

Particle mouse;            // particle on mouse position
Particle[] particles;      // the moving particle
Particle[] orgParticles;   // original particles - fixed
color[] colors;            // color values from the image
ParticleSystem physics;    // the particle system

PImage img;                // the original image
int numPixels;             // the number of pixels in the original image
int numPixelsSmall;        // the number of pixels in the scaled-down-version of the image
int widthSmall;            // width of the scaled-down-version of the image
int heightSmall;           // height of the scaled-down-version of the image



void setup() {
  size(900, 300); 
  background(255);

  img = loadImage("sigradi_web.png");

  numPixels = img.width * img.height;
  widthSmall = img.width/NTHPIXEL;
  heightSmall = img.height/NTHPIXEL;
  numPixelsSmall = widthSmall * heightSmall;

  // Processing Setup
  noStroke();
  ellipseMode(CENTER);
  smooth();

  // Particle System + Detect Colors
  physics = new ParticleSystem(0, 0.1);
  mouse = physics.makeParticle();            // create a particle for the mouse
  mouse.makeFixed();                         // don't let forces move it
  particles = new Particle[numPixelsSmall];
  orgParticles = new Particle[numPixelsSmall]; 
  colors = new color[numPixelsSmall];
  

  
  img.loadPixels();
  int a;
  for (int x=0; x<widthSmall; x++) {           // go through all rows
    for (int y=0; y<heightSmall; y++) {        // go through all columns
      a = y*widthSmall+x;
      colors[a] = img.pixels[y*NTHPIXEL*img.width+x*NTHPIXEL];
      particles[a] = physics.makeParticle(random(MIN_MASS, MAX_MASS), x*NTHPIXEL, y*NTHPIXEL, 0);
      orgParticles[a] = physics.makeParticle(random(MIN_MASS, MAX_MASS), x*NTHPIXEL, y*NTHPIXEL, 0);
      orgParticles[a].makeFixed();
      // make the moving particles go to their former positions
      physics.makeSpring(particles[a], orgParticles[a], 0.4, 0.1, 0 );
      // make the moving particles get away from the mouse
      physics.makeAttraction(particles[a], mouse, -10000, 50);

    }
  }

}

void draw() {

background(255);
  noStroke();

  mouse.position().set(mouseX-100, mouseY-100, 0 );
  physics.tick();
  pushMatrix();
    translate(100, 100);
  dibujarLineas();
  dibujarElipses();
  
  popMatrix();
  

}

void dibujarElipses(){
  int a;
  float w;
  float posx, posy,posu,posv;

  
  for (int x=0; x< widthSmall; x++) {
    for (int y=0; y< heightSmall; y++) {
      a = y*widthSmall + x;

      posx = particles[a].position().x();
      posy = particles[a].position().y();
      posu = orgParticles[a].position().x();
      posv = orgParticles[a].position().y();


      //w = map(dist(posx, posy, mouseX, mouseY), 0, sqrt(width*width + height*height), MAX_ELLIPSE_W, MIN_ELLIPSE_W);
      w = map(dist(posx, posy, posu, posv), 0, sqrt(width*width + height*height), 3, 220);
      if (colors[a] != color(255)) {

        noFill();
        noStroke();
        fill(colors[a]);  // fill with the colour on this position from the image
        //fill(0);
        ellipseMode(CENTER);
        ellipse(posx, posy, w, w);
      }
      
    }
    
  }
}

void dibujarLineas(){
  float posx, posy, posu,posv;
  
   for (int i=0; i< particles.length; i++) {
      posx = particles[i].position().x();
      posy = particles[i].position().y();
       for (int j=0; j< numPixelsSmall; j++){
         posu = particles[j].position().x();
         posv = particles[j].position().y();
         float d = dist(posx, posy, posu, posv);

         
         if (d < NTHPIXEL*2 && colors[i] != color(255)){
         stroke(colors[i],150);
         //stroke(alfa);
         strokeWeight(0.4);
         line(posx, posy, posu, posv);
         }
       }
   }
  
}






