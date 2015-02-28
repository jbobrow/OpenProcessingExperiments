
/*
 * GravSim - v2
 *
 * by Simon Kenny
 *
 * A simple but quite beautiful experiment in particle gravity in 2D
 *
 * Click to add a particle. Click and drag to add a particle with a velocity
 * vector in the direction of your drag and with speed proportional to the
 * length of the drag.
 *
 * Other options can be toggled with the keyboard, see the bottom of the
 * screen while running the program. In particular, the up and down keys
 * change the current mass setting for spawning particles.
 *
 * Enjoy!
 * digithree@gmail.com
 */

int numMassValues = 6;
float massValue[] = { 0.1, 0.5, 1.0, 2.5, 4.0, 7.0 };
int curMassValue = 0;

float VISUAL_MASS_MULTIPLIER = 20.f;

boolean dragging = false;
PVector dragStart;

ArrayList<Particle> particles = new ArrayList<Particle>();
Particle planet = null;

boolean vectorLinesOn = false;
boolean paintMode = true;

boolean centrePlanet = false;
boolean hideCentrePlanet = false;

boolean collisionsOn = false;
boolean collideWithEdgeOn = false;

float fadeWaitTime = 1.f;
float fadeWaitCur = fadeWaitTime;

float lastTime;
void setup() {
  size( 800, 800 );
  ellipseMode( CENTER );
  textMode( LEFT );
  //smooth();
  lastTime = millis()/1000.f;
  
  
  // add center gravity
  if( centrePlanet ) {
    planet = new Particle( new PVector(width/2,height/2), 2 );
    planet.unmoveable = true;
  }
  
  background(255);
}

void draw() {
  float curTime = millis()/1000.f;
  float elapsedTime = curTime - lastTime;
  
  if( !paintMode ) {
    background(255);
  } else {
    fadeWaitCur -= elapsedTime;
    if( fadeWaitCur <= 0.f) {
      fadeWaitCur = fadeWaitTime;
      fill(255,10);
      rect(0,0,width,height);
      println( "num particles: "+particles.size() );
    }
  }
  
  if( dragging && !paintMode ) {
    pushStyle();
    stroke(0,0,255);
    line( dragStart.x, dragStart.y, mouseX, mouseY );
    popStyle();
  }

  if( planet != null ) {
    if( planet.draw(elapsedTime,hideCentrePlanet) ) {
      planet = null;
    }
  }
  for( int i = particles.size()-1 ; i >= 0 ; i-- ) {
    Particle p = particles.get(i);
    if( p.draw( elapsedTime, false ) ) {
      particles.remove(i);
    }
    if( planet != null ) {
      p.applyGravity( planet, elapsedTime );
    }
    for( int j = 0 ; j < particles.size() ; j++ ) {
      if( i != j ) {
        p.applyGravity( particles.get(j), elapsedTime );
      }
    }
  }

  if( collisionsOn ) {
    for( int i = 0 ; i < particles.size() ; i++ ) {
      Particle p = particles.get(i);
      for( int j = 0 ; j < particles.size() ; j++ ) {
        if( i != j ) {
          if( !p.destroy ) {
            p.checkCollision( particles.get(j) );
          } else {
            break;
          }
        }
      }
      if( !p.destroy && planet != null ) {
        p.checkCollision( planet );
      }
    }
      
    for( int i = particles.size()-1 ; i >= 0 ; i-- ) {
      if( particles.get(i).destroy ) {
        particles.remove(i);
      }
    }
    if( planet != null ) {
      if( planet.destroy ) {
        planet = null;
      }
    }
  }
  
  /*
  pushStyle();
  fill(0);
  text( "Mass "+(curMassValue+1)+" : "+massValue[curMassValue], 100, 50 );
  popStyle();
  */
  
  // menu
  pushStyle();
  stroke(0);
  strokeWeight(1);
  fill(255, 255, 180);
  rect(0,height-30,width-1,29);
  // text
  fill(0);
  String paint, vectors, cplanet, hide, collisions, collisionsEdge;
  if( paintMode ) {
    paint = "ON";
  } else {
    paint = "OFF";
  }
  if( vectorLinesOn ) {
    vectors = "ON";
  } else {
    vectors = "OFF";
  }
  if( centrePlanet ) {
    cplanet = "ON";
  } else {
    cplanet = "OFF";
  }
  if( hideCentrePlanet ) {
    hide = "ON";
  } else {
    hide = "OFF";
  }
  if( collisionsOn ) {
    collisions = "ON";
  } else {
    collisions = "OFF";
  }
  if( collideWithEdgeOn ) {
    collisionsEdge = "ON";
  } else {
    collisionsEdge = "OFF";
  }
  text( "(P)aint: "+paint+",   (V)ectors: "+vectors+",   (M)iddle Planet: "+cplanet+",   (H)ide Planet: "+hide+",   (C)ollisions: "+collisions+",   (E)dge collisions: "+collisionsEdge+" -- Mass(up/down): "+massValue[curMassValue] , 5, height - 15 );
  popStyle();
  
  lastTime = curTime;
}

void keyPressed() {
  if( keyCode == UP ) {
    curMassValue++;
    if( curMassValue >= numMassValues ) {
      curMassValue = 0;
    }
  } else if( keyCode == DOWN ) {
    curMassValue--;
    if( curMassValue < 0 ) {
      curMassValue = numMassValues-1;
    }
  } else if( key == 'v' || key == 'V' ) {
    vectorLinesOn = !vectorLinesOn;
  } else if( key == 'p' || key == 'P' ) {
    paintMode = !paintMode;
    if( paintMode ) {
      background(255);
    }
  } else if( key == 'm' || key == 'M' ) {
    centrePlanet = !centrePlanet;
    // do planet create/destroy
    if( centrePlanet ) {
      planet = new Particle( new PVector(width/2,height/2), 2 );
      planet.unmoveable = true;
    } else {
      planet.destroy = true;
    }
  } else if( key == 'h' || key == 'H' ) {
    hideCentrePlanet = !hideCentrePlanet;
  } else if( key == 'c' || key == 'C' ) {
    collisionsOn = !collisionsOn;
  } else if( key == 'e' || key == 'E' ) {
    collideWithEdgeOn = !collideWithEdgeOn;
  }
}

void mousePressed() {
  dragging = true;
  dragStart = new PVector( mouseX, mouseY );
}

void mouseReleased() {
  if( dragging ) {
    dragging = false;
    particles.add( new Particle( dragStart, new PVector(mouseX - dragStart.x, mouseY - dragStart.y), massValue[curMassValue] ) );
  }
}



float MAX_VEL = 400;
int idCount = 0;
class Particle {
  int id;
  PVector pos;
  PVector lastPos;
  PVector vector;
  float mass;
  boolean unmoveable;
  
  boolean destroy;
  
  //debug
  int itCount = 0;
  
  Particle( PVector _pos, float _mass ) {
    id = idCount++;
    pos = _pos;
    lastPos = new PVector(pos.x,pos.y);
    mass = _mass;
    unmoveable = false;
    vector = new PVector();
    destroy = false;
  }
  
  Particle( PVector _pos, PVector _vector, float _mass ) {
    this( _pos, _mass );
    vector = _vector;
  }
  
  void applyGravity( Particle other, float deltaTime ) {
    if( unmoveable ) {
      return;
    }
    PVector attract = new PVector( other.pos.x, other.pos.y );
    attract.sub( pos );
    float force = 1000000 * (mass*other.mass)/sq(attract.mag());
    force /= mass;
    if( force > MAX_VEL ) {
      force = MAX_VEL;
    }
    //println( "force = " + force );
    attract.normalize();
    attract.mult(force);
    //attract.mult(mass*other.mass);
    attract.mult(deltaTime);
    vector.add(attract);
  }
  
  void checkCollision( Particle other ) {
    if( dist(other.pos.x,other.pos.y,pos.x,pos.y) < (VISUAL_MASS_MULTIPLIER*(mass+other.mass)/2) ) {
      //vector.add( PVector.mult(other.vector,-1 ) );
      if( other.mass > mass ) {
        destroy = true;
      } else if( other.mass < mass ) {
        other.destroy = true;
      } else {
        destroy = true;
        other.destroy = true;
      }
    }
  }
  
  boolean draw( float deltaTime, boolean noDraw ) {
    // update
    lastPos.x = (float)pos.x;
    lastPos.y = (float)pos.y;
    pos.add( PVector.mult(vector,deltaTime) );
    // draw
    pushStyle();
    float vel = vector.mag();
    if( vel > MAX_VEL ) {
      vel = MAX_VEL;
    }
    color col;
    if( vel >= MAX_VEL/2 ) {
      vel -= MAX_VEL/2;
      vel /= MAX_VEL;
      vel *= 255 * 2;
      
      col = color( vel , vel/2, 255 - vel );
      //fill( 255 , vel, 128 + (vel / 2) );
    } else {
      vel = (vel / MAX_VEL) * 255 * 2;
      col = color( 0, 255 - vel, vel );
      //fill( vel, 255 - vel, vel / 2 );
    } 
   
    if( !noDraw ) {
      noStroke();
      fill(col);
      ellipse( pos.x, pos.y, mass * VISUAL_MASS_MULTIPLIER, mass * VISUAL_MASS_MULTIPLIER );
      if( mass == 0.1 ) {
        stroke(col);
        strokeWeight(2);
        line( lastPos.x, lastPos.y, pos.x, pos.y );
      }
    }      
    if( vectorLinesOn ) {
      //stroke(255,0,0);
      stroke( col );
      if( !noDraw ) {
        line( pos.x, pos.y, pos.x + vector.x, pos.y + vector.y );
      }
    }
    popStyle();
    
    if( collideWithEdgeOn ) {
      if( pos.x-(mass*VISUAL_MASS_MULTIPLIER) < 0 || pos.x+(mass*VISUAL_MASS_MULTIPLIER) >= width
          || pos.y-(mass*VISUAL_MASS_MULTIPLIER) < 0 || pos.y+(mass*VISUAL_MASS_MULTIPLIER) >= height ) {
            return true;
      }
    
    }
    return false;
  }
  
  void continuousDraw( PVector from, PVector to ) {
    itCount++;
    if( dist(from.x,from.y,to.x,to.y) > VISUAL_MASS_MULTIPLIER*mass ) {
      PVector middle = PVector.sub(from,to);
      ellipse( middle.x, middle.y, mass * VISUAL_MASS_MULTIPLIER, mass * VISUAL_MASS_MULTIPLIER );
      continuousDraw( new PVector(from.x,from.y), new PVector(middle.x,middle.y) );
      continuousDraw( new PVector(middle.x,middle.y), new PVector(to.x,to.y) );
    } 
  }
}


