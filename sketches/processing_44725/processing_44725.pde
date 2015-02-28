
void anadirParticula() {
  VerletParticle2D p = new VerletParticle2D(Vec2D.randomVector().addSelf(width/2, height/2));
  fisica.addParticle(p);
  if(behavoirCount % 3 ==0)
    fisica.addBehavior(new AttractionBehavior(new Vec2D(random(100, width - 100), random(100, height -100)),
                                              50, 0.80, random(0.005, 0.008)));
}


void drawParticula() {
  for (int i = 0; i < fisica.particles.size(); i++) {
    VerletParticle2D p = ((VerletParticle2D)fisica.particles.get(i));
    if(started){
      fill(180, 40);
      ellipse(p.x, p.y, tam, tam);
    }
    else{
       fill(150, 50);
      ellipse(p.x, p.y, tam, tam);
    }
  }
}

void checaColision() {
  for (int i = 0; i < fisica.particles.size(); i++) {
    VerletParticle2D p = ((VerletParticle2D)fisica.particles.get(i));
    if (p.x > width - tam/2 || p.x < tam/2){
      anadirParticula();
      behavoirCount++;
      p.scaleVelocity(-1.2);
      break;
    }
    if (  p.y < tam/2 || p.y > height - tam/2){
      anadirParticula();
      p.scaleVelocity(-1.1);
      behavoirCount++;
      break;
    }
  }
}


