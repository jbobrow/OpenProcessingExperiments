
import processing.dxf.*;



/* Created: 2-9-08
 Modified by Katie Adee and Natasha Harper
 Node/particle reorganization and connection logic based on distance thresholds  */

import traer.physics.*;
import traer.animation.*;
import processing.pdf.*;
import processing.opengl.*;

//global variables 
final float NODE_SIZE = 5;  //node diameter
final float EDGE_LENGTH = 10;  //length of branching lines initially
final float EDGE_STRENGTH = 0.4;  //strength of spring (controls the amount of stretching possible)
final float SPACER_STRENGTH = 300;  // controls the amount of reo
float vertDist = 40;

ParticleSystem physics;
Smoother3D centroid;
Particle z;
Particle anchor;

// PROCESSING /////////////////////////////////////
boolean record;


void setup()
{
  //size( screen.width, screen.height); 
  size( 500,500); 
  smooth();
  frameRate( 24 );
  strokeWeight(1);
  ellipseMode( CENTER );       

  physics = new ParticleSystem( 0, 1.0 );
  centroid = new Smoother3D( 0.8 );
  initialize();
}

void draw()
{
   if (record) {
    beginRaw(DXF, "output-####.dxf");
  }

   camera (width,height, 900, (width/2), (height/2), 0, 1, 1,1);
  
  physics.tick( 1.0 ); //within physics library, creates a counter to continue to make more nodes
  if ( physics.numberOfParticles() > 1 )
    updateCentroid();
  centroid.tick();
  background(255);
  translate( width/2 , height/2 );
  scale( centroid.z() );
  translate( -centroid.x(), -centroid.y() );

  drawLines();  
  drawNetwork();  
  
   if (record) {
    endRaw();
    record = false;
  }

}


void drawNetwork()
{      
  // finds a node within the system and draws a new node branching from that point
  noStroke();
  for ( int i = 0; i < physics.numberOfParticles(); ++i )
  {
    Particle v = physics.getParticle( i );

    stroke (.1);
    fill(0,0,100,75);
    ellipse( v.position().x(), v.position().y(), NODE_SIZE+15, NODE_SIZE +15);
    //fill(150,30);
    //ellipse( v.position().x(), v.position().y(), NODE_SIZE+55, NODE_SIZE +55);
    //stroke (255,0,0);
    fill(0,150);
    ellipse( v.position().x(), v.position().y(), NODE_SIZE, NODE_SIZE );
    
    translate (0,0,vertDist);
      fill(100,0,0,75);
      ellipse( v.position().x(), v.position().y(), NODE_SIZE+15, NODE_SIZE +15);
      //fill(150,30);
      //ellipse( v.position().x(), v.position().y(), NODE_SIZE+55, NODE_SIZE +55);
      fill(0,150);
      ellipse( v.position().x(), v.position().y(), NODE_SIZE, NODE_SIZE );
      
      translate  (0,0,vertDist*-1);
      
     translate (0,0,vertDist*2);
      fill(100,75);
      ellipse( v.position().x(), v.position().y(), NODE_SIZE+15, NODE_SIZE +15);
      //fill(150,30);
      //ellipse( v.position().x(), v.position().y(), NODE_SIZE+55, NODE_SIZE +55);
      fill(0,150);
      ellipse( v.position().x(), v.position().y(), NODE_SIZE, NODE_SIZE );
      
    translate  (0,0,vertDist*-2);
      
    stroke(0);
    strokeWeight(1);
    line(v.position().x(), v.position().y(),0,v.position().x(), v.position().y(),vertDist);
    line(v.position().x(), v.position().y(),vertDist,v.position().x(), v.position().y(),vertDist*2);
  }

  // draw branching lines that connect each new node 
  stroke(0);
  strokeWeight (2);
  beginShape( LINES );
  for ( int i = 0; i < physics.numberOfSprings(); ++i )
  {
    Spring e = physics.getSpring( i );
    Particle a = e.getOneEnd();
    Particle b = e.getTheOtherEnd();
    vertex( a.position().x(), a.position().y(),0 );
    vertex( b.position().x(), b.position().y(),0 );
    vertex( a.position().x(), a.position().y(),vertDist );
    vertex( b.position().x(), b.position().y(),vertDist );
    vertex( a.position().x(), a.position().y(),vertDist*2 );
    vertex( b.position().x(), b.position().y(),vertDist*2 );
  }
  endShape();
}

// drawing connection lines based on a distance threshold for secondary organizations
void drawLines(){
  for ( int i = 0; i < physics.numberOfParticles(); ++i )
  {
    for ( int j = 0; j < physics.numberOfParticles(); ++j )
    {
      Particle d= physics.getParticle(i); 
      Particle e= physics.getParticle(j); 
      float distance= dist (d.position().x(), d.position().y(),e.position().x(), e.position().y());

      if((distance>=50)&&(distance<60)){
        strokeWeight(1);
        stroke(200,0,0);
        //line(d.position().x(), d.position().y(),0,e.position().x(), e.position().y(),0);
        line(d.position().x(), d.position().y(), 0 ,e.position().x(), e.position().y(), vertDist);
        line(d.position().x(), d.position().y(),vertDist ,e.position().x(), e.position().y(),vertDist*2);
      }
      if((distance>=40)&&(distance<50)){
        strokeWeight(1);
        stroke(0,200,0);
        //line(d.position().x(), d.position().y(),0,e.position().x(), e.position().y(),0);
        //line(d.position().x(), d.position().y(), 0 ,e.position().x(), e.position().y(), vertDist);
        //line(d.position().x(), d.position().y(),vertDist ,e.position().x(), e.position().y(),vertDist*2);
      }
      if((distance>=80)&&(distance<110)){
        strokeWeight(1);
        stroke(0,0,200);
        //line(d.position().x(), d.position().y(),0,e.position().x(), e.position().y(),0);
       // line(d.position().x(), d.position().y(), 0 ,e.position().x(), e.position().y(), vertDist);
        line(d.position().x(), d.position().y(),vertDist*2 ,e.position().x(), e.position().y(),vertDist*2);
      }
    }
  }
}

   /////////////////////////////////////////////

void keyPressed()
{
  if ( key == 'c' )  //clears screen and resets the script
  {
    initialize();
    return;
  }

  if (key == 's')   //saves a jpeg of the screen when the s key is pressed
  {
    saveFrame ("nodes-####.jpg");
  }
  
  if (key == 'r') record = true;


  if ( key == ' ' )  //when spacebar is pressed, a new node is added
  {
    addNode();
    return;
  }
}

   //////////////////////////////////////////

void updateCentroid() // whenever system is reorganized or scaled, node positions have to be updated
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
 
  if ( deltaY > deltaX )
    centroid.setTarget( xMin + 0.5*deltaX, yMin +0.5*deltaY, height/(deltaY+50) );
    
  else
    centroid.setTarget( xMin + 0.5*deltaX, yMin +0.5*deltaY, width/(deltaX+50) );
}


void addSpacersToNode( Particle p, Particle r ){ 
  //reorganizes nodes so that they are as spaced out as possible within its connectionns
  for ( int i = 0; i < physics.numberOfParticles()-1; i++ )
  {
    Particle q = physics.getParticle( i );
    if ( p != q && p != r )
      physics.makeAttraction( p, q, -SPACER_STRENGTH, 20 );  //the negative sign makes particles repel rather than attract
  }
}

void makeEdgeBetween( Particle a, Particle b ) //creates a spring between node and new node 
{
  physics.makeSpring( a, b, EDGE_STRENGTH, EDGE_STRENGTH, random(25,40));
}

void initialize() //this function clears the screen and resets function
{
  physics.clear();
  physics.makeParticle();
  centroid.setValue( 0, 0, 1.0 );
}

void addNode() //function that adds a new node everytime spacebar is pressed
{ 
  Particle p = physics.makeParticle();
  
  if (int(physics.numberOfParticles()) <= 10){
  Particle q = physics.getParticle( (int)random(0, physics.numberOfParticles()-1) );
  while ( q == p )
    q = physics.getParticle( (int)random(0, physics.numberOfParticles()-1) );
  addSpacersToNode( p, q );
  makeEdgeBetween( p, q );
  p.moveTo( q.position().x() + random( -1, 1 ), q.position().y() + random( -1, 1 ), 0 );
  line (p.position().x(),p.position().y(),q.position().x(),q.position().y()); 
  }
  else{

  Particle q = physics.getParticle( (int)random(physics.numberOfParticles()-11, physics.numberOfParticles()-1) );
  while ( q == p )
    q = physics.getParticle( (int)random(physics.numberOfParticles()-11, physics.numberOfParticles()-1) );
  addSpacersToNode( p, q );
  makeEdgeBetween( p, q );
  p.moveTo( q.position().x() + random( -1, 1 ), q.position().y() + random( -1, 1 ), 0 );
  line (p.position().x(),p.position().y(),q.position().x(),q.position().y()); 
  }  
    
  
}



