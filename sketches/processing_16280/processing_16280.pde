
ParticleEngine engine;
Particle p1, p2,p3,p4,p5;
PFont font;

void setup(){
  size(800,600);
  smooth();
  font = createFont("Arial",11,true);
  textFont(font);
  engine = new ParticleEngine();
  p1 = new Particle("Me",width/2, height/2, random(-5,5), random(-5,5));
  p2 = new Particle("Kyra",width/3, height/3, random(-5,5), random(-5,5));
  p3 = new Particle("Robbin",width/3, height/3, random(-5,5),random(-5,5));
  p4 = new Particle("Rik",width/3, height/3, random(-5,5), random(-5,5));
  p5 = new Particle("Thomas",width/3, height/3, random(-5,5), random(-5,5));
  //p1.pin(200, 200);
  engine.addParticle(p1);
  engine.addParticle(p2);
  engine.addParticle(p3);
  engine.addParticle(p4);
  engine.addParticle(p5);
  engine.createSpring(p1, p2, 100, 0.6);
  engine.createSpring(p1, p3, 100, 0.1);
  engine.createSpring(p1, p4, 100, 0.3);
  engine.createSpring(p1, p5, 100, 0.5);
}

void draw(){
  background(0);
  engine.update();
  engine.draw();
}

void mousePressed() {
  Particle p = engine.particleAt(mouseX, mouseY);
  if(p != null) {
    p.dragged = true;
  }
    

}

void mouseReleased() {
  Particle p = engine.particleAt(mouseX, mouseY);
  if(p != null && p.dragged) {
    p.dragged = false;
  }
}

