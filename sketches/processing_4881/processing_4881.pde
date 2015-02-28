

import traer.physics.*;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
//AudioInput in;


final float NODE_SIZE = 10;
final float EDGE_LENGTH = 20;
final float EDGE_STRENGTH = 0.2;
final float SPACER_STRENGTH = 1000;

ParticleSystem physics;
float scale = 1;
float centroidX = 0;
float centroidY = 0;
float V =0;
float c1 =0;
void setup()
{
  size( 1280, 800,P2D );
  smooth();
  frameRate(25);
  strokeWeight( 1 );
  ellipseMode( CENTER ); 
  physics = new ParticleSystem( 0, 0.1 ); 
  minim = new Minim(this);
player = minim.loadFile("1.mp3", 2048);
  player.play();
//minim.debugOn();
  //in = minim.getLineIn(Minim.STEREO, 512);
  initialize();
}

// flag for delay 30 frames
int i = 0;
int Flag = 0;

// color begin change value
int colorBegin = 0;  // seconds = colorBegin / frameRate, 
int colorStep = 0;

// rotate
int rotateBegin = 30;   // seconds
int rotateStep = 0;
float arcStep = PI / 600;  // radio

void draw()
{
  physics.tick(); 
  if ( physics.numberOfParticles() > 1 )
    updateCentroid();

  background( 0 );
  translate( width/2 , height/2 );
  scale( scale );
  translate( -centroidX, -centroidY );
  if (Flag == 0)
  {
    for(int j= 0; j < player.mix.size(); j+=100)
    {
      if(player.mix.get(j)*1000>30)
      {
        addNode();
        Flag = 1;
        break;
      }
    }
  }
  else
  {
    i++;
    if (i%30 == 0) Flag = 0;
  }
  
  drawNetwork();  

  // increase colorStep
  if (colorStep < colorBegin)
  {
    colorStep++;
  }
  // increase rotateStep
  if (rotateStep < rotateBegin * frameRate)
  {
    rotateStep++;
  }
}


void drawNetwork()
{      
  // draw vertices
  noStroke();
  for ( int i = 0; i < physics.numberOfParticles(); ++i )
  {
    Particle v = physics.getParticle( i );
    for(int k = 0; k < player.bufferSize()-1; k+=100)
    {
      ellipse( v.position().x(), v.position().y(), NODE_SIZE/2+player.mix.get(k)*50, NODE_SIZE/2+ player.mix.get(k)*50);    
     
      // color change
      if (colorStep >= colorBegin)
      {
        if(player.mix.get(k)*1000 > 30)
        {
          colorMode(HSB);
          c1+=1;
          c1%= 255;
          fill(c1,255,255,100);
        }
      }
    }
  }
  
  // draw edges 
  stroke(255,100);
  beginShape( LINES );
  for ( int i = 0; i < physics.numberOfSprings(); ++i )
  {
    Spring e = physics.getSpring( i );
    Particle a = e.getOneEnd();
    Particle b = e.getTheOtherEnd();
    vertex( a.position().x(), a.position().y() );
    vertex( b.position().x(), b.position().y() );
       
  }
  endShape();  
  
  // calculator rotate
  if ((rotateStep >= (rotateBegin * frameRate)) && (physics.numberOfParticles() > 1))
  {
    for ( int i = 0; i < physics.numberOfParticles(); ++i )
    {
      float r2, arcv, newx, newy;
    
      Particle v = physics.getParticle( i );
      r2 = sqrt(sq(v.position().x() - width / 2) + sq(v.position().y() - height / 2));
      arcv = atan2((v.position().y() - height / 2), (v.position().x() - width / 2));
      arcv += arcStep;
      newx = r2 * cos(arcv);
      newy = r2 * sin(arcv);
      v.position().set(newx, newy, 0);   
    }
  }
}

void updateCentroid()
{
  float 
    xMax = Float.NEGATIVE_INFINITY, 
    xMin = Float.POSITIVE_INFINITY, 
    yMin = Float.POSITIVE_INFINITY, 
    yMax = Float.NEGATIVE_INFINITY;

  for ( int i = 0; i < physics.numberOfParticles(); ++i )
  {
    Particle p = physics.getParticle( i );
    xMax = max( xMax, p.position().x() );
    xMin = min( xMin, p.position().x() );
    yMin = min( yMin, p.position().y() );
    yMax = max( yMax, p.position().y() );
  }
  float deltaX = xMax-xMin;
  float deltaY = yMax-yMin;
  
  centroidX = xMin + 0.5*deltaX;
  centroidY = yMin +0.5*deltaY;
  
  if ( deltaY > deltaX )
    scale = height/(deltaY+50);
  else
    scale = width/(deltaX+50);
}

void addSpacersToNode( Particle p, Particle r )
{
  for ( int i = 0; i < physics.numberOfParticles(); ++i )
  {
    Particle q = physics.getParticle( i );
    if ( p != q && p != r )
      physics.makeAttraction( p, q, -SPACER_STRENGTH, 20 );
   
  }
}

void makeEdgeBetween( Particle a, Particle b )
{
  physics.makeSpring( a, b, EDGE_STRENGTH, EDGE_STRENGTH, EDGE_LENGTH );
}

void initialize()
{
  physics.clear();
  physics.makeParticle();
}

void addNode()
{ 
  Particle p = physics.makeParticle();
  Particle q = physics.getParticle( (int)random( 0, physics.numberOfParticles()-1) );
  while ( q == p )
    q = physics.getParticle( (int)random( 0, physics.numberOfParticles()-1) );
  addSpacersToNode( p, q );
  makeEdgeBetween( p, q );
  p.position().set( q.position().x() + random( -1, 1 ), q.position().y() + random( -1, 1 ), 0 );
  
}


