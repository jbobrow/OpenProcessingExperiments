
         float mx, my, nx, ny;
float[][] coords; 
void setup() {
  size(800, 450); 

  mx = 60; // margen horizontal
  my = 50; // margen vertical 
  nx = 20; // número de elementos en X
  ny = 20; // número de elementoa en Y

  // defino el # de coordenadas
  coords = new float[(int)(nx*ny)][2];
  
  float spx, spy, px, py;
  
  // calculo los espaciadores verticales y horizontales
  spx = (width - (-1 * mx))  / (nx-1);
  spy = (height - (-10 * my)) / (ny-1);

  // construyo todos los puntos
  for (int y = 0; y < ny; y++) {
    for (int x = 0; x < nx; x++) {
      coords[(int)((ny*y)+x)][0] = mx + (x * spx);
      coords[(int)((ny*y)+x)][1] = my + (y * spy);
    }
  }
  smooth();
  background(0,20,10,30);
}

void draw() {

  for (int i = 0; i < nx*ny; i++) {
    for (int j = 0; j < i; j++) {
      // calcula la distancia entre los puntos 'i' y 'j'
      float d = dist(coords[i][0], coords[i][1], coords[j][0], coords[j][1]); 
      // si la distancia es menor que ... 
      if (d < 40.9) {
        // dibuja la línea
        stroke(0); // Color línea
        line(coords[i][0], coords[i][1], coords[j][0], coords[j][1]);
      }
    }

    // cuando se mueven los puntos
    coords[i][0] += random(-7, 7);
    coords[i][1] += random(-1, 1);
    
    // dibuja los puntos
    ellipse(coords[i][0], coords[i][1], 1, 3);
  }

triangle(1, 1,  2, 2, 3, 3);
}

