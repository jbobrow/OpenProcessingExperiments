
void setup () {
  size (alto,ancho); 
  background (#FFFFFF);
  smooth();
  strokeWeight(0.5); 

}
  
  int num_p = 100; // Numero de puntos
  int alto = 1000;
  int ancho = 600;
  
void draw () {  
  //dibujarLineas (100);
  Punto [] puntos = new Punto[num_p]; 
  noFill();
  for (int i = 0; i < puntos.length; i++) {
    puntos[i] = new Punto (random(10,990),random(10,590),(int)random(10,40));
    ellipse(puntos[i].x,puntos[i].y,puntos[i].r,puntos[i].r);
    point (puntos[i].x,puntos[i].y);
    println ("Punto N_"+i);
    println ("x_"+puntos[i].x+" y_"+puntos[i].y+" r_"+puntos[i].r);
  }

  for (int i = 0; i < puntos.length; i++) {
    int [] show_cant = cerca(5, i, 200.0, puntos);
    for (int j = 0; j < show_cant.length; j++){
      line(puntos[i].x,puntos[i].y, puntos[show_cant[j]].x,puntos[show_cant[j]].y);      
    }
  }

  /*
  int [] show_cant = cerca(5, 0, 200.0, puntos);
  for (int j = 0;  < show_cant.length; i++){
    println (show_cant[i]);
  }
  */
  noLoop();
}

void dibujarLineas (int espaciado) {
    for (int i = 0; i < ancho; i = i+espaciado) {
    line (0,i,alto,i);
  }
  for (int i = 0; i < alto; i = i+espaciado) {
    line (i,0,i,ancho);
  }
}

public class Punto {
  float x;
  float y;
  float r;
  Punto (float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;  
  }
}

public int [] cerca(int cant, int indice, float r_alc, Punto buscar []) {
  int cont = 0;
  int [] cantidad = new int [num_p];
   
  for (int i = 0; i < buscar.length; i++){
    if (buscar[indice].x != buscar[i].x && buscar[indice].y != buscar[i].y) {
      if (buscar[i].x < buscar[indice].x+r_alc && buscar[i].x > buscar[indice].x-r_alc && 
            buscar[i].y < buscar[indice].y+r_alc && buscar[i].y > buscar[indice].y-r_alc) {
              cantidad[cont++] = i;
              if (cont == cant){ break; }
              /***************************/
      }        
    } 
  }
  println ("cont_ "+cont);
  int [] re = new int [cont];
  for (int i = 0; i < cont; i++) {
    re[i] = cantidad[i];
  }
  return re;
}

void mouseReleased(){ 
  background(#FFFFFF);
  redraw();
}


