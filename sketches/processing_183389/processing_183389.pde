

//Declaració

float posicioX;
float posicioY;
float velocitatX;
float velocitatY;
float mida;


void setup () {
  size (800, 400);
  posicioX = 0;
  posicioY = 0;
  velocitatX = random (20, 30);
  velocitatY = random (20, 30);
  mida = 30;
}


void draw () {
  background (0);
  //dibuix peix 
  fill (250, 152, 53);
  noStroke ();
  //Cos peix
  ellipse (posicioX, posicioY, mida*4, mida*4);
  // Cua
  ellipse (posicioX+mida*2.5, posicioY-15, mida*1.5, mida*1.5);
  ellipse (posicioX+mida*2.5, posicioY+15, mida*1.5, mida*1.5);
  //ulls
  fill (255);
  ellipse (posicioX+mida/1.5, posicioY-mida, mida, mida);
  ellipse (posicioX-mida/1.5, posicioY-mida, mida, mida);
  fill (0);
  ellipse (posicioX-mida/1.5, posicioY-mida, mida/2, mida/2);
  ellipse (posicioX+mida/1.5, posicioY-mida, mida/2, mida/2);

  //dades moviment peix
  posicioX = posicioX + velocitatX;
  posicioY = posicioY + velocitatY;

  // moviment peix
  if (posicioX > width || posicioX < 0) {
    velocitatX = -velocitatX;
  }
  if (posicioY > height || posicioY < 0) {
    velocitatY = -velocitatY;
  }
}

void mousePressed () {
  velocitatX = 0;
  velocitatY = 0;
  posicioX = pmouseX;
  posicioY = pmouseY;
  mouseReleased ();
  
}

