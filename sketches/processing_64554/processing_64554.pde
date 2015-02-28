
color[] aumentaColores(color[] colores) {
  color[] auxiliar=new color[2*colores.length];
  for (int i=0; i<colores.length-1; i++) {
    auxiliar[2*i]=color(colores[i]);
    auxiliar[(2*i)+1]=mezclaColores(colores[i], colores[i+1]);
  }
  auxiliar[2*(colores.length-1)]=color(colores[colores.length-1]);
  auxiliar[2*colores.length-1]=mezclaColores(colores[colores.length-1], colores[0]);

  return auxiliar;
}

color[] reduceColores(color[] colores) {
  color[] auxiliar=new color[colores.length/2];
  for (int i=0; i<auxiliar.length; i++) {
    auxiliar[i]=color(colores[2*i]);
  }
  
  return auxiliar;
}

color mezclaColores(color color1, color color2) {
  int R1 = (color1 >> 16) & 0xFF;
  int G1 = (color1 >> 8) & 0xFF;
  int B1 = color1 & 0xFF;

  int R2 = (color2 >> 16) & 0xFF;
  int G2 = (color2 >> 8) & 0xFF;
  int B2 = color2 & 0xFF;

  int RF = ((R1==255 && R2==255)?255:(R1/2) + (R2/2));
  int GF = ((G1==255 && G2==255)?255:(G1/2) + (G2/2));
  int BF = ((B1==255 && B2==255)?255:(B1/2) + (B2/2));

  return color(RF, GF, BF);
}

void desordenaColores(color[] colores) {

  color auxiliar;
  int azar;

  for (int i=0; i<colores.length; i++) {
    auxiliar=color(colores[i]);
    azar= floor(random(i, colores.length));
    colores[i]=color(colores[azar]);
    colores[azar]=color(auxiliar);
  }
} 


