

class Firework { //classe per la creazione e gestione dei fuochi d'artificio

  int life = 360; //parametro per il tempo di attività del fuoco
  color col;
  PVector pos = new PVector (0,0,0);
  Particle particles[];  //array che contiene tutte le particelle di un fuoco

  Firework (PVector p, int type, color c1, color c2) {  //costruttore

    pos.set(p);    //centro dell'esplosione

    if ( type == 1 ) {      //fuoco classico
      particles = new Particle[350];
      for (int i=0; i<particles.length; i++) {
        if ( (i % 2) == 0 )
          col = c1;
        else
          col = c2;
        particles[i] = new Particle(pos, random(-5, 5), random(-8, 1), 1, col);
      }
    }
    if ( type == 2 ) {     //fuoco a girandola
      particles = new Particle[50];
      for (int i=0; i<(particles.length); i++){
      if ( (i % 2) == 0 )
          col = c1;
        else
          col = c2;
        particles[i] = new WheelParticle(pos, random(-3, 3), random(-5, 1), 1.5, col);
      }
    }
    if ( type == 3 ) {    //fuoco cosmo
      CosmoFirework(pos, c1, c2);
    }
  }

  void display() {    //fuonzione per la visualizzazione del fuoco sullo schermo
    life = life-5;    //decremento il contatore vita
    for  (int i=0; i<particles.length; i++)
    {
      particles[i].update();
      particles[i].display(life);
    }
  }

  boolean terminated () {  //funzione che verifica se il fuoco è ancora attivo
    return life <=0;
  }

  void CosmoFirework (PVector pos, color c1, color c2) {  //funzione per la creazione dei fuochi di tipo 3
    float angle = 0.0;
    float inc = TWO_PI/200.0;
    float a = random(2, 7);
    float b = random(2, 7);
    float c = random(2, 7);
    particles = new Particle[65];
    for (int i=0; i<particles.length; i++) {
      angle = (angle + inc);
      if ( (i % 2) == 0 )
          col = c1;
        else
          col = c2;
      particles[i] = new Particle(pos, (a*cos(angle * b))*0.5, (a*sin(angle * c))*0.5, 1.5, col);
    }
  }
}


