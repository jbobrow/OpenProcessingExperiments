
import traer.physics.*;
ParticleSystem physics;
Particle raton, pauno00, pauno01;
float juerza, embarrado;

void setup()
{
  size( 720, 720 );
  smooth();
  fill( 0 );
  ellipseMode( CENTER );
        
  physics = new ParticleSystem( 0.1, 0.1 );
  //PARTICULAS      
  raton = physics.makeParticle( 1.0, width/2, height/2, 0 );
  pauno00 = physics.makeParticle( 10.0, width/2, height/2, 0 );
  pauno01 = physics.makeParticle( 10.0, width/2, height/2, 0 );
  //RESORTES
  physics.makeSpring( raton, pauno00, 1, 0.1, 75 );
  physics.makeSpring( pauno00, pauno01, 1, 0.1, 75 );
}

void mousePressed()
{
   pauno00.makeFixed(); 
   pauno00.position().set( mouseX, mouseY, 0 );
   pauno01.makeFixed(); 
   pauno01.position().set( mouseX, mouseY, 0 );
}

void mouseDragged()
{
  pauno00.position().set( mouseX, mouseY, 0 );
  pauno01.position().set( mouseX, mouseY, 0 );
}

void mouseReleased()
{
   pauno00.makeFree();
   pauno01.makeFree(); 
}

void draw()
{
  embarrado = map(mouseY, 0, height, 0, 50);
  noStroke();
  fill(255, embarrado);
  rect(0, 0, width, height);

  juerza = map(mouseX, 0, height, -100, 100);
  println(juerza);
  
//  physics.makeAttraction( pauno00, raton, map(mouseX, 0, height, -100, 100), 10 );

  raton.position().set( mouseX, mouseY, 0 );

  fill(0);
  stroke(0);
  
  line( pauno00.position().x(), pauno00.position().y(), raton.position().x(), raton.position().y() );
  line( pauno00.position().x(), pauno00.position().y(), pauno01.position().x(), pauno01.position().y() );
  ellipse( raton.position().x(), raton.position().y(), 5, 5 );
  ellipse( pauno00.position().x(), pauno00.position().y(), 10, 10 );
  ellipse( pauno01.position().x(), pauno01.position().y(), 15, 15 );

  physics.tick();
}


