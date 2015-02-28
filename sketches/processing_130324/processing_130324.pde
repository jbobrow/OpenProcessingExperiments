
//size of the squares for the color palette
int rectSize = 10;
void setup(){
  size(600,600);
  fill(255);
  //define la paletta de colores HSB y los m'aximos
  colorMode(HSB,width/rectSize,height/rectSize,255);

}

void draw(){
  background(0);
  smooth();
  for(int i = 0; i < width/rectSize ; i++){
   for(int j = 0; j < height/rectSize; j++){
     noStroke();
     fill(i,j,255);
     //dibuja cuadrados del tamano definido
     rect(i*rectSize,j*rectSize,rectSize,rectSize);
   }
  }
}

