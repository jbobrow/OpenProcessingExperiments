
//array para los valores de las teclas y la posicion de los cuadrados y circulos
int[] tecla = new int [25];
int[] posicionx = new int [25];
int[] posiciony = new int [25];
//valor inicial corresponde a la letra a
int valInc = 97;
//valor inicial de la posicion del primer cuadrado
int x = 50;
int y = 50;
//-----------------------------------------------------
void setup()
{
 size(502, 502);
 background(0);
 rectMode(CENTER);
// lleno el array con el valor de las teclas segun codigo ascii 
 for(int i = 0; i < tecla.length; i++)
    {
     tecla[i] = valInc;
     valInc++;
    };
// voy llenando los array de posicion x e y segun las lineas
 for(int i = 0; i < posicionx.length; i++)
    {
     //primera linea
    if(i <=4)  
      {    
       posicionx[i] = x;
       posiciony[i] = y;
       x+=100;
       };       
     //segunda linea
    if(i >=5 && i <= 9)  
      { 
       x-=100;  
       posicionx[i] = x;
       posiciony[i] = y + 100;
       };    
     //tercera linea
    if(i >=10 && i <= 14)  
      {  
       posicionx[i] = x;
       posiciony[i] = y + 200;
       x+=100;
       }; 
    //cuarta linea
    if(i >=15 && i <= 19)  
      { 
       x-=100;  
       posicionx[i] = x;
       posiciony[i] = y + 300;
       };    
     //quinta linea
    if(i >=20 && i <= 24)  
      {  
       posicionx[i] = x;
       posiciony[i] = y + 400;
       x+=100;
       };        
    };
//---------------    
}
//----------------------------------------
void draw()
{
 strokeWeight(3);
 stroke(255);
//genero la cuadricula que queda de fondo
 for(x = 50; x <width; x+=100)
    {
      for(y = 50; y <height; y+=100)
         {    
          fill(0); 
          rect(x, y, 100, 100);
          fill(128);
          rect(x, y, 75, 75);
          fill(255);
          rect(x, y, 50, 50);
          };
     };
//-----------------------------------------
/*este for evalua si la tecla presionada corresponde con alguno de
los valores del array tecla, y si es asi, le asigna la posicion correspondiente
al cuadrado y a los circulos
*/
for(int a = 0; a < tecla.length; a++)
{
  if(key == tecla[a])
    { 
      stroke(0);    
     fill(posicionx[a]-key, posiciony[a]-key, key);             
                for(int b = posicionx[a]-width; b <width; b+=100)
                    { 
                     rect(b, posiciony[a], 54, 54);
                     rect(posicionx[a], b, 54, 54);
                    };               
     rect(posicionx[a], posiciony[a], 100, 100); 
     rect(posicionx[a], posiciony[a], 75, 75); 
     rect(posicionx[a], posiciony[a], 50, 50); 
     };
};
//-----------------------------------------
}

