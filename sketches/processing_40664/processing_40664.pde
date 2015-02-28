
//////////////////////////////////////////////

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

  if ( deltaY > deltaX ) //scale to the largest direction
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


void updateNodes() {
  initialize();
  for (int h = 0; h < hours; h ++) {
    addNode();
  }

  for (int m = 0; m < minute(); m ++) {
    addNode();
  }
}


