
class Artista {
  float aqui, ahora;
  float trial, improvisation, experiment, error; 
  float Qmr, banana, josueEber, jme, monty;
  float simonkey, performancero, inari, wimpy, moonchild; 
  float dreamsIncarnate, action, intuition, change, mass; 
  float colony;
  float order;
  
  Artista () {
    this.aqui = random (width);
    this.ahora = random (height);
    this.trial = random (0.00534, 0.00539);
    this.improvisation = random (0.00123, 0.00128);
    this.simonkey = random(0.000718, 0.00072);
    this.performancero = random(0.000777, 0.0008);
    this.inari = random(0.000555, 0.000576);
    this.wimpy = random(0.000330, 0.000337);
    this.moonchild =  random(0.000999, 0.00103);
  }
  
float getAqui(){
 return aqui; 
}

float getAhora(){
 return ahora; 
}
    
  void spontaneousOrder () {
    soyHumano ();
    soyArtista ();
    
  }

  void soyHumano () {
    stroke (0, inseguridad);
    fill (255, 50);
    ellipse (aqui, ahora, Qmr+29, Qmr+29);
    fill(210, envidia, 0);
    ellipse (aqui, ahora, Qmr, Qmr);
    fill (255, 150);
    ellipse (aqui, ahora, banana+19, banana+19);
    fill(210, envidia, 0);
    ellipse (aqui, ahora, banana, banana);
    fill (255, 200);
    ellipse (aqui, ahora, josueEber+13, josueEber+13);
    fill(210, envidia, 0);
    ellipse (aqui, ahora, josueEber, josueEber);
    fill (255, 225);
    ellipse (aqui, ahora, jme+7, jme+7);
    fill(210, envidia, 0);
    ellipse (aqui, ahora, jme, jme);
    fill (255);
    ellipse (aqui, ahora, monty+3, monty+3);
    fill(210, envidia, 0);
    ellipse (aqui, ahora, monty, monty);
  }

  void soyArtista () {
    aqui = noise (experiment)*width;
    experiment += trial+caos;
    ahora = noise (error) *height;
    error += improvisation+caos;
    Qmr = noise (dreamsIncarnate)*ego+58;
    dreamsIncarnate += simonkey; 
    banana = noise (action)*ego+38;
    action += performancero; 
    josueEber = noise (intuition)*ego+26;
    intuition += inari; 
    jme = noise (change)*ego+14;
    change += wimpy; 
    monty = noise (mass)*ego+6;
    mass += moonchild;
  }  
  

}


