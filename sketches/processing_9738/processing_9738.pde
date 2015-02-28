
import traer.physics.*;
ParticleSystem physics;
Particle[][] particles;
boolean recording;
int i;
int j;
float x;
float y;
float angle;
float irisRadius = 345;
float pupilFraction = 0.2;
float pupilRadius =  irisRadius*pupilFraction;
float r;
int numFibres = 125;
int numCircles = int(125*(1-pupilFraction)); // fewer circles if the pupil is bigger
float [] storedradius = new float[numCircles];
float SPRING_STRENGTH = 0.4;
float SPRING_DAMPING = 0.1;
float maxstretch;
int springnumber; int springnumber2; int springnumber3; 
int springnumber4; int springnumber5; int springnumber6; int springnumber7;
boolean removeSprings=true;
int initialNumSprings;

void setup(){
  size(700,700);
  translate(width/2, height/2);
  physics = new ParticleSystem(0.0, 0.1);
  particles = new Particle[numCircles][numFibres]; 
  initialNumSprings = physics.numberOfSprings();
  println(initialNumSprings);
  smooth();
  for (i=0; i<numCircles; i++){
    r = pupilRadius + i*(irisRadius - pupilRadius)/numCircles;
    storedradius[i]=r;
    println(storedradius[i]);
    for (j=0; j<numFibres; j++) {
      angle = j*TWO_PI/numFibres;
      x = cos(angle) * r;
      y = sin(angle) * r;
      particles[i][j] = physics.makeParticle(0.2, x, y, 0.0);
    }
  }
  // make radial springs
  for (i=1; i<numCircles; i++){
    for (j=0; j<numFibres; j++) {
      physics.makeSpring(particles[i - 1][j], particles[i][j], 
      SPRING_STRENGTH, 
      SPRING_DAMPING, 
      (irisRadius - pupilRadius)/numCircles); // outer springs longer
    }
  }   
  // make concentric springs
  for (i=0; i<numCircles; i++){
    for (j=1; j<numFibres; j++) {
      physics.makeSpring(particles[i][j-1], particles[i][j], 
      random(0.01,0.1)*SPRING_STRENGTH, 
      SPRING_DAMPING, 
      random(0.2,0.4)*TWO_PI*storedradius[i]/numFibres*(0.8+0.2*(1-sin(PI*i/numCircles))));
      }
  }     
        // stich up last set concentric springs
  for (i=0; i<numCircles; i++){
      physics.makeSpring(particles[i][numFibres-1], particles[i][0], 
      random(0.01,0.1)*SPRING_STRENGTH, 
      SPRING_DAMPING, 
      random(0.2,0.4)*TWO_PI*storedradius[i]/numFibres*(0.8+0.2*(1-sin(PI*i/numCircles))));
      }
      
  
  for (j=0; j<numFibres; j++) {
    particles[0][j].makeFixed();
    }
   for (j=0; j<numFibres; j++) {
    particles[numCircles-1][j].makeFixed();
    }
}

void draw() {
  translate(width/2, height/2);
  background(0);
  physics.tick(0.8); 
  makeFibreLines();
  if (removeSprings==true){
    removeSprings();
  }
}

void makeFibreLines(){
  strokeWeight(1);
  stroke(255);
  for (i=1; i<numCircles; i++){ // Go through the circles
    for (j=0; j<numFibres; j++) { // Go through the radiating particles
     line( // draw lines between all the radiating points
       particles[i][j].position().x(), 
       particles[i][j].position().y(),
       particles[i-1][j].position().x(), 
       particles[i-1][j].position().y());
    }
  }
  for (j=1; j<numFibres; j++) { // Go through the radiating points
       line( // draw a line from each outer point to the point next to it
         particles[numCircles-1][j].position().x(), 
         particles[numCircles-1][j].position().y(),
         particles[numCircles-1][j-1].position().x(), 
         particles[numCircles-1][j-1].position().y());         
       line( // draw a line from each inner point to the point next to it
         particles[0][j].position().x(), 
         particles[0][j].position().y(),
         particles[0][j-1].position().x(), 
         particles[0][j-1].position().y());
  }
   // For the first (outermost) radiating point 
   line( // connect the first and last points on the outer circle
     particles[numCircles-1][0].position().x(), 
     particles[numCircles-1][0].position().y(),
     particles[numCircles-1][numFibres-1].position().x(), 
     particles[numCircles-1][numFibres-1].position().y());          
   line( // connect the first and last points on the inner circle
     particles[0][numFibres-1].position().x(), 
     particles[0][numFibres-1].position().y(),
     particles[0][0].position().x(), 
     particles[0][0].position().y());    
}

void removeSprings() { // function to create circular voids
  maxstretch=0.0;
    if (physics.numberOfSprings() > (0.9*initialNumSprings)) { 
    // If most of the original springs still exist
    for (i=0; i<physics.numberOfSprings(); i++) {
      Spring S = physics.getSpring(i);
      if (S.currentLength()/S.restLength()>maxstretch) {
   //     springnumber7=springnumber6;
     //   springnumber6=springnumber5;
        springnumber5=springnumber4;
        springnumber4=springnumber3;
        springnumber3=springnumber2; // pass 2's value to 3
        springnumber2=springnumber; // pass the highest value to 2
        springnumber=i; 
        maxstretch=S.currentLength()/S.restLength();
        // make that most-stretched one 'springnumber'
      }
    }
    
    physics.removeSpring(springnumber); // remove that spring
    physics.removeSpring(springnumber2); 
    physics.removeSpring(springnumber3);
    physics.removeSpring(springnumber4);
    physics.removeSpring(springnumber5); 
 //   physics.removeSpring(springnumber6); 
 //   physics.removeSpring(springnumber7); 
  }
  else {
    return; 
  } // otherwise, stop removing springs
}

void keyPressed() {
     if (keyCode == UP) {
      removeSprings=true;
    }
    if (keyCode == DOWN) {
      removeSprings=false;
    }
}

