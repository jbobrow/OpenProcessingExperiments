
//Modified from "Sam's Code"
//Taylor Milner
/*

[Right click] in order to place desired number of 'buildings'.
Press and hold [SPACE BAR] in order to populate 'world'.
Press and hold [=] in order to see people trails.

To hide 'buildings', press [0]

*/

import traer.physics.*;

PGraphics pg;


ArrayList people; //declare mover array
ArrayList buildings; //declare cities array

ParticleSystem physics;


void setup(){ 
  smooth(); 
  //noStroke(); 
  size(500,500);
  rectMode(CENTER);


  pg = createGraphics(width,height,P2D); //implement pg layers

  physics = new ParticleSystem(0,0.0001); //implement particle system

  people = new ArrayList(); //new ArrayList() for people
buildings = new ArrayList(); //new ArrayList() for buildings

}

void draw(){ 



  pg.beginDraw(); //record to PGraphics
  background(255);
  pg.endDraw();


  physics.tick(); //start traer tick

//places random particles--or people-- by holding down the space bar
  if (keyPressed && (key == ' ')){
    Particle p = physics.makeParticle(1.0,random(0,width),random(0,height),0.0); //create particle
    people.add(p); //assign particle p to people array
    for (int i = 0; i < buildings.size(); i++){
      Particle q = (Particle) buildings.get(i); //call all particles from buildings array and create a particle
      physics.makeAttraction(p,q,random(-15,15),20); //makeAttraction between all buildings particles and new people particles 
    }
  }
  else if (keyPressed && (key == '0')){
    buildings.clear(); //clears 'cities'
  }

  if(mousePressed == true){
    Particle p = physics.makeParticle(1.0,mouseX,mouseY,0.0); //creates a new particle
    p.makeFixed(); //particle is fixed
    buildings.add(p); //adds fixed particle to buildings array

    for (int z = 0; z < people.size(); z++){
      Particle q = (Particle) people.get(z); //call all particles from people array and create a particle
      physics.makeAttraction(p,q,random(-15,15),20); //makeAttraction between buildings and people particles with the creation of every new person
    }
  }
  
//person were given a velocity once upon a time

  /*
 for (int i = 0; i <people.size(); i++){
   Particle t = (Particle) people.get(i);
   t.velocity().setX(2);
   t.velocity().setY(2);
   }
   } */


  for ( int i = 0; i < buildings.size(); i++)
  {
    Particle v = (Particle) buildings.get(i);
    rect( v.position().x(), v.position().y(), 25, 25); //show buildings particle where mousePressed
  }


  for ( int i = 0; i < people .size(); i++)
  {
    Particle v = (Particle) people.get(i);
    //v.velocity().setX(random(-3,3));
    //v.velocity().setY(random(-3,3));
    fill(255,172,5);
     strokeWeight(.4);
    stroke (0);
   
  
   
  
    ellipse(v.position().x()-4, v.position().y() -1, 4,2); //right foot
    ellipse(v.position().x()-4, v.position().y() +3, 4,2); //left foot
     ellipse(v.position().x(), v.position().y(), 6,14); //shoulders
     ellipse( v.position().x(), v.position().y(), 5, 5); //drawing person from above - head
    fill(0);
    Boundary ( v );
  }

  //---begin autonomous PGraphic layer in order to see with click of '=' ---//
  pg.beginDraw();
  for ( int i = 0; i < people.size(); i++)
  {
    Particle v = (Particle) people.get(i);
    
    pg.fill(220,220,220);
    pg.noStroke();
    pg.ellipse( v.position().x(), v.position().y(), 2, 2);
    Boundary ( v );
  }
  pg.endDraw();

  if (keyPressed && (key == '=')){
    image(pg,0,0); //implement pg layer
  }
  //--- stop PGraphic ---//


} 

  //canvas edges act as boundaries for ball. pulled from 
  //http://www.cs.princeton.edu/~traer/physics/bouncy_balls/Bouncy_Balls.pde

void Boundary (Particle p){


  if ( p.position().x() < 0 || p.position().x() > width )
    p.velocity().set( -0.9*p.velocity().x(), p.velocity().y(), 0 );
  if ( p.position().y() < 0 || p.position().y() > height )
    p.velocity().set( p.velocity().x(), -0.9*p.velocity().y(), 0 );
  p.position().set( constrain( p.position().x(), 0, width ), constrain( p.position().y(), 0, height ), 0 ); 
}

