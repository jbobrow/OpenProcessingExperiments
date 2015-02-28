

class Dandelion {

  int xCenter, yCenter;
  int number;  // Number of floret
  ArrayList florets;
  float radio;    // Radius of the sphere
  float hairmin;  // Minimum hair length
  float hairmax;  // Maximum hair length
  boolean dead;
  float deadTime;
  Vec3D wind;

  Dandelion(int xCenter_, int yCenter_) {   //class constructor

    xCenter = xCenter_;
    yCenter = yCenter_;
    radio = 100;  // The central sphere is half the window height (radius therefore 1/4 window height)
    hairmin = radio * 0.2;  // Minimum hair length set proportionally to the sphere radius
    hairmax = radio * 0.4;  // Maximum hair length ser proportionally to the sphere radius
    dead = false;
    deadTime = -1;
    number = 1800; // how many floret being drawn

    wind = new Vec3D(0, 0, 0); 

    florets = new ArrayList(); // Initialise the array for the number of hairs
    createDandelion();

    noiseDetail(3); // florets (Adjusts the character and level of detail produced by the Perlin noise function)
  }

  void createDandelion() {

    for (int i=0; i<number; i++)  // For each hair...
    {
      florets.add (new Floret(hairmin, hairmax, radio, xCenter, yCenter));  // Create a new hair object and save it in the array
    }
  }

  void drawDandelion(boolean windy) {

    //DRAW SPHERE_______________________________________________________________________________________
    pushMatrix();
    translate(xCenter, yCenter);
    stroke(200);
    noStroke();
    fill(#F7FFFF);
    sphere(radio);  // Draw the sphere (to occlude hairs on the side away from the viewpoint)
    popMatrix();


    if (florets.size() == 0)
      dead = true;

    if (windy) {
      if (wind.magnitude() < 20) {
        wind.x += random(0.5);  // set direction of wind
        wind.y += random(0.5);
        wind.z += random(0.5);
      }
    } 
    else {
      if (wind.magnitude() > 0) {
        wind.scaleSelf(0.9);
      }
    }

    for (int i=0;i<florets.size();i++) {  // For each hair...
      Floret floret = (Floret)florets.get(i);

      if ((floret.base.x>width && floret.move.x>width) || (floret.base.y>height && floret.move.y>height) ||
        (floret.base.x<0 && floret.move.x<0) || (floret.base.y<0 && floret.move.y<0)) { // delete florets out of screen
        florets.remove(i);
        i--;
        continue; //return to for
      }

      Vec3D floretDirection = new Vec3D(floret.move.x-floret.base.x, floret.move.y-floret.base.y, floret.move.z-floret.base.z);
      //realese florets easy near the wind source
      float angle;
      if (florets.size()>number/2)
        angle = wind.angleBetween(floretDirection, true)/PI;
      else
        angle = 1;

      if (windy)
        if (random(0, 1)>0.9 && random(0, 1)<angle*angle && !floret.flying) {
          floret.flying = true;
        }

      floret.dibujar(wind);  // Calculate and draw the hair

      if (floret.currenthairlength<floret.hairlength) //florets growing
        floret.currenthairlength += floret.step;
    }
  }
}


