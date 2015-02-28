
class Tira {

  Particle particulas[];
  Spring springs[];
  float contador;

  Tira (float x, float y, ParticleSystem sistema) {

    int numParticulas = (int)random (10,20);
    particulas = new Particle[numParticulas];

    for(int i=0; i<numParticulas;i++) {

      particulas[i] = new Particle(x,y, random (50,100));
      particulas[i].setDrag(0.96);
        sistema.add(particulas[i]);
    }
    springs  = new Spring [numParticulas-1];
    for (int i = 0; i<numParticulas-1;i++) {

      springs[i] = new Spring (particulas[i],particulas[i+1],20);

      sistema.add(springs[i]);
    }
  }

  void mover() {

    float forcaX = random(-2,2);
    float forcaY = random(-2,2);
    particulas [0].applyForce( forcaX, forcaY);

    contador +=0.01;
    float noiseX = particulas[0].getX() /1000;
    float noiseY = particulas[0].getY() /1000;
    float angulo = ( noise( noiseX,noiseY, contador) - 0.5) * 2 * TWO_PI;
    forcaX = cos (angulo)*1;
    forcaY = sin(angulo)*1;

    particulas[0].applyForce(forcaX, forcaY);

    float centroX = width /2;
    float centroY = height /2;
    particulas[0].applyElasticForce(centroX, centroY,  0.003);
  }

  void desenhar() {
    
    for (int i = 0; i < particulas.length;i++){
      float tamanho = 50 / (i+1);
    
    image(imagem, particulas[i].getX(), particulas[i].getY(), tamanho, tamanho);
    }  

}
}


