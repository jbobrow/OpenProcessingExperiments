
//This project is a combination and edit of the Living Net and
// MotionLibSpringy examples from the point2line and motion
//libraries. The base codings are accredited to these examples.



/**
*  Living Net
*  Example sketch for the point2line library
*  Carl Emil Carlsen
*  2009
*/
import seltar.motion.*;
import controlP5.*;
Motion mf, m;
//imported from MotionLibSpringy
import point2line.*;
//float [] lineKeeperX = new  float[1000];
//float [] lineKeeperY = new  float[1000];
int counter=0;
final int COUNT = 250;
 float MAX_BUBBLE_FORCE = 2;
 float MAX_MOUSE_FORCE = -1.5;
final float MOUSE_RADIUS = 100;
final float DRAG_MULT = 0.1f;
 float PADDING = 15;
 float RADIUS = 10;
 float DIAMETER = RADIUS*1.5;
 float COLLISION_DISTANCE = DIAMETER + PADDING;
 color burnedColor = color( 0,0,0);
final color coolColor = color( 0 );
ControlP5 controlP5;
//int myColor = color(0,0,0);
float sliderValue = 100;

//public int getValuef();

boolean isTesting;

Particle[] particles;


void setup(){
  size( 500, 500 );
  smooth();
  background( 255 );
  controlP5 = new ControlP5(this);
  controlP5.addSlider("Webbing",0,100,50,2,5,100,10);
    //fill(sliderValue);
  //rect(0,0,width,100);

  mf = new Motion(width/2,height/2);
  mf.setConstant(100);
  m = new Motion(width/2,height/2);
  m.setConstant(1000);
//imported from the setup for the MotionLibSpringy

  particles = new Particle[ COUNT ];
  for (int i = 0; i < particles.length; i++) particles[ i ] = new Particle();
}


void draw(){
  
 // if(keyPressed) background(0);
  //strokeWeight(mf.getDistance());
  mf.followTo(mouseX,mouseY);
  mf.move();
  
  m.springTo(mf.getX(),mf.getY());
  m.move();
  
  if(mousePressed){
    stroke(0);
    //line(mf.getX(), mf.getY(), m.getX(),m.getY());
    fill(0);
    stroke(0);
    //ellipse(m.getX(),m.getY(),m.getDistance(),m.getDistance());
  }
  //Everything above here is imported from the draw function of MotionLibSpring
    
 // for(int i= 0; i<lineKeeperX.length; i++){
    //lineKeeperX[counter]= mf.getX();
    //lineKeeperY[counter]= mf.getY();
  //} 
  if( !isTesting ){ // fade //
    //noStroke();
    fill( 255, 30 );
    rect( 0, 0, width, height );
  } else { // clear screen //
    background( 255 );
  }
  

  // add bubble repulsion force //
  noFill();
  for (int i = 0; i < particles.length; i++) {
    for (int j = 0; j < particles.length; j++) {

      // make sure we only calculate for the same two particles once //
      if( i != j && i<j ){ 

        // calculate a vector pointing from paricle 'i' towards paricle 'j' //
        Vect2 towardsI = particles[ j ].position.subtracted( particles[ i ].position );

        // check for collision //
        if( towardsI.isLessThan( COLLISION_DISTANCE ) ){
          float distance  = towardsI.magnitude();
          
          // create a force towards paricle 'j' with the magnitude of 1 //
          Vect2 force = towardsI.divided( distance );

          // scale the force to maximum as they get closer //
          float forceInterpolator = 1 - ( distance / COLLISION_DISTANCE );
          force.scale( forceInterpolator * MAX_BUBBLE_FORCE );
          
          if(counter%50==0){
            burnedColor= color(random(255), random(255), random(255));
          // add force to particle 'j' //
          particles[ j ].addForce( force );

          // flip the force and add it to paricle 'i' //
          force.flip();
          particles[ i ].addForce( force );
}
          // display collision line //
          if( !isTesting ){
            stroke( lerpColor( coolColor, burnedColor, forceInterpolator ), 100 );
            line( particles[ i ].position.x, particles[ i ].position.y, particles[ j ].position.x, particles[ j ].position.y );
          }
        }
      }
    }
  }
  // save mouse position and speed into a vector //
  Vect2 mouse = new Vect2( mf.getX(), mf.getY() );
  Vect2 mouseSpeed = new Vect2( mf.getX(), mf.getY() );
  
  // add other forces, update and display //
  for (int i = 0; i < particles.length; i++) {
    
    // add mouse repulsion force //
    if( mouseSpeed.isGreaterThan( 0.5 ) ){
      Vect2 towardsBubble = particles[ i ].position.subtracted( mouse );
      if( towardsBubble.isLessThan( MOUSE_RADIUS ) ){
        float distance = towardsBubble.magnitude();
        float forceInterpolator = 1 - ( distance / MOUSE_RADIUS );
        Vect2 force = towardsBubble.normalized().scaled( forceInterpolator * MAX_MOUSE_FORCE );
        particles[ i ].addForce( force );
      }
    }

    // add damping //
    particles[ i ].damp( DRAG_MULT );

    // update //
    particles[ i ].update();
    
    // display //
    if( isTesting ) particles[ i ].display();
  }
counter++;
  
}

void Webbing(float myForce){
  COLLISION_DISTANCE= myForce;
}

void keyPressed(){
  if( key == ' ' ) isTesting = !isTesting;
}


