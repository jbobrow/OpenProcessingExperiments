
int[] pixelesCopia;
PImage imagenACopiar;
boolean[] rojosAcertados;
boolean[] verdesAcertados;
boolean[] azulesAcertados;
int totalAcertados;
double tiempoIni;

void setup() {
  imagenACopiar =  loadImage("mona_lisa.jpg");
  imagenACopiar.loadPixels();
  size(337, 500);
  pixelesCopia = new int[width*height];
  rojosAcertados = new boolean[width*height];
  verdesAcertados = new boolean[width*height];
  azulesAcertados = new boolean[width*height];
  totalAcertados = 0;
  tiempoIni = System.currentTimeMillis();
  
}

void draw() {
  
    for(int i = 0; i < pixelesCopia.length; i++) {
      int rojo = (int) (Math.random() * 256);
      if(!rojosAcertados[i]) {
        pixelesCopia[i] = color(rojo, 0, 0);
      }
      if(rojosAcertados[i] && !verdesAcertados[i]) {
        int verde = (int) (Math.random() * 256);
        color pixelActual = pixelesCopia[i];
        int rojoActual = (pixelActual >> 16) & 0xFF;
        pixelesCopia[i] = color(rojoActual, verde, 0);
      }
      if(rojosAcertados[i] && verdesAcertados[i] && !azulesAcertados[i]) {
        
        int azul = (int) (Math.random() * 256);
        color pixelActual = pixelesCopia[i];
        int rojoActual = (pixelActual >> 16) & 0xFF;
        int verdeActual = (pixelActual >> 8) & 0xFF;
        pixelesCopia[i] = color(rojoActual, verdeActual, azul);
      }
           
      color colorImagen = imagenACopiar.pixels[i];
      color colorActual = pixelesCopia[i];
      int rojoImg = (colorImagen >> 16) & 0xFF;
      int rojoAct = (colorActual >> 16) & 0xFF;
      int verdeImg = (colorImagen >> 8) & 0xFF;
      int verdeAct = (colorActual >> 8) & 0xFF;
      int azulImg = colorImagen & 0xFF;
      int azulAct = colorActual & 0xFF;
      
      if(rojoImg == rojoAct) {
        rojosAcertados[i] = true;
      }
      if(verdeImg == verdeAct) {
        verdesAcertados[i] = true;
      }
      if(azulImg == azulAct) {
        azulesAcertados[i] = true;
      }
      if(rojoImg == rojoAct && verdeImg == verdeAct && azulImg == azulAct) {
        totalAcertados++;  
      }
      
    }
    
    println(totalAcertados);  
    
    loadPixels();
    for(int i = 0; i < pixelesCopia.length; i++) {
      pixels[i] = pixelesCopia[i];
    }
    updatePixels();
}

