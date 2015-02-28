
class Boton{
  float diametro;
  int col;
  float x;
  float y;
  float angulo;

  float diametroObj;
  int colObj;
  float xObj;
  float yObj;
  float anguloObj;
  
  Boton(float _x, float _y, int _col){
    x = _x;
    xObj = _x;
    y = _y;
    yObj = _y;  
    diametro = 50;
    diametroObj = diametro;
    col = _col;
    colObj = _col;
  }
  
  void actualizate(){
    diametro = lerp(diametro, diametroObj, 0.2);
    x = lerp(x, xObj, 0.2);
    y = lerp(y, yObj, 0.2);
    angulo = lerp(angulo, anguloObj, 0.2);
    col = lerpColor(col, colObj, 0.6);
  }
  
  void dibujate(){
    fill(col);
    stroke(0);
    strokeWeight(4);

    pushMatrix();
    translate(x, y);
    rotate(angulo);

    ellipse(0, 0, diametro, diametro);
    line(0, 0, diametro/2, 0);
    popMatrix();
  }
}

