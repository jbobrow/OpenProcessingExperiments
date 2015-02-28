
class Carrega {
  Particula carrega;                // Particula contenidora de Particules
  int nombreParticules;
  ArrayList particules;             // An arraylist for all the particles
  float forsa;                      // Força Explosiva
  int mecha;                        // Retard de l'explossió
  int vidaParticula;                // temps que es visible una partícula
  boolean haExplotat = false;       // Controla si la càrrega ja ha desplegat la resta de particules
  color colorCarrega;  // Color de la càrrega (totes les partícules son del mateix color)
  
  Carrega(PVector lPos, PVector lVel, PVector lAcc, int lMecha, int lNum, float lForsa, int lVidaParticula, color lColor){  // Constructor
    forsa = lForsa;
    nombreParticules = lNum;
    mecha = lMecha;
    vidaParticula = lVidaParticula;
    colorCarrega = lColor;
    carrega = new Particula(lPos, lVel, lAcc, vidaParticula, colorCarrega);
  }
  
  
  void run() {
    if(haExplotat){
      for (int i = particules.size()-1; i >= 0; i--) {
        Particula p = (Particula) particules.get(i);
        p.run();
        if (p.haMort()) {
          particules.remove(i);
        }
      }
    }else{
      mecha--;
      carrega.run();
      if(mecha == 0){            // Explota la càrrega
        haExplotat = true;
        float psi, theta;
        particules = new ArrayList();
        for (int n = 0; n < nombreParticules; n++) {                              // Add "num" amount of particles to the arraylist
          psi = random(0, 2*PI);  theta = random(0, 2*PI);
          float radi=forsa*random(0.5,1);
          particules.add(new Particula(carrega.pos.get(),  new PVector(radi*cos(psi)*cos(theta), radi*sin(psi), radi*cos(psi)*sin(theta)),  gravetat, vidaParticula, colorCarrega));
          //particules.add(new Particula(carrega.pos.get(), new PVector(forsa*cos(psi)*cos(theta), forsa*sin(psi), forsa*cos(psi)*sin(theta)), new PVector(0, gravetat, 0)));    
          //particules.add(new Particula(carrega.pos.get(), new PVector(random(-forsa,forsa),random(-forsa,forsa),random(-forsa,forsa)), new PVector(0, gravetat, 0)));    // Add "num" amount of particles to the arraylist
        }
      }
    }
  }
  
  
  boolean haMort(){
    return((haExplotat) ? particules.size()==0 : false);      
  }
  
}
  



