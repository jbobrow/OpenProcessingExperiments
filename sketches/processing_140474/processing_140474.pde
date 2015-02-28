
Floater[] floaters = new Floater[100];
float GRAV, DRAGG, G, MOUSE_ATTR;
boolean show = true;
//float roff, goff, boff;
void setup() {
  size( 700, 500 );
  smooth();
  background( 0);
   
  //roff = 0.0;
  //goff = 1000.0;
  //boff = 1000000.0;
  for( int i = 0; i < floaters.length; i++ ) {
    floaters[i] = new Floater( new PVector( random( 100, width ), random( 100, height )), random( 1, 5 ), random( 7, 8 ), color( random( 100, 255 ), random( 100, 255 ), random( 100, 255 ) ) ); 
  }
   
  GRAV = 0.1;
  DRAGG = 0.77;
  MOUSE_ATTR = 0.0;
}
void draw() {
  //background( 0 );
  //fill( 255, 1 );
  //rect( 0, 0, width, height );
   
  //noStroke();
  //fill( noise(roff) * 255, noise(goff) * 255, noise(boff) * 255 );
  //xoff += 0.01; goff += 0.01; boff += 0.01;
  fill( random(255), random(255), random(255) );
  beginShape();
  for( int i = 0; i < floaters.length; i++ ) {
    //floaters[i].applyForce( new PVector( 0.01, 0 ) );
    //floaters[i].applyForce( new PVector( 0, GRAV * floaters[i].mass ) );
     
    PVector drag = floaters[i].velocity.get();
    drag.normalize();
    drag.mult( -DRAGG );
    floaters[i].applyForce( drag );
     
    PVector toMouse = PVector.sub( new PVector( mouseX, mouseY ), floaters[i].location );
    toMouse.normalize();
    toMouse.mult( -MOUSE_ATTR );
    floaters[i].applyForce( toMouse );
  
    for( int j = 0; j < floaters.length; j++ ) {
      if( i != j ) {
        PVector f = floaters[j].attractionForce( floaters[i] );
        f.mult( 1 );
        floaters[i].applyForce( f );
      } 
    }
    floaters[i].update();
    floaters[i].checkEdges();
     if( show ) {
        vertex( floaters[i].location.x, floaters[i].location.y );
        //bezierVertex( floaters[i].location.x, floaters[i].location.y );
        //floaters[i].render();
     }
  } 
  endShape( CLOSE );
}
void mouseClicked() {
  for( int i = 0; i < floaters.length; i++ ) {
    PVector mouse = new PVector( mouseX, mouseY );
    PVector force = PVector.sub( floaters[i].location, mouse );
    force.normalize();
    force.mult(7);
    floaters[i].applyForce( force );
  }
  //attr[ attrMover ] = new Attractor( new PVector( mouseX, mouseY ), 70, 1 );
  //attrMover++;
}
class Floater {
  PVector location, velocity, acceleration;
  float mass, radius;
  color col;
  
  Floater( PVector location, float mass, float radius, color col ) {
    this.location = location.get();
    this.mass = mass;
    this.radius = radius;
    this.col = col;
    
    velocity = new PVector( 0, 0 );
    acceleration = new PVector( 0, 0 );
  }
   
  PVector attractionForce( Floater floater ) {
    PVector distVector = PVector.sub( location, floater.location );
    float distance = distVector.mag();
    distance = constrain( distance, 5, 25 );
     
    distVector.normalize();
    float strength = ( 1 * mass * floater.mass ) / (distance * distance );
    distVector.mult( strength );
     
    return distVector;
  }
   
  void applyForce(PVector force) {
    acceleration.add( force ); 
  }
   
  void update() {
    velocity.add( acceleration );
    location.add( velocity );
   
    acceleration.mult( 0 ); 
  }
   
  void render() {
    noStroke();
    fill( col );
    ellipse( location.x, location.y, radius * 2, radius * 2 ); 
  }
  
 void checkEdges() {
    if (location.x > width - radius ) {
      location.x = width - radius;
      velocity.x *= -1;
    } else if (location.x < radius) {
      velocity.x *= -1;
      location.x = radius;
    }
  
    if (location.y > height - radius ) {
      location.y = height - radius;
      velocity.y *= -1;
    } else if (location.y < radius) {
      velocity.y *= -1;
      location.y = radius;
    }
  }
}

void keyPressed() {
  if( key == 'r' || key == 'R' ) {
    saveFrame("####KBAL.png");
  }  
  if( key == 's' || key == 'S' ) {
    if( show ) show = false;
    else show = true;
  }
}
 code
 tweaks (0)
about this sketch
733  views November 9, 2013
collection: KrazyAlgorithmCollection
This sketch is running in HTML5 using Processingjs.

how to attribute?
license
   



why?
advertisement

 
 Shaun


JaggedColors
