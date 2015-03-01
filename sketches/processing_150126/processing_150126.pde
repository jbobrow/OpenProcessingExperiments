

  
/****************************************************
 *
 *  en la variante 10 print el azar
 *  se toma de la imagen fuente.
 *
 * <li>  movimiento del mouse para máximo azar
 * <br>    muestreo de los bits - significativos
 *
 * <li>  movimiento del mouse para mínimo azar
 * <br>    muestreo de los bits + significativos 
 *
 * <li>  presionar cualq tecla p cambiar la resolución 
 *
 ****************************************************/
  
 // 10 PRINT CHR$(205.5+RND(1)); : GOTO 10 - nota
 // 20 REM Inspired by http://10print.org/
 // 30 REM Image: my portrait: Yo soy Ellos. Ellos son yo. octubre - diciembre 2013
  
PImage img, sample;
int res, n, d;
 
// list of resolutions
int[] rlist = { 25, 50,  20, 10, 20 };
 
   
void setup() {
   
  size(800, 800);
  img = loadImage("body.png");
  nextRes();
 
}
 
 
void nextRes() {
   
  // resample the image
  res = (res + 1) % rlist.length;
  n = rlist[res];
  sample = img.get();
  sample.resize(n, n);
  d = width/n;
   
}
 
 
void draw() {
   
  int m = constrain(130 * mouseX / width, 1, 129);
 
  loadPixels();
  
  // iterate over all blocks
  for(int x = 0; x < n; x++) {
    for(int y = 0; y < n; y++) {
       
      // sample pixel brightness
      float val = 256 - (sample.pixels[y*n+x] & 255);
       
      // iterate over all pixels of a block
      for(int dx = 0; dx < d; dx++) {
        for(int dy = 0; dy < d; dy++) {
           
          // get diagonal coordinate
          int z = val % (2*m) < m ? (dx+dy+1) * 255 / d : (dx+d-dy) * 255 / d;
                    
          // black and white dithering
          pixels[ (y*d + dy) * width + (x*d + dx) ] = val > 2 * abs(z - 133) + 1 ? #000000 : #ffffff;
           
        }
      }
       
    }
  }
     
  updatePixels();
   
}
 
 
void keyPressed() {
  nextRes();
}


//*/ inspirado en el código para "portrat1" y la serie "yo soy ellos. ellos son yo."



