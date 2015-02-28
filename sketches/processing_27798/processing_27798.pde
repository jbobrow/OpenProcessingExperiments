
import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import ddf.minim.*;
import ddf.minim.signals.*;

int NUM_PARTICLES = 3000;

VerletPhysics2D physics;
AttractionBehavior mouseAttractor;
Vec2D mousePos;

Minim minim;
AudioPlayer wavePress;
AudioSample wave1;
AudioSample wave2;
AudioSample wave3;

void setup() {
  size(500, 500, P3D);
  physics = new VerletPhysics2D();
  physics.setDrag(0.05f);
  physics.setWorldBounds(new Rect(0, 0, width, height));
  
  //setting up sounds
  minim = new Minim(this);
  wavePress = minim.loadFile("wavePress.mp3");
  wave1 = minim.loadSample("wave1.mp3");
  wave2 = minim.loadSample("wave2.mp3");
  wave3 = minim.loadSample("wave3.mp3");
  
}

//describing where particle is created

void addParticle() {
  VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().scale(10).addSelf(width/2, height/2));
  physics.addParticle(p);
}

void draw() {
  background(0);
  noStroke();
  colorMode(HSB);
  fill(255);
  
  //creating particles
  if (physics.particles.size() < NUM_PARTICLES) {
    addParticle();
  }
  physics.update();
  for (VerletParticle2D p : physics.particles) {
    fill(map(p.x, 0, width, 100, 200), 250, 200);
    ellipse(p.x, p.y, 5, 5);
  }  
 
}

//mouse interaction

void mousePressed() {
  mousePos = new Vec2D(mouseX, mouseY);
  mouseAttractor = new AttractionBehavior(mousePos, 250, 1.0f);
  physics.addBehavior(mouseAttractor);
 // wavePress.play();
 // wavePress.loop();
}

void mouseDragged(){
  mousePos.set(mouseX, mouseY);
   
}

void mouseReleased() {
  int third = width/3;
  physics.removeBehavior(mouseAttractor);
  wavePress.pause();
  if (mouseX <= third){
    wave1.trigger();
  } 
  else if (mouseX > third && mouseX < third*2){
    wave2.trigger();
  }
  else if (mouseX >= third*2){
    wave3.trigger();
  }

}

void stop() {
  wavePress.close();
  wave1.close();
  wave2.close();
  wave3.close();
  minim.stop();
  super.stop();
}

