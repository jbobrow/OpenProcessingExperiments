
//cargamos imagen
PImage foto_original;
PImage foto_copia;
PImage foto_exposicion;

int[] histograma = new int[256];
int[] histogramar = new int[256];
int[] histogramag = new int[256];
int[] histogramab = new int[256];

int sw = 0;
int valmax = 0;

float tamx=0;
float tamy=0;

int tamIniWidth=500;
int tamIniHeight=300;

int imgWidth;
int imgHeight;
int imgx;
int imgy;

void setup(){
  frameRate(5); 
  background(0);
  noStroke();
  
  foto_original = loadImage("foto4.jpg");
  foto_copia = createImage(foto_original.width,foto_original.height, RGB);
  foto_exposicion = createImage(foto_original.width,foto_original.height, RGB);
  size(500,500);

    if(foto_original.width*tamIniHeight/foto_original.width < tamIniWidth){
      imgWidth=foto_original.width*tamIniHeight/foto_original.height; 
      imgHeight=tamIniHeight;
      imgx=0;
      imgy=0;
      size(max(256,imgWidth), imgHeight+110);
    }else{
      imgWidth=tamIniWidth;    
      imgHeight=foto_original.height*tamIniWidth/foto_original.width; 
      imgx=0;
      imgy=tamIniHeight/2;
      size(max(256,imgWidth), imgHeight+110);
    }

  crearcopias(foto_original,foto_copia,foto_exposicion);
  gethistogramas(foto_original,foto_copia,foto_exposicion);

  dibujarhistograma(histogramar,2);  //r
  dibujarhistograma(histogramag,3);  //g
  dibujarhistograma(histogramab,4);  //b  
  dibujarhistograma(histograma,1);

}
void draw(){
  if(sw==0){
       image(foto_original,imgx,imgy,imgWidth,imgHeight); 
    sw=1;
  }else{
      image(foto_exposicion,imgx,imgy,imgWidth,imgHeight); 

    sw=0;
  }

}

void crearcopias(PImage foto_original,PImage foto_copia,PImage foto_exposicion){
  //creamos la copia
  for (int i = 0; i < foto_original.width; i++)
    for (int j = 0; j < foto_original.height; j++) {
      color c_o = foto_original.get(i, j);
      color c_d = c_o;
      if(red(c_o) == 0 && green(c_o) == 0 && blue(c_o) == 0){
        foto_exposicion.set(i, j, color(0,0,255));
        foto_copia.set(i, j, c_d);   
      }else if(red(c_o) == 255 && green(c_o) == 255 && blue(c_o) == 255){
        foto_exposicion.set(i, j, color(255,0,0));
        foto_copia.set(i, j, c_d);   
      }else{
        foto_exposicion.set(i, j, c_d);  
        foto_copia.set(i, j, c_d);       
      }
  }
  foto_copia.filter(GRAY);
}


void gethistogramas(PImage foto_original,PImage foto_copia,PImage foto_exposicion){
  for (int i = 0; i < foto_original.width; i++)
    for (int j = 0; j < foto_original.height; j++) {
      color c_o = foto_original.get(i, j);
      color c_c = foto_copia.get(i, j);
      
      histograma[int(red(c_c))]++;
      histogramar[int(red(c_o))]++;
      histogramag[int(green(c_o))]++;
      histogramab[int(blue(c_o))]++;
  }
}
void dibujarhistograma(int histograma[], int canal){

  
  for(int i = 0; i < histograma.length; i++){
    if(histograma[i]>valmax){
      valmax=histograma[i];
    }
  }
  for(int i = 0; i < histograma.length; i++){
    
    switch(canal){
      case 1: stroke(255,255,255);
              break;
      case 2: stroke(255,0,0);
              break;
      case 3: stroke(0,255,0);
              break;
      case 4: stroke(0,0,255);
              break;              
    }
    line(i, height, i, height-map(histograma[i],0,valmax,0,100));
  }
  valmax=0;
}

