

int colorR, colorG, colorB;
//--Descripción de la clase--//
class Pelota {
  //--propiedades de la pelota--//
  float x;
  float y;
  float incX;
  float incY;
  float diametro;
  int valorX, valorY;
  //--inicializar variables--//
  Pelota() {
    x=10;
    y=10;
    incX=1;
    incY=1;
    diametro=20;
    colorR=15;
    colorG=105;
    colorB=30;
  }
  void dibuja() {//--puede ser draw(), sólo le pertenece a la clase pelota--//
    fill(colorR, colorG, colorB);
    ellipse(x, y, diametro, diametro);
    stroke(colorR, colorG, colorB);
    fill(255);
    text(int(x), x+15, y-5);
    text(int(y), x+15, y+10);
    x=x+incX;
    y=y+incY;
    valorX=int(x);
    valorY=int(y);
    checarFronteras();
  }
  
  //--hace a la pelota rebotar--//  
  void checarFronteras() {
    if (x>mouseX-(diametro/2)||x<0 + (diametro/2)) {
      incX=incX*(-1);
    }
    if (y>mouseY-(diametro/2)||y<0 + (diametro/2)) {
      incY=incY*(-1);
    }
  }
}

//--Colores interactivos--//
void keyPressed() {
  if (key == CODED) {
    if (keyCode==LEFT) {
      colorR=255;
      colorG=0;
      colorB=0;
    }
    else if (keyCode==UP) {
      colorR=0;
      colorG=255;
      colorB=0;
    }
    else if (keyCode==RIGHT) {
      colorR=0;
      colorG=0;
      colorB=255;
    }
    else if (keyCode==DOWN) {
      colorR=255;
      colorG=255;
      colorB=0;
    }
  }
}
void mouseClicked() {

  colorR=255;
  colorG=255;
  colorB=255;
}


