
PImage foto;           //tipo de dato imagen
int coorx,coory;
void setup()
{
  foto = loadImage("lena.jpg"); //cargamos la imagen en foto
  size(400,400);
  coorx=-400;  // izquierda a derecha
  //coorx=400; // derecha a izquierda    
  coory=-400;  // arriba - abajo
  //coory=400; // abajo - arriba
}
void draw()
{
  background(0);
  image(foto,coorx,coory);//mostramos la imagen en coorx, coory
    
  if(coorx<0)
     coorx++;  // izquierda a derecha

  //if(coorx>0)
    //  coorx--; // derecha a izquierda
  
  if(coory<0)
    coory++;  //arriba - abajo   
  
  //if(coory>0) 
  //    coory--;  //abajo  - arriba
}


