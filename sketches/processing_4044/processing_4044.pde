
class Circulo { // La clase Circulo
  float x, y; 
  float diam, alph, strk;
  boolean on = false;
  color colores;

  void xy(float px, float py, color sombra) {
    x = px;
    y = py;
    on = true;
    diam = random(10, 70);
    strk = random(25);
    alph = diam*TWO_PI;
    colores = sombra;
  }
  
//cuando el diametro es menor o igual a 70, es decir el
//diametro de inicio de cuanquier circulo, este disminuye.
  void resize() { 
    if (on == true) {
      if (diam <= 70) {
       diam--;

      }else {
       on = false;
       }
      }
    } 
    
  //Los circulos se desplazzan hacia la esquina más cercana.  
  void move(){
   if (on == true){
     if (x <= width/2) {
      x--;
      }
     if (x > width/2) {
      x++;
      }
     if (y > height/2) {
      y++;
      }
     if (y < height/2) {
      y--;
      } 

    }
  }

//crea elipses
  void display() {
    rectMode(CENTER);
    noFill();
    stroke(c[colores], alph);
    strokeWeight(strk);
    ellipse(x, y, diam, diam);
  }
}


