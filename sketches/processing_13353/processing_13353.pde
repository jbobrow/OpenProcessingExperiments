

Particle[] particle ;
int NUMPARTICLES = 1000 ;
Wind wind ;

void setup() {
  frameRate(30) ;
  background( 0 ) ;
  size( 1000, 500 ) ;
  particle = new Particle[NUMPARTICLES] ;
  for ( int i = 0 ; i < NUMPARTICLES; i++) {
    particle[i] = new Particle(int(random(0,width)), int(random(0,height)), new PVector(0.0,0.0), color(random(0,255),0,min(random(0,500),255)));
  }
  wind = new Wind() ;
  
  cursor(CROSS) ;
  
  smooth() ;
}

void draw() {
  fade( color(0), 20 ) ;
  for ( int i = 0 ; i < NUMPARTICLES ; i++ ) {
    particle[i].render() ;
    particle[i].addToVector(wind.windAtLocation(particle[i].x(),particle[i].y(),frameCount)) ;
    particle[i].updateLocation() ;
   // particle[i].steerToTarget(new PVector(mouseX, mouseY)) ;
  }  
  filter(DILATE) ;
}

// Fades the screen towards colour fadeColour, with opacity fadeLevel
void fade( color fadeColor , int fadeLevel ) {
  noStroke(); fill(fadeColor, fadeLevel) ;
  rect(0,0, width,height) ;
}




// ==================== PARTICLE CLASS =======================
 
class Particle {

  int MAXVELOCITY = 5 ; 
  
  PVector location ;
  PVector vector ; 
  color particleColor ;
  
 // Creates an particle at location (x,y), with vector v and color c
  Particle(int x, int y, PVector v, color c) {
    location = new PVector(x,y) ;
    vector = v ;
    particleColor =  c ; 
  }
  
  void addToVector(PVector vectorToAdd) {
    vector.add(vectorToAdd) ;
    //NOTE - PLAYING AROUND WEIRD WAYS WITH SPEED ACCORDING TO COLOUR
    vector.limit(MAXVELOCITY*(1.5+red(particleColor)/255.0-blue(particleColor)/255.0)) ;
//    vector.limit(MAXVELOCITY) ;
  }
  
  void updateLocation() {
    location.add( vector ) ;
    location.x = ( location.x + width ) % width ;
    location.y = ( location.y + height ) % height ;
  }
  
  void steerToTarget(PVector target) {
    vector.limit(PVector.dist(target,location)) ;
    
    PVector targetVector = PVector.sub(target, location) ;
    targetVector.limit(0.2) ;
    addToVector( targetVector ) ;
  }
  
  void render() {
    stroke ( particleColor ) ;
    strokeWeight(0.2) ;
    if(location.x<width/2+10){
      line ( location.x,location.y, location.x+vector.x,location.y+vector.y ) ;
      line ( (width-location.x),location.y, (width-(location.x+vector.x)),location.y+vector.y ) ;
    }
  }
  
  int x() {
    return int(location.x) ;
  }
  
  int y() {
    return int(location.y) ;
  }
}



// ==================== WIND CLASS =======================

class Wind {
  int horizontalSeed ;
  int verticalSeed ;
  float SCALE = 0.002 ;
  PVector directionalWind = new PVector(0,0) ;

  Wind() {
    horizontalSeed = int(random(0,10000)) ;
    verticalSeed = int(random(0,10000)) ;
  }
  
  PVector windAtLocation(int x, int y, int time) {
    PVector returnWind ;
    returnWind = new PVector( noise(x*SCALE, y*SCALE, (horizontalSeed + time)*SCALE) - 0.5,
                        noise(x*SCALE, y*SCALE, (verticalSeed + time)*SCALE) - 0.5) ;
    returnWind.add(directionalWind) ;
    return returnWind ; 
  }
  
}

