


class SistemaParticulas{
  
  ArrayList<Particula> particulas;
  PVector origen;
  //CONSTRUCTOR
  SistemaParticulas(PVector origen1){
    origen = origen1.get();
    particulas = new ArrayList<Particula>();
  }
  
  void run(){
    for(int i=particulas.size()-1; i>=0; i--){
      //SE EJECUTA CADA PARTICULA DEL SISTEMA:
      Particula p = particulas.get(i);
      p.run();
      if(p.isDead()){
        particulas.remove(i);
      }
    }
  }
  
  void addParticle(){
    particulas.add(new Particula(origen));
  }
  
  
}




