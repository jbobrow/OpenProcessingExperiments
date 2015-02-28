
class Entity {
  
  PVector location;
  PVector velocity;
  PVector acceleration;

  float size;
  color shade;
  color strocke;

  float mass;
  float restitution;
  
  float maxSpeed;
  float maxForce;
  
  float senseRange;
  
  boolean gender;
  
  float tailSwipe;
  float woff;
  
  int fullLife;
  int lifeSpan;
  
  Entity( PVector location, float size, color shade, color strocke, float mass, float restitution, float maxSpeed, float maxForce, float senseRange, boolean gender, int lifeSpan, int xBound, int yBound ) {
    this.location = location.get();
    this.size = size;
    this.shade = shade;
    this.strocke = strocke;
    this.mass = mass;
    this.restitution = restitution;
    this.maxSpeed = maxSpeed;
    this.maxForce = maxForce;
    this.senseRange = senseRange;
    this.gender = gender;
    this.lifeSpan = lifeSpan;
    this.fullLife = lifeSpan;
    
    velocity = new PVector();
    acceleration = new PVector();
    
    tailSwipe = 0;
    woff = random( 100000 );
  }
  
  void applyForce( PVector force ) {
    acceleration.add( force ); 
  }
  
  void flock( ArrayList<Entity> alEnt, float afLimit ) {
    PVector toFlock = new PVector();
    int avgCount = 0;
    for( Entity ent: alEnt ) {
      if( PVector.dist( ent.location, location ) < size * 7 ) {
        toFlock.add( ent.location );
        avgCount ++;
      }  
    }
    
    toFlock.div( avgCount );
    steer( toFlock );
    //fill( 255 );
    //ellipse( toFlock.x, toFlock.y, 10, 10 );
  }
  
  void update() {
    velocity.add( acceleration );
    location.add( velocity );
    edgeCheck();
    
    acceleration.mult( 0 );  
  }
  
  void dieOff() {
    lifeSpan--;  
  }
  
  boolean isDead() {
    if( lifeSpan > 0 ) return false;
    else return true;  
  }
  
  void steer( PVector target ) {
    PVector desired = PVector.sub( target, location );
    float desMag = desired.mag();
    desired.normalize();
    
    if( desMag < size * 3 ) {
      float limiter = map( desMag, 0, size*3, 0, maxSpeed );
      desired.mult( limiter );   
    }
    else {
      desired.mult( maxSpeed );  
    }
    
    PVector steeringForce = PVector.sub( desired, velocity );
    steeringForce.limit(maxForce);
    applyForce( steeringForce );
      
  }
  
  void edgeCheck() {    
    /*if( location.x > width ) location.x = 0;
    if( location.x < 0 ) location.x = width;
    if( location.y > height ) location.y = 0;
    if( location.y < 0 ) location.y = height;*/
    
    
    if ( location.x + size/2 > xBound) {
      location.x = xBound - size/2;
      velocity.mult( -( 1 - restitution) );
    }
    if ( location.y + size/2 > yBound) {
      location.y = yBound - size/2;
      velocity.mult( -( 1 - restitution) );
    }
    if( location.x - size/2 < 0 ) {
      location.x = 0 + size/2;
      velocity.mult( -( 1 - restitution) );
    }
    if( location.y - size/2 < 0 ) {
      location.y = 0 + size/2;
      velocity.mult( -( 1 - restitution) );
    }
  }
  
  void separate( ArrayList<Entity> alEnt, float afLimit ) {
    int count = 0;
    PVector away = new PVector( );
    for( Entity ent: alEnt ) {
      if( PVector.dist( location, ent.location ) > 0 && PVector.dist( location, ent.location ) < size*4.1 ) {
        PVector awayForce = PVector.sub( location, ent.location );
        awayForce.normalize();
        away.add( awayForce );
        count ++ ;
      }
    }
    
    if( count > 0 ) {
      away.div( count );  
      away.setMag( maxSpeed );
      PVector steerF = PVector.sub( away, velocity );
      steerF.limit( afLimit );
      
      applyForce( steerF );
    }
  }
  
  void display() {
    pushMatrix();
      translate( location.x, location.y );
      rotate( velocity.heading() + PI/2 );
      
      fill( shade );
      color forStroke = 255;
      
      if( isHungry() ) {
        forStroke = color( 0, 0, 255 );  
      }
      if( isAboutToDie() ) {
        forStroke = color( 255, 0, 0 ); 
      }
      
      tail( new PVector( 0, 0 ), size * 0.5, PI/4, forStroke );
      
      if( gender ) {
        strokeWeight( 4 );
        line( 0, 0, 0, -size * 0.7 );
      }
      stroke( 255 );
      strokeWeight( 1 );
      ellipse( 0, 0, size*0.8, size );
      
      
    popMatrix();
  }
  
  boolean isHungry() {
    if( lifeSpan < fullLife/2 ) {
      return true; 
    }
 
    return false;    
  }
  
  boolean isAboutToDie() {
    if( lifeSpan < fullLife/5 ) {
      return true; 
    }
 
    return false;
  }
  
  void fed() {
    lifeSpan = fullLife;  
  }
  
  void displayRange() {
    noStroke();
    fill( 200, 50 );
    pushMatrix();
      translate( location.x, location.y );
      ellipse( 0, 0, senseRange * 2, senseRange *2 );
    popMatrix();  
  }
  
  void wander( float wanFixed, float wanRad, float wanRange ) {
    PVector wanderCircle = new PVector( location.x, location.y );
    
    PVector addWander = velocity.get();
    addWander.normalize();
    addWander.mult( wanFixed );
    
    wanderCircle.add( addWander );
    
    float ranDeg = map( noise(woff), 0, 1, -PI/2, PI/2 );
    woff += 0.03;
    
    float wanX = ( cos( ranDeg ) * wanRad ) + wanderCircle.x;
    float wanY = ( sin( ranDeg ) * wanRad ) + wanderCircle.y; 
    
    fill( 0, 255, 0, 20 );
    //ellipse( wanderCircle.x, wanderCircle.y, wanRad * 2, wanRad * 2 );
    fill( 255 );
    //ellipse( wanX, wanY, 2, 2 );
    //line( wanX, wanY, wanderCircle.x, wanderCircle.y );
    steer( new PVector( wanX, wanY ) );
        
  }

  void tail( PVector location, float len, float deg, color forStroke) {
    float vMag = velocity.mag();
    
    float firstC = sin( tailSwipe ) * vMag * 1 ;
    float secondC = sin( tailSwipe + PI ) *vMag * 0.5;
    tailSwipe += 0.5;
    pushMatrix();
      translate( location.x, location.y );
      stroke( forStroke );
      
      strokeWeight( 3 );
      line( 0, 0, firstC, size );
      
      translate( 0, size );
      strokeWeight( 2 );
      line( firstC, 0, secondC, size/2 );
      
      translate( 0, size/2 );
      strokeWeight( 1 );
      line( secondC, 0, firstC, size/2 );
    popMatrix();  
  }  
}

