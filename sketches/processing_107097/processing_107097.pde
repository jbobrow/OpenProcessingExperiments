
//import traer.physics.*;
import processing.dxf.*;

boolean record;
final float NODE_SIZE = 10;
final float EDGE_LENGTH = 80;
final float EDGE_STRENGTH = 0.2;
final float SPACER_STRENGTH = 3000;

ParticleSystem physics;
float scaleValue = 1;
float centroidX = 0;
float centroidY = 0;

float remapMouseX;
float remapMouseY;
float mass = 10;
int epaisseur = 1;
float draging = 2;
Particle drag;
int counter;
boolean debugMode = false;
//PImage bg;


// PROCESSING /////////////////////////////////////

void setup()
{

  size( 800, 800, P3D);
  smooth();
  strokeWeight(epaisseur);
  ellipseMode( CENTER );       
  counter=0;

  physics = new ParticleSystem( 0, draging );

  // Runge-Kutta, the default integrator is stable and snappy,
  // but slows down quickly as you add particles.
  // 500 particles = 7 fps on my machine

  // Try this to see how Euler is faster, but borderline unstable.
  // 500 particles = 24 fps on my machine
  //physics.setIntegrator( ParticleSystem.MODIFIED_EULER ); 

  // Now try this to see make it more damped, but stable.
  //physics.setDrag( 0.2 );


//  textFont( loadFont( "yourfont.vlw" ) );
//  bg = loadImage("yourbackgroundimage.jpg");
  initialize();
}

void draw()
{
  if (record) {
    beginRaw(DXF, "Organisme - géneration n°" + counter +".dxf");
  }

  physics.tick(); 
  if ( physics.numberOfParticles() > 1 && drag == null )
    updateCentroid();
  //    background(bg);
  background(0);


  fill( 255 ); 
  text( "Laurent Pavot", width/2 -30, 20 );
  text( "" + physics.numberOfParticles() + " PARTICLES\n", width/2-30, 40 );
  translate( width/2, height/2 );
  scale( scaleValue );
  translate( -centroidX, -centroidY );
  drawNetwork();
  if (physics.numberOfParticles()<700) {
    float probability= 10000;
    float mutation=random(0, probability);
    if (mutation <20) {
      addNode();
      println("mutation");
    }
    //    println(mutation);
    if (record) {
      endRaw();
      record = false;
      counter++;
    }
  }
}

//////////////////////////////////////////////Comportement de la souris


void mousePressed()
{

  for ( int i = 0; i < physics.numberOfParticles(); ++i )
  {
    Particle v = physics.getParticle( i );

    remapMouse();

    if (abs(v.position.x - remapMouseX) < NODE_SIZE / scaleValue &&  abs(v.position.y - remapMouseY)  < (NODE_SIZE / scaleValue)) {
      drag = v;
      drag.makeFixed();
      drag.position.set( remapMouseX, remapMouseY, 0 );
      if (keyPressed && 	key == CODED && keyCode == CONTROL)
      {
        deletesprings(v);
        physics.removeParticle(v);
        if (drag != null) {
          drag.makeFree(); 
          drag = null;
        }
      }
      return;
    }
  }
}

void remapMouse() {
  remapMouseX = centroidX + (mouseX - width/2)  / scaleValue;
  remapMouseY = centroidY + (mouseY - height/2) / scaleValue;
}

void mouseDragged()
{ 
  if (drag != null) {
    remapMouse();
    drag.position.set( remapMouseX, remapMouseY, 0 );
  }
  else {
    for ( int i = 0; i < physics.numberOfParticles(); ++i )
    {
      Particle v = physics.getParticle( i );

      remapMouse();

      if (abs(v.position.x - remapMouseX) < NODE_SIZE / scaleValue &&  abs(v.position.y - remapMouseY)  < (NODE_SIZE / scaleValue)) {
        if (drag != null) {
          drag.makeFree(); 
          drag = null;
        }
        if (keyPressed && keyCode == CONTROL)
        {
          deletesprings(v);
          physics.removeParticle(v);
        }
      }
    }
  }
}

void mouseReleased()
{
  if (drag != null) {
    drag.makeFree(); 
    drag = null;
  }
}

void keyPressed()
{

  if (key == 'r') {
    record = true;
  }
  if ( key == 'c' )
  {
    initialize();
    return;
  }

  if ( key == ' ' )
  {
    addNode();
    return;
  }
  if ( key == 'w' )
  {
    debugMode = !debugMode;
  }
}


//////////////////////////////////////////////Dessins du maillage


void drawNetwork()
{      
  // draw particles
  fill(255 );
  noStroke();
  if (debugMode)
  {
    for ( int i = 0; i < physics.numberOfParticles(); ++i )
    {
      Particle v = physics.getParticle( i );


      ellipse( v.position.x, v.position.y, NODE_SIZE, NODE_SIZE );
    }
  }

  // draw edges 
  stroke( 255 );
  beginShape( LINES );
  for ( int i = 0; i < physics.numberOfSprings(); ++i )
  {
    Spring e = physics.getSpring( i );
    Particle a = e.getOneEnd();
    Particle b = e.getTheOtherEnd();
    vertex( a.position.x, a.position.y );
    vertex( b.position.x, b.position.y );
  }
  endShape();
}

//////////////////////////////////////////////Croisement des segments

boolean isSegmentCrossingAnySpring(Vector start, Vector end) {
  for ( int i = 0; i < physics.numberOfSprings(); ++i ) {
    Spring e = physics.getSpring( i );
    Particle a = e.getOneEnd();
    Particle b = e.getTheOtherEnd();    
    Vector result = segIntersection(start.x, start.y, end.x, end.y, a.position.x, a.position.y, b.position.x, b.position.y);
    if (result != null && !isVectorEqual(result, start) && !isVectorEqual(result, end)) {
      return true;
    }
  }
  return false;
}

boolean isVectorEqual(Vector v1, Vector v2) {
  return v1.x == v2.x && v1.y == v2.y;
}


//////////////////////////////////////////////Delete springs

void deletesprings(Particle v) {

  ArrayList<Spring> springsToRemove = new ArrayList<Spring>();
  for ( int i = 0; i < physics.numberOfSprings(); ++i )
  {
    Spring e = physics.getSpring( i );
    if (e.getOneEnd()== v || e.getTheOtherEnd()== v)
    {
      springsToRemove.add(e);
    }
  }

  for ( int i = 0; i < springsToRemove.size(); ++i ) {
    physics.removeSpring(springsToRemove.get(i));
  }
}


//////////////////////////////////////////////Update du Centroid

void updateCentroid()
{
  float 
    xMax = Number.NEGATIVE_INFINITY, 
  xMin = Number.POSITIVE_INFINITY, 
  yMin = Number.POSITIVE_INFINITY, 
  yMax = Number.NEGATIVE_INFINITY;

  for ( int i = 0; i < physics.numberOfParticles(); ++i )
  {
    Particle p = physics.getParticle( i );
  var titi = p;
    xMax = max( xMax, titi.position.x );
    xMin = min( xMin, titi.position.x );
    yMin = min( yMin, titi.position.y );
    yMax = max( yMax, titi.position.y );
  }
  float deltaX = xMax-xMin;
  float deltaY = yMax-yMin;

  centroidX = xMin + 0.5*deltaX;
  centroidY = yMin +0.5*deltaY;

  if ( deltaY > deltaX )
    scaleValue = height/(deltaY+200);
  else
    scaleValue = width/(deltaX+200);
}

////////////////////////////////////////////////adding elements
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
  physics.makeSpring( a, b, EDGE_STRENGTH, EDGE_STRENGTH, random(EDGE_LENGTH/3, EDGE_LENGTH) );
}

void initialize()
{
  physics.clear();
  physics.makeParticle();
  addNode();
  addNode();
}

void addNode()
{ 
  if (physics.numberOfParticles() == 0) {
    Particle p = physics.makeParticle();
  }
  else {

    println("try" + random(1, 100));
    try {
      Particle p = physics.makeParticle( mass, 0f, 0f, 0f );
      Particle q = null;
      Vector positionP = null;
      boolean foundAPosition = false;
      while (!foundAPosition) {
        q = getRandomNode(p, null);
        positionP = new Vector(q.position.x + random( -1, 1 ), q.position.y + random( -1, 1 ), 0);

        int essai = 0;
        while (isSegmentCrossingAnySpring (fonctionmultiplication (q.position, positionP), q.position) && essai < 100) {
          //Recherche une autre position
          positionP = new Vector(q.position.x + random( -10, 10 ), q.position.y + random( -10, 10 ), 0);
          essai++;
        }
        if (essai == 100) {
          println("ce noeud etait moisi");
        }
        else {

          if (physics.numberOfParticles() > 2) {
            Particle q2 = getRandomNode(p, q);
            int n = 0;
            //        while (isSegmentCrossingAnySpring (fonctionmultiplication(q2.position(), positionP), q2.position()) && n < physics.numberOfParticles()) {
            while (isSegmentCrossingAnySpring (positionP, q2.position) && n < physics.numberOfParticles()) {
              //Recherche une autre position
              q2 = getRandomNode(p, q);
              n++;
            }

            if ( n < physics.numberOfParticles()) {
              foundAPosition = true;
              addSpacersToNode( p, q2 );
              makeEdgeBetween( p, q2 );
            }
            else {
              println("recommance à zero");
            }
          }
          else {  
            foundAPosition = true;
          }
        }
      }


      addSpacersToNode( p, q );
      makeEdgeBetween( p, q );
	  var toto = p;
      toto.position.set(positionP.x, positionP.y, 0 );
      println("done" + random(1, 100));
    }
    catch(Exception e) {
      println("bouarhhh" + e.message  );
    }
  }
}

Vector fonctionmultiplication(Vector reference, Vector variable) {

  variable.x;
  variable.y;
  reference.x;
  reference.y;
  float coordoneeX = (variable.x-reference.x)*1000;
  float coordoneeY = (variable.y-reference.y)*1000;

  Vector pointfaraway = new Vector(coordoneeX, coordoneeY, 0);

  return pointfaraway;
}

Particle getRandomNode(Particle p, Particle p2) {
  Particle q = physics.getParticle( (int)random( 0, physics.numberOfParticles()-1) );
  while ( q == p || q == p2 )
    q = physics.getParticle( (int)random( 0, physics.numberOfParticles()-1) );
  return q;
}

Vector segIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) 
{ 
  float bx = x2 - x1; 
  float by = y2 - y1; 
  float dx = x4 - x3; 
  float dy = y4 - y3;
  float b_dot_d_perp = bx * dy - by * dx;
  if (b_dot_d_perp == 0) {
    return null;
  }
  float cx = x3 - x1;
  float cy = y3 - y1;
  float t = (cx * dy - cy * dx) / b_dot_d_perp;
  if (t < 0 || t > 1) {
    return null;
  }
  float u = (cx * by - cy * bx) / b_dot_d_perp;
  if (u < 0 || u > 1) { 
    return null;
  }
  return new Vector(x1+t*bx, y1+t*by, 0);
}



