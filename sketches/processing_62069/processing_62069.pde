
/** Revolutions.
 *  Mr.Ferraro's AP Computer Science course
 *  
 *  A simulation present examples of force of attraction due to mass. Depending on the mass of each planet, it will or will not orbit the sun.
 *  Players may select the desired area to place a planet of random size and mass. A small circle represents a smaller mass and vice-versa otherwise.
 *  Planets have a initial velocity diagonal to the lower right.
 *  @date May 18, 2012
 *  @author Stanley Huang
 *
*/ 

import traer.physics.*;

PFont font;

ParticleSystem system;
Particle middle, repel;
Particle[] otherPlanets;
int numPlanets = 1;
float size = 52, newSize;

boolean loop, start= false, clear = false;

PImage img;

void setup() {
  size(640, 400);
  frameRate(20);
  
  println("Loading image...");
  img = loadImage("stars_background.jpg");
  imageMode(CENTER);
  smooth();
  
  system = new ParticleSystem(10, 0.1);
  middle = system.makeParticle(500, width/2, height/2, 0);
  middle.makeFixed();
  println("Done with setup...");
}   

void draw() {
  //boolean to represent pause or start 
  loop = true;
  
  //advancing time forward by desired fps
  system.tick(.9);
  
  //background is the image of img
  background(img);
  
  //the introduction
  if ( start == false) {
    startScreen();
    
  } else {
    ellipse(mouseX, mouseY, 10, 10);
   
    Particle mid = middle;
    mid.makeFixed();
    fill(237, 182, 0);
    ellipse(mid.position().x(), mid.position().y(), 100, 100);
    
    //each time the player clicks the mouse, a new planet is formed
    for(int i = 1; i < system.numberOfParticles(); i++) {
      fill(44, 64, 157);
      Particle p = system.getParticle(i);
      
      println("The x - position of planet p is " + p.position().x() + ". The y - position of planet p is " + p.position().y());
      println("The sun's x-position is " + mid.position().x());

      int orbit = 0;
      float pX = p.position().x();
      float pY = p.position().y();
      if ( p.velocity().x() < 0) {
        orbit++;
        if (  (pX < mid. position().x() - 60 || pX > mid. position().x() + 60 || pY < mid.position().y() - 60 || pY > mid.position().y()+ 60) ) {
          ellipse(p.position().x(), p.position().y(), p.mass() / 10, p.mass() / 10);
        }    
      } else {
        ellipse(p.position().x(), p.position().y(), p.mass() / 10, p.mass() / 10);
        orbit++;
      }
    }
    
    drawLegend();
  }
}

//presents the different function of each key in text
void drawLegend() {
  String msg = "Click [SPACE] to pause/resume\n 'c' to clear.";
  fill(255, 255, 255);
  textSize(16);
  text(msg, 8, 20);
  textAlign(LEFT);//place text in the left 
}

void mousePressed() {
  addPlanet(mouseX, mouseY);
}

//adds a new planet to the field
void addPlanet(float x, float y) {
  newSize = random(size);
  Particle p = system.makeParticle( newSize * 10, x, y, 0.0);
  p.makeFree();
  p. velocity().set(5, 5, 5);
  
  system.makeAttraction(middle, p, 80, p.mass()/2);//creates an attraction between the planet created and the sun
}

//the beginning screen of the simulation
void startScreen() {
  if( start == false) {
    background(img);
    font = loadFont("Bauhaus93-48.vlw");
    fill(0, 255, 219);
    textFont(font, 80);
    textAlign(CENTER);
    text("Revolutions", width/2, height/2 - 140);
    textFont(font, 20);
    text("...a S_IMULATION", width/2, height/2 - 120);
    
    font = loadFont("CalifornianFB-Bold-48.vlw");
    fill(164, 5, 173);
    textFont(font, 25);
    textAlign(CENTER);
    text("Left click to place planets", width/2, height/2);
    
    font = loadFont("BookmanOldStyle-48.vlw");
    fill(255, 5, 5);
    textFont(font, 30);
    textAlign(CENTER);
    text("You ready? press [ENTER]", width/2, height/2  + 150);
  }
}

//each key represents a different tasks to be run
void keyPressed() {
  if( loop && key == ' ' && start == true) {
    noLoop();
  } else if ( key == ENTER && start == false) {
    start = true;
  } else if( key == 'c' ) {
    clear = true;
    clearAll();
  } else {
    loop();
  }
  loop =! loop;
}

//clear the field and delete all current planets
void clearAll() {
  if ( clear == true) {
    system.clear();
    redraw();
    clear =! clear; 
  }
}

/*
void checkCollision() {
  if ( system.numberOfParticles() > 1 ) {
    println("running checkCollision...");
    for (int i = 0; i < system.numberOfParticles(); i++) {
      println("running checkCollision loops...");
      for( int j = 1; j < system.numberOfParticles(); j++) {
        
        println("The distance between i and j" + system.getParticle(i).distanceTo(system.getParticle(j)));
        //println("The sum of the mass " + sqrt( sq(system.getParticle(i).mass()/ 20) + sq(system.getParticle(j).mass()/ 20) ));
        
        if( system.getParticle(i).distanceTo(system.getParticle(j)) <  1.0){
          println("it is less than 1");
          if ( system.getParticle(i).mass() > system.getParticle(j).mass() ) {
            system.removeParticle(system.getParticle(j));
          } else {
            system.removeParticle(system.getParticle(i));
          }
        }
      }
    }
  }
}
*/

