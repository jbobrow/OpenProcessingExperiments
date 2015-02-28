
import traer.physics.*;

PFont font;
ParticleSystem system;
Particle middle, repel;
Particle[] otherPlanets;
int numPlanets = 1;
float size = 52, newSize;

float mass0, mass1, mass2, mass3;

boolean loop, start= false;

void setup() {
  size(700, 600);
  frameRate(20);
  background(255);
  smooth();
  system = new ParticleSystem(10, 0.1);
  middle = system.makeParticle(500, width/2, height/2, 0);
  middle.makeFixed();
}   

void draw() {
  loop = true;
  system.tick(.9);
  background(0);
  if ( start == false) {
  startScreen();
  } else {
  ellipse(mouseX, mouseY, size, size);
 
  Particle mid = middle;
  mid.makeFixed();
  fill(237, 182, 0);
  ellipse(mid.position().x(), mid.position().y(), 100, 100);
  ///* comment out for now..will use later.
  for(int i = 1; i < system.numberOfParticles(); i++) {
    fill(44, 64, 157);
    Particle p = system.getParticle(i);
    //System.out.println(i);
    
    ellipse(p.position().x(), p.position().y(), p.mass() / 10, p.mass() / 10);
  }
  drawLegend();
  }
}

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

void drawLegend() {
  String msg = "Click [SPACE] to pause/resume";
  //float speed = sqrt( sq(system.getParticle(0).velocity().x()) +
  //          sq(system.getParticle(0).velocity().y()) );
  //msg += "\n" + speed + "fps";      
  fill(255, 255, 255);
  textSize(16);
  text(msg, 8, 20);
  textAlign(LEFT); 
}

void mousePressed() {
  addPlanet(mouseX, mouseY);
}

void addPlanet(float x, float y) {
  newSize = random(size);
  Particle p = system.makeParticle( newSize * 10, x, y, 0.0);
  p.makeFree();
  p. velocity().set(5, 5, 5);
  
  system.makeAttraction(middle, p, 80, p.mass()/2);
}

void startScreen() {
  if( start == false) {
    background(0);
    font = loadFont("36daysagoThickBRK-48.vlw");
    fill(0, 255, 219);
    textFont(font, 80);
    text("Revolutions", width/2, height/2 - 150);
    textFont(font, 20);
    text("...a SIMULATION", width/2, height/2 - 130);
    textAlign(CENTER);
    
    font = loadFont("36daysagoThickBRK-48.vlw");
    fill(164, 5, 173);
    textFont(font, 25);
    text("Left click to place planets", width/2, height/2);
    textAlign(CENTER);
    
    font = loadFont("36daysagoThickBRK-48.vlw");
    fill(255, 5, 5);
    textFont(font, 30);
    text("You ready? press [ENTER]", width/2, height/2  + 150);
    textAlign(CENTER);
  }
}

void keyPressed() {
  if( loop && key == ' ' && start == true) {
    noLoop();
  } else if ( key == ENTER && start == false) {
    start = true;
  } else {
    loop();
  }
  loop =! loop;
}

void clearAll() {
  system.clear(); 
}



