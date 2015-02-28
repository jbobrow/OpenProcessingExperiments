
/**
<h3>_2010</h3>
the longer you wait()<br>
the better you get()<br>
<br>
<br>
By: <a href="http://xuv.be">Juego</a><br>
<br>
Library: <a href="http://www.cs.princeton.edu/~traer/physics/">Traer</a>
*/

import traer.physics.*;

ParticleSystem physics;
Particle p;

PImage img;  // 2010
PGraphics snow; 

int index;
int white = color(255); 

int radius = 1;  // flocon size

float px, py;  // temporary particle coordinates

void setup() {
  size( 640, 360 );	
  fill( 255 );
  noStroke();
  frameRate(25);
  smooth();
  ellipseMode( CENTER );
  //cursor( CROSS );
  
  physics = new ParticleSystem( 0.05, 0.001 );
  
  img = loadImage("2010.png");
  img.loadPixels();
  
  snow = createGraphics(width, height, JAVA2D);
  snow.beginDraw();
  snow.smooth();
  snow.ellipseMode( CENTER );
  snow.fill(255);
  snow.noStroke();
  snow.endDraw();

}

void draw()
{
  // creation of particles
  for ( int i = 0; i < 5; i++ )
  {
      p = physics.makeParticle( 1.0f, random(-100, width+100), 0, 0 );
      p.setVelocity( random( -2.5, 2.5 ), random( 0, 1 ), 0 );
  }
  
  // process on existing particles
  for ( int i = 0; i < physics.numberOfParticles(); i++ )
  {
    p = physics.getParticle( i );
    if ( p.isFree() ) {
      px = p.position().x();
      py = p.position().y();
      
      if ( py >= height ) {
        p.kill();
      }
      else{
        
        if ((px>=0) && (px<=width)) {
        index = int(px) + int(py)*width;     
          if (index < width*height ) {
            if ( img.pixels[index] == white){
              //p.makeFixed();
              snow.beginDraw();
              snow.ellipse( px, py, radius, radius );
              snow.endDraw();
              p.kill();
            }
          }
        }
      }
    }
  }
  physics.tick();
  
  // display of particles
  background( 0 );
  img.blend(snow, 0, 0, width, height, 0, 0, width, height, ADD);
  image(snow, 0, 0, width, height);

  for ( int i = 0; i < physics.numberOfParticles(); ++i )
  {
    p = physics.getParticle( i );
    px = p.position().x();
    py = p.position().y();
    ellipse( px, py, radius, radius );
  }
}

