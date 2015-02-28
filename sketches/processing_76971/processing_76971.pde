
PImage foto;           //TIPO DE IMAGEN
int coorx,coory;
void setup()
{
  foto = loadImage("lena.jpg"); //CARGAMOS LA IMAGEN
  size(300,300);
  coorx=-400;  // izquierda a derecha
  //coorx=400; // derecha a izquierda   
  coory=-400;  // arriba - abajo
  //coory=400; // abajo - arriba
}
void draw()
{
  background(0);
  image(foto,coorx,coory);//MOSTRAMOS LA IMAGEN
     
  if(coorx<0)
     coorx++;  // izquierda a derecha
 
  //if(coorx>0)
    //  coorx--; // derecha a izquierda
   
  if(coory<0)
    coory++;  //arriba - abajo  
   
  //if(coory>0)
  //    coory--;  //abajo  - arriba
}

