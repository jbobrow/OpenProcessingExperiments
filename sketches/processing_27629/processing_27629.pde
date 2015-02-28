
// fonction appelée automatiquement par notre instance 
// de controlP5 (objet userInterface)
void controlEvent(ControlEvent e){
  
  if(e.controller().id() == 1){
    distMinParticules = e.controller().value();
      //println(e.controller().value());
  }
  
    if(e.controller().id() == 2){
      
      
      nbParticules = (int)e.controller().value();
      //println(e.controller().value());
      
          particules = new Particule[nbParticules];
          for (int i=0;i<nbParticules;i++) {
            particules[i] = new Particule(random(width), random(height), random(80), vitesseParticules);
          }      
  }

  
      if(e.controller().id() == 3){

     println(e.controller().value());
     
     vitesseParticules = e.controller().value() /10;
     
          particules = new Particule[nbParticules];
          for (int i=0;i<nbParticules;i++) {
            particules[i] = new Particule(random(width), random(height), random(80), vitesseParticules);
          }      
     
        
       
      }
  
}

