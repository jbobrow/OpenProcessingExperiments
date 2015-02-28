
//Andres Kõpper
//Processing class, IED Barcelona, Week 11
//17.02.2011

//It is a sketch based on http://openprocessing.org/visuals/?visualID=9088  created by Antonio Radovcic.
//But now with bigger particles which gives it sort of a retro look, which I like. I also changed quite a lot of parameters related to particle attraction.
// If any key is pressed the attraction starts. If the mouse is moved it also affects the flying pixels.


float r; 
float g;
float b;
float a;

float grav = 0;         //GLOBAL GRAVIty
float drag = 0.5;      //Kind of likeimage inward gravity (std 0.5)
float abstand = 5;    //Distance between pixels


//practical properties

float dicke = 1;              //SIZE 
float traegheit = 5;       //The stifness (std 5)
float PSchwer = 5000000;    //Attraction to original POSITION (std 1000000)
float PMinDist = 900;    //MINIMAL distance for attraction (std 300)


//Properties of the mouse

float MSchwer = 100000;        //Attraction to mouse (std 400/800)
float MMinDist = 40;       //MINIMUM DISTANCE OF THE ATTRACTION OF THE MOUSE (std 1)

String bildName = "london3.jpg";
float bg = 240;
float strokeCol = 255;


//Import Traer Physics for the particle system
import traer.physics.*;
ParticleSystem physics;


float[] pixelX = new float[0];
float[] pixelY = new float[0];

Particle[] flying;
Particle[] attracting;
Particle mouse;

//
PImage bild;
int zaehl;


void setup() {

  bild = loadImage(bildName);
noCursor();// Also added NOCURSOR for if later it is desired to capture screen then therese is no cursor.
  //standard processing setup
  size(bild.width, bild.height);
  background(#482E0C);
  stroke(#FF820D);//The color of the text
  strokeWeight(4); //The size of the text pixels
  noFill();
  smooth();
  physics = new ParticleSystem(grav,drag);

  physics.setIntegrator( ParticleSystem.MODIFIED_EULER ); 




  //Create the arrays for the pixels
  for(float i = 0; i < bild.width; i+=abstand) {

    for(float j = 0; j < bild.height; j+=abstand) {

      color c = bild.get(int(i),int(j));
      float r = red(c);

      if(r < 100) {

        pixelX = (float[]) append(pixelX, i);
        pixelY = (float[]) append(pixelY, j);

      }
    }
  }

  //---------------------------------------------------------








  //Particels make every black pixel to receive a assigned flying solid particles. 
  //Between these two theattraction (attraction) is generated, which ensures that the particle
// goes back to their original place do


  flying = new Particle[pixelX.length];
  attracting = new Particle[pixelX.length];
  mouse = physics.makeParticle();

  for(int i = 0; i < pixelX.length; i++) {


    flying[i] = physics.makeParticle(traegheit, pixelX[i], pixelY[i], 0);
    attracting[i] = physics.makeParticle(1,pixelX[i], pixelY[i],0);

    attracting[i].makeFixed();


    physics.makeAttraction(flying[i], attracting[i], PSchwer,PMinDist);

    //The mouse gets assigned to a particle, which attracts everyone else
    physics.makeAttraction(flying[i], mouse, MSchwer,MMinDist);
  }
  //
}



void draw() {


  mouse.position().set( 10000, 10000, 0 );



  if(keyPressed == true) {

    mouse.position().set( mouseX, mouseY, 0 );


  }



  physics.tick(1);
  
  r = random(2,10);
  g = random(15,16);
  b = random(3,14);
  a = random(0,3);

  background(r,g,b,a);  


  for(int i=0; i < pixelX.length; i++) {

    //How many times a pixel is at each particle location
    point(flying[i].position().x(), flying[i].position().y()); 


  }

}







