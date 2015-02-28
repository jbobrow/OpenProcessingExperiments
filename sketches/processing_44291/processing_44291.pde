
  /* 
   Model Experiments
   Generative Drawing Machine based on  physics 
   
   Natalia Monroy-Lopez
   Master of Digital Design
   University of Canberra
   
   */
  
  import traer.physics.*;   // Traer physics library 
  
  ParticleSystem physics; // he physics system
  Particle p;             // The particles within the system
  Particle q;
  Particle r;
  Particle s;
  Particle attractor, attractor_2, attractor_3 ;   // The particles in the system that will act as magnets
  //  Attraction a;
  Spring spring;           // The system's springs 
  
  float strength = 1;         // the value for the springs' strenght 
  float dam = 0.8;            //the value for the springs' damping 
  float len =100;             //the value for the springs' length 
  float attraction = 500;     //the value for the attraction between particles
  
  
  void setup() {               
    size(1280,720);           // size of screen
    smooth();                //smooth drawing
    background(255);              // background colour set to white
  //  strokeWeight(1);              // the thickness of the stroke set to 1 px
  
    physics = new ParticleSystem(1, 0.01  );                // making a new particle system and setting its gravity(which is in the Y axis) and its drag
    physics.setGravity(0.05);
    attractors();                // calling the particles that function as magnets
  }
  
  
  void draw() {
    physics.tick(); // run the simulation as stated by the library 
  
    int spr =  physics.numberOfSprings(); // number of springs in the system
    for (int s=0; s < spr; s++) {          // a for loop to generate multiple springs
      Spring S = physics.getSpring(s);     //  Spring S is equal to the amount of springs generated by the loop
      Particle p1 = S.getOneEnd();         // p1 is the particle that is at one end of the spring
      Particle p2 = S.getTheOtherEnd();    // p2 is the particle that is at the other end of the spring
      //  stroke(random(100*s),random(100),50,20);
      stroke(random(100*s), random(20*s, 50), random(0, 100*s), random(0,50));    //random stroke colour
      line(p1.position().x(),p1.position().y(),p2.position().x(),p2.position().y());  // a line drawn from p1 to p2
    }
  
    int part = physics.numberOfParticles();   // number of particles in the system
  
    for (int p=0; p < part; p++) {             // a for loop to generate multiple particles
      Particle P = physics.getParticle(p);      // get the particles out
      //  ellipse(P.position().x(),P.position().y(),10,10);
      if ( P.position().x() > width ||  P.position().x()<0 ||P.position().y() > height || P.position().y() < 0) { // bounce off the bottom, top and sides using  OR
        P.position().set( P.position().x(), height, 0);    // if the above statement is true sets the positions of the particles 
        P.velocity().set( P.velocity().x()*-1, P.velocity().y()*-1,0  );  // if the above statement is true sets the velocity of the particles 
    }
    }
  }
  
  void mousePressed() {     // when mouse is pressed it runs the following 
    len = random(50,200);    // sets a random lenght for the springs
    makeBox();              //calls makeBox
  }
  
  void keyPressed() {    //when a key is it runs the following 
    if (key == 'c') {   // if that key is c
      physics.clear();   // clear the runninng particles
    }
  }
  
  void attractors () {              // the attractor particles, the particles are drawn with same mass but at different positions in the x axis
    attractor = physics.makeParticle(20,200,height/2,0);   
    attractor_2 = physics.makeParticle(20,600,height/2,0);
    attractor_3 = physics.makeParticle(20,1000,height/2,0);
    attractor.makeFixed();                // particles are made fixed so the forces of the system does not work over them
    attractor_2.makeFixed();
    attractor_3.makeFixed();
  }    
  
  void makeBox() {                      //makes a box by drawing the 4 different particles and springs 
    p = physics.makeParticle( 1.0, random(width), mouseY, 0 );  // draws particle p with mass, x, y, z. The following lines do the same for the different particles
    q = physics.makeParticle( 1.0, random(width), mouseY, 0 ); 
    r = physics.makeParticle( 1.0, random(width), mouseY,  0); 
    s = physics.makeParticle( 1.0, random(width), mouseY, 0 );
  
  
  
    physics.makeAttraction( attractor, p, attraction, 20 );    // makes attraction between the attractor particle and particle p with the attraction value stateted above.  This happens at a minimum dist. of 20
    physics.makeAttraction( attractor, q, attraction, 20 );    //The following lines do the same for the different particles
    physics.makeAttraction( attractor, r, attraction, 20 );
    physics.makeAttraction( attractor, s, attraction, 20 );
  
    physics.makeAttraction(  attractor_2, p, attraction, 20 ); //The following lines do the same for the different particles and attractor particle 2
    physics.makeAttraction(  attractor_2, q, attraction, 20 );
    physics.makeAttraction(  attractor_2, r, attraction, 20 );
    physics.makeAttraction(  attractor_2, s, attraction, 20 );
  
    physics.makeAttraction(  attractor_3, p, attraction, 20 );  //The following lines do the same for the different particles and attractor particle 3
    physics.makeAttraction(  attractor_3, q, attraction, 20 );
    physics.makeAttraction(  attractor_3, r, attraction, 20 );
    physics.makeAttraction(  attractor_3, s, attraction, 20 );
  
    // Spring makeSpring( Particle a, Particle b, float strength, float damping, float restLength );
    spring = physics.makeSpring(p,q, strength, dam,len);   // makes the spring between the two particles with the above stated values for strength, damping and lenght
    spring = physics.makeSpring(q,r, strength, dam,len);
    spring = physics.makeSpring(r,p, strength, dam,len);
    spring = physics.makeSpring(q,s, strength, dam,len);
    spring = physics.makeSpring(s,r, strength, dam,len);
    spring = physics.makeSpring(s,p, strength, dam,len);
  }

