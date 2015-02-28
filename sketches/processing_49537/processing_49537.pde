
Particle [] pickles = new Particle [0];  


void setup() {
  size (500, 500);
  smooth ();
  noStroke ();

  // for(int i=0; i<pickles.length; i++) {
  //   pickles [i] = new Particle ();

  //}
}

void draw() {

  //clear the backgorund
  background (150, 170, 20);

  //adding a new particle into the array
  pickles = (Particle[])append(pickles, new Particle());

  //draw all the particles

  for (int i=0; i<pickles.length; i++) {

    pickles[i].update ();
  }
  //check to see if I have more than 10 particles and if so...

  if (pickles.length>10) {
    pickles = (Particle[])append(pickles, new Particle());
  }
}

class Particle {

  //position properties for our particle
  float x;
  float y;

  //velocity is the change in position every frame
  float velX;
  float velY;
  
  float drag;
  
  //color of the particle
  color c;
  

  float particleSize;
  
  float shrink;
  
  float gravity;

  //constructor: this is a special that is 
  //called whenever a Particle is instantiated.
  Particle () {


    // set the x and the y position to be the middle of the screen.
    x = width/2;
    y = height/2;


    // set the velocity to be a random number between 
    // -10 and 10 in both x and y directions.
    velX = random (-10, 10);
    velY = random (-10, 10);


    drag = 0.96;
    
    c = color(0,random (0,255), random (100, 255));
    particleSize = random (10, 50);
    
    
    //size
    
    shrink = 0.95;
    
    gravity = 0.5;
  }

  void update () {

    //velX = *0.9

    //short version

    velX*=drag;
    velY*=drag;

    //add gravity
    velY+= gravity;

    //add the velocity to the position 
    x+= velX;
    y+= velY; 
   
   //se dividi cambia la dimensione 
    particleSize *= shrink;
    
    




    //set the fill colour and draw the particle
    fill (c);
    ellipse (x, y-100, particleSize, particleSize);
  }
}


                
                                
