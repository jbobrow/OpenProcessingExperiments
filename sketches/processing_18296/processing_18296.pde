
class grass {
  int raizX, raizY, raizZ;
  int puntaX, puntaY, puntaZ;
  float altura;

  int curva;
  
  int max_flores = 30;
  

  grass(int x, int y, int z) {
    raizX = x;
    raizY = y;
    raizZ = z;


    altura = random(10, 200);
    tonalidadDeVerde = int(random(128, 255));
    curva = int(random(-10, 10));

    if (altura > 198 && numero_flores < max_flores) {
      altura = (altura % 150) + 80;
      tieneFlor = true;
      numero_flores++;
    } else {
      altura = (altura % 40);
    }
  } 

  int tonalidadDeVerde;

  int impactoViento = 0;

  void update(int vientoAhora) {
    
    if (crezed)
      altura += 0.5;
    
    if (tieneFlor)
    impactoViento = int( vientoAhora * (altura * 0.0001));
    else
    impactoViento = int( vientoAhora * (altura * 0.0005));    
    
    puntaX = raizX + curva + impactoViento;
    puntaY = raizY - int(altura);
    puntaZ = raizZ;
  }

  boolean tieneFlor = false;


  void render() {
    
  
    noFill();
    stroke(0, tonalidadDeVerde, 0);
    if (tieneFlor) {
      strokeWeight(4);
      if (dark)
      stroke(tonalidadDeVerde, 0, tonalidadDeVerde);
      puntaX = raizX + impactoViento;
    } else {
      strokeWeight(2);
    }
      
    bezier(raizX, raizY, raizZ,raizX, raizY - (altura*.25), raizZ, raizX, puntaY, puntaZ, puntaX, puntaY, puntaZ);
    
//    bezier(raizX, raizY, raizZ,,puntaX, puntaY, puntaZ); 
  }
  
  void renderFlores() {
    
    if (tieneFlor) {
      dibujaFlor(puntaX, puntaY, puntaZ);
      
    }
    
  }
  
  void dibujaFlor(int x, int y, int z) {

    fill(255, 255, 255, 128);

    pushMatrix();
    translate(x, y, z);
    sphere(4); 
    popMatrix();
  }
}



