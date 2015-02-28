
         
                float mx, my, nx, ny;
float[][] coords; 
void setup() {
  size(800, 500); 

  mx =20; // margen horizontal
  my = 50; // margen vertical 
  nx =20; // número de elementos en X
  ny = 20; // número de elementoa en Y

  // defino el # de coordenadas
  coords = new float[(int)(nx*ny)][3];
  
  float spx, spy, px, py;
  
  // calculo los espaciadores verticales y horizontales
  spy = (height - (2 * my)) / (ny-1);
spx = (width - (1.5 * mx))  / (nx-4);
  

  // construyo todos los puntos
  for (int y = 0; y < ny; y++) {
    for (int x = 0; x < nx; x++) {
      coords[(int)((ny*y)+x)][0] = mx + (x * spx);
      coords[(int)((ny*y)+x)][1] = my + (y * spy);
    }
  }
  smooth();
  background(#12323B);
}

void draw() {

  for (int i = 0; i < nx*ny; i++) {
    for (int j = 0; j < i; j++) {
      // calcula la distancia entre los puntos 'i' y 'j'
      float d = dist(coords[i][0], coords[i][1], coords[j][0], coords[j][1]); 
      // si la distancia es menor que ... 
      if (d < 80) {
        // dibuja la línea
        stroke(#230BD3);
        line(coords[i][0], coords[i][1], coords[j][0], coords[j][1]);
      }
    }

    // mueve un poco los puntos
    coords[i][0] += random(-1, 2);
    coords[i][1] += random(-1, 1);
    
    // dibuja los puntos
    ellipse(coords[i][0], coords[i][1], 7, 3);
  }

  // dibujo un velo blanco para que se dibuje la estela
  noStroke();
  fill(15, 4);
 
 rect(0, 380, width, height);



}

