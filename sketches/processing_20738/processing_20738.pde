
/****************header notes*******************/
/*
ideas
show location of x,y
show amount of 'force' needed to pull pendulum
show recoil of string/rubber band as a wave
add weights to end of pendulum and see what happens
integrate some kind of slider to speed reaction up and down to pull on pendulum
move pendulum further from influence of gravity
graphical representation of how mass affects weight... the further from large mass the less you weigh
questions:
how to use this in a physics class?
-show energy required to move mass
-use this as the basis for a ferris wheel demonstration... increase the mass and you increase the amount 
of energy needed to move the wheel

must move from a carbon economy to a solar economy...
*/

/****************import*************************/
import traer.physics.*;
//http://murderandcreate.com/physics/
/****************variables*************************/
ParticleSystem physics;

Particle p;
Particle anchor;
Spring s;

/****************setup*************************/
void setup()
{
  size( 400, 400 );
  smooth();
  fill( 0 );
  ellipseMode( CENTER );//file:///home/user/processing-1.2.1/reference/ellipseMode_.html
        
  physics = new ParticleSystem( 1, 0.5 );//new ParticleSystem( float gravityY, float drag )
  //changing drag is equivalent to changing weight? apparently yes
        
  p = physics.makeParticle( 1.0, width/2, height/2, 0 );//Particle makeParticle( float mass, float x, float y, float z )
  anchor = physics.makeParticle( 1.0, width/2, height/2, 0 );
  anchor.makeFixed(); //Particles can either be fixed or free. 
  //If they are free they move around and are affected by forces, if they are fixed they stay where they are.
  s = physics.makeSpring( p, anchor, 0.5, 0.1, 75 );
}

/****************mouse pressed*************************/
//grab the pendulum
void mousePressed()
{
   p.makeFixed(); 
   p.position().set( mouseX, mouseY, 0 );
}

/****************mouse dragged*************************/
//drag the pendulum
void mouseDragged()
{
  p.position().set( mouseX, mouseY, 0 );
}
/****************mouse released*************************/
//release the pendulum
void mouseReleased()
{
   p.makeFree(); 
}
/****************draw*************************/
void draw()
{
  physics.tick(1.5);//higher the number the faster the bounce
  //play with this value
  //advance the simulation by some time t, or by the default 1.0. 
  //You'll want to call this in draw(). You probably want to keep this the same at all 
  //times unless you want speed up or slow things down.
    
  background( p.position().x(), p.position().y(), p.position().x());//change color with mouse action
  
  line( p.position().x(), p.position().y(), anchor.position().x(), anchor.position().y() );
  //this keeps the line connected between the two ellipse
  //how to create more objects to pull upon?
  ellipse( anchor.position().x(), anchor.position().y(), 5, 5 );
  rect( p.position().x(), p.position().y(), 20, 20 );
  rect( p.position().x(), p.position().y()-40, 10, 10 );
}

