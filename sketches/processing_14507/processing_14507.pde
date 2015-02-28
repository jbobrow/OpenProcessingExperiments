
//cargamos imagen
PImage foto_original;
float tamx=0;
float tamy=0;

void setup(){
  size(600, 300);
  background(0);
  
  centrar(loadImage("foto3.jpg"));
}

void centrar(PImage foto_original){
  
  if(foto_original.width*height/foto_original.width < width){
    tamx=foto_original.width*height/foto_original.height; 
    tamy=height;
     image(foto_original,(width-tamx)/2,0,tamx,tamy); 
  }else{
    tamx=width;    
    tamy=foto_original.height*width/foto_original.width; 
    image(foto_original,0,(height-tamy)/2,tamx,tamy); 
  }
  
}

