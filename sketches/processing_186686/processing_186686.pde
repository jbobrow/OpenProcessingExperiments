
///////////////////////VARIABLES//////////////////////////
float alturaFrontal; 
float ampladaFrontal;
float alturaLateral;
float ampladaLateral;
float alturaSuperior;
float ampladaSuperior;



/////////////////////////SETUP////////////////////////////

void setup () {
  size (840, 840);
  strokeWeight (1);
  fill (255);
  alturaFrontal = 10; 
  ampladaFrontal = 10;
  alturaLateral = 10;
  ampladaLateral = 10;
  alturaSuperior = 10;
  ampladaSuperior = 10;
} //Tanca setup

/////////////////////////DRAW/////////////////////////////

void draw () {
  background (0);

  //Prova quadrats 
  /*
  quadratFrontal (300, 400);
   quadratLateral (300+10, 400+10);
   quadratSuperior (300, 400);
   */

 

  fill(50);
  fixaFrontal ();
  fill (225);
  caraFrontal (240, 0);
  fill(100);
  fixaLateral ();
  fill(175);
  caraLateral (width, 0+alturaLateral);
  fill(150);
  fixaSuperior ();
  fill(200) ;
  caraSuperior (240, 0);
} //Tanca draw
////////////////////FUNCIONS SISTEMA///////////////////////


////////////////////FUNCIONS PROPIES///////////////////////

/////////////////////////DIBUIX////////////////////////////

void quadratFrontal (float x, float y) {
  //fill (map (minute(), 0, 59, 25, 240));
  rect (x, y, alturaFrontal, ampladaFrontal);
} //tanca void quadratFrontal

void quadratFrontalSencer (float x, float y) {
  for (int j=0; j<60; j++) {
    for (int i=0; i<60; i++) {
      quadratFrontal (x+j*ampladaFrontal, y+i*alturaFrontal);
    }
  }
}
void fixaFrontal () {
  for (int i=0; i<24; i++) {
    if (i<hour()) {
      quadratFrontalSencer (240-ampladaFrontal*i, 0+alturaFrontal*i);
    }
  }
}//Tanca void fixaFrontal






void quadratLateral (float x, float y) {
  //fill (map (minute(), 0, 59, 25, 240));
  quad (x, y, 
  x, y-alturaLateral, 
  x+ampladaLateral, y-alturaLateral*2, 
  x+ampladaLateral, y-alturaLateral);
} //tanca void quadratLateral

void lineaLateralVertical (float x, float y) {
  for (int i=0; i<61; i++) {
    quadratLateral (x, y+i*alturaLateral);
  }
}
void fixaLateral () {
  for (int i=0; i<24; i++) {
    if (i<hour()) {
      lineaLateralVertical (width-ampladaLateral*i, 0+alturaLateral*i);
    }
  }
}






void quadratSuperior (float x, float y) {
  //fill (map (minute(), 0, 59, 25, 240));
  quad (x, y, 
  x+ampladaSuperior, y-alturaSuperior, 
  x+ampladaSuperior*2, y-alturaSuperior, 
  x+ampladaSuperior, y);
} //tanca void quadratSuperior

void lineaSuperiorHoritzontal(float x, float y) {
  for (int i=-1; i<59; i++) {
    quadratSuperior (x+i*ampladaSuperior, y+alturaSuperior);
  }
}
void fixaSuperior () {
  for (int i=0; i<24; i++) {
    if (i<hour()) {
      lineaSuperiorHoritzontal (240-ampladaLateral*i, 0+alturaLateral*i);
    }
  }
}




//////////////////////////Fer cares Frontal///////////////

void caraFrontal (float x, float y) {
  for (int k=0; k<24; k++) {
    if (k<hour()) {
      x=x-ampladaLateral;
      y=y+alturaSuperior;
    } //Tanca "if" hores
    for (int j=0; j<60; j++) {

      for (int i=0; i<60; i++) {

        if (j==minute() && i <second()) { //El segon que avança
          quadratFrontal (x+(i*ampladaFrontal), y + (j*alturaFrontal));
        } //Tanca "if" de segons que avancen

        if (j < minute()) { //Els minuts ja dibuixats
          quadratFrontal (x+(i*ampladaFrontal), y + (j*alturaFrontal));
          if (i < second()) {
            quadratFrontal (x+(i*ampladaFrontal), y + (j*alturaFrontal));
          } //Tanca 1er "if" de "i"
        } //Tanca "if" de "j"
      } //Tanca bucle for de "i"
    } //Tanca bucle for de "j"
  }//Tanca bucle for de "k"
} //Tanca void caraFrontal

//////////////////////Fer cares Laterals/////////////////////////

void caraLateral (float x, float y) {
  for (int l=0; l<24; l++) {
    if (l<hour()) {
      x=x-ampladaLateral;
      y=y+alturaLateral;
    } //Tanca "if" hores
    for (int k=0; k<24; k++) {
      for (int j=0; j<60; j++) {
        if (k==hour() && j <minute()) {
          quadratLateral (x, y+j*ampladaLateral);
        }
      }//Tanca bucle for de "j"
    }//Tanca bucle for de "k"
  }//Tanca bucle for de "l"
} //Tanca void caraFrontal

/////////////////////////Fer cares Superiors/////////////////////

void caraSuperior (float x, float y) {
  for (int l=0; l<24; l++) {
    if (l<hour()) {
      x=x-ampladaSuperior;
      y=y+alturaSuperior;
    } //Tanca "if" hores
    for (int k=0; k<60; k++) {
      for (int j=0; j<24; j++) {
        if (k<second() && j==hour() && minute()==0) {

          quadratSuperior (x+k*alturaSuperior, y);
        }
      }//Tanca bucle for de "j"
    }//Tanca bucle for de "k"
  }//Tanca bucle for de "l"
} //Tanca void caraFrontal

///////////////////////Funcions per fixar els quadrats//////////////


