
PImage fundo, carros, subtraido;
int i, j;

void setup () {
  size (1024, 768);
  fundo = loadImage ("teste19.png");
  carros = loadImage ("teste6.png");
  /// cria uma imagem que é a diferença da foto com carros pela foto vazia
    for (j = 0; j <1024; j ++) { //colunas
        for (i = 0; i <768; i++) { //linhas
            subtraido.pixels[j*width+i]= abs(red(carros.pixels[j*width+i]) - red(fundo.pixels[j*width+i])) + abs(green(carros.pixels[j*width+i]) - green(fundo.pixels[j*width+i])) + abs(blue(carros.pixels[j*width+i]) - blue(fundo.pixels[j*width+i]))/3;

        }
    }
  ///><><><>< transforma em uma foro preto e branco (lineariza) ><><><><><
    for (j = 0; j < 1024; j++) {
        for (i = 0; i < 768; i++) {
            if (subtraido.pixels[j*width+i]<= 11) {
                subtraido.pixels[j*width+i]= 0;
            }
            else {
                subtraido.pixels[j*width+i]= 255;
            }
        }
    }    
  
  //><><><>< aplica um filtro de mediana ><><><><
  
  for (j = 1; j < 1023; j++) {
            for (i = 1; i < 767; i++) {
                if ((subtraido.pixels[j*width+i] + subtraido.pixels[(j-1)*width+i] + subtraido.pixels[(j+1)*width+i] + resultado->dados[0][i-1][j-1]
                    + resultado->dados[0][i-1][j] + resultado->dados[0][i-1][j+1] + resultado->dados[0][i+1][j-1] + resultado->dados[0][i+1][j]
                    + resultado->dados[0][i+1][j+1]) >= 1275)
  
  carros.loadPixels();
  
  fundo.loadPixels();



  noLoop();
}
