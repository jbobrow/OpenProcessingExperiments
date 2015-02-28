
Particle[] particle ;
int NUMPARTICLES = 484 ; // Must be a square number

void setup() {
  frameRate(50) ;
  background( 0 ) ;
  size( 600, 600 ) ;
  particle = new Particle[NUMPARTICLES] ;
  mouseX = width/2 ;
  mouseY = height/2 ;
  createParticlesEvenSpread( mouseX, mouseY ) ;
  cursor(CROSS) ;
  smooth() ;
}

void keyPressed() {
  if ( key == 'a' ) {
    createParticlesRandomSpread(mouseX,mouseY) ;
  } else if ( key == 's') {
    createParticlesEvenSpread(mouseX, mouseY) ;
  } if ( key == 'x' ) {
    smooth() ;
  } if ( key == 'z' ) {
    noSmooth() ;
  }
}

void draw() {
  fade(color(0), 10) ;
  for ( int i = 0 ; i < NUMPARTICLES ; i++ ) {
    particle[i].steerToTarget(new PVector(mouseX, mouseY)) ;
    particle[i].render() ;
    particle[i].updateLocation() ;
  }  
}

void createParticlesRandomSpread(int x, int y) {
  for ( int i = 0 ; i < NUMPARTICLES ; i++ ) {
    particle[i] = new Particle(x, y, new PVector(0,0),
                          color(0, random(0,255),random(0,255))) ;
    }
}

void createParticlesEvenSpread(int x, int y) {
  int numGradients = int(sqrt(NUMPARTICLES)) ;
  for ( int blueCount = 0 ; blueCount < numGradients ; blueCount++ )
    for (int greenCount = 0 ; greenCount < numGradients ; greenCount++ ) {
      particle[greenCount + blueCount * numGradients] = new Particle(x, y, new PVector(0,0),
                          color(0, greenCount * (255/numGradients) , blueCount * (255/numGradients))) ;
    }
}

// Fades the screen towards colour fadeColour, with opacity fadeLevel
void fade( color fadeColor , int fadeLevel ) {
  noStroke(); fill(fadeColor, fadeLevel) ;
  rect(0,0, width,height) ;
}




// ==================== PARTICLE CLASS =======================
 
class Particle {

  int MAXVELOCITY = 12 ; 
  
  PVector location ;
  PVector vector ; 
  color particleColor ;
  
 // Creates an particle at location (x,y), with vector v and color c
  Particle(int x, int y, PVector v, color c) {
    location = new PVector(x,y) ;
    vector = v ;
    particleColor =  c ; 
  }
   
  void updateLocation() {
    location.add(vector) ;
  }
   
  void steerToTarget(PVector target) {
    vector.limit(MAXVELOCITY) ;
    PVector targetVector = PVector.sub(target, location) ;
    targetVector.limit( (255 - 0.5*green(particleColor) + 1.5*blue(particleColor))/255) ;
    vector.add( targetVector ) ;
  }
  
  void render() {
    stroke ( particleColor ) ;
    line ( location.x,location.y, location.x+vector.x,location.y+vector.y ) ;
  }
 
}


