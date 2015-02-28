
//----------------------
// by lali barriere 2012
//----------------------

// inicialitzacio de la linia d'entrada
void  inicialitzaEntrada() {

  textFont(entrada);
  posText = new PVector(LIN_ENT_X, height - LIN_ENT_Y);
  posRect = new PVector(0, height - RECT_H);
  rectSize = new PVector(width, RECT_H);

  posBoto[0] =new PVector(width - 4*BOTO_SIZE, posRect.y + (rectSize.y-BOTO_SIZE)/2);
  colBoto1[0] = color(0, 0, 255);
  colBoto2[0] = color(0, 255, 100);

  posBoto[1] =new PVector(width - 2*BOTO_SIZE, posRect.y +  (rectSize.y-BOTO_SIZE)/2);
  colBoto1[1] = color(255,150,0);
  colBoto2[1] = color(255, 0, 0);
}

// dibuixa el rectangle amb l'entrada de dades
void dibuixaEntrada() {
  textFont(entrada);
  textAlign(LEFT);

  // perque l'animacio no trepitgi la linia d'entrada de text
  noFill();
  noStroke();
  fill(240);
  rect(posRect.x, posRect.y, rectSize.x, rectSize.y);

  // perque pinti el cursor pampallugejant
  if (frameCount % 50 < 25) {
    pCursor = "_";
  }
  else {
    pCursor = "";
  }
  fill(255, 0, 0);
  text(nouText+pCursor, posText.x, posText.y);

  // els botons
  if(!animacio){
  fill(colBoto1[0]);
  }
  else{
  fill(colBoto2[0]);
  }
  rect(posBoto[0].x, posBoto[0].y, BOTO_SIZE,BOTO_SIZE);
  if(reset>0)
  {
  fill(colBoto1[1]);
    reset--;
  }
  else{
  fill(colBoto2[1]);
  }
  rect(posBoto[1].x, posBoto[1].y, BOTO_SIZE, BOTO_SIZE);
}



