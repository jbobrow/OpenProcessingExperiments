
void setup()
{
size(400, 400);
strokeWeight(2);//ancho del trazo
noFill();
rectMode(CENTER);
colorMode(HSB);
background(0);
}
//--------------------------------
int col = 0;//variable color
float x = 0;//variable posicion
float y = 0;
int cant = 20;//variable que determina la cantidad de lugares del array
float [] circulosx = new float[cant];
float [] circulosy = new float[cant];
//------------------------------------------
 void draw() 
{
  col = (col+1) % 256;//para que el color vaya cambiando
//-----------------------------------------------   
/* lleno los lugares del array con lo que despues voy a usar como posicion de 
cuadrados y circulos*/ 
  for (int i = 0; i < circulosx.length; i++) 
      {  
        x+=0.5;// para que vaya incrementando de a poco
        y+=0.5;
        circulosx[i] = (x*i)/cant;
        circulosy[i] = (y*i)/cant;
      };
//----------------------------------------------- 
/*hasta que el ultimo cuadrado llegue a la esquina opuesta
entonces vuelve a empezar*/
if(x >= width * 22)
{
x = 0; 
y = 0;
};
//----------------------------------------------- 
//for anidados para que repita en los dos ejes
  for (int a = 1; a < circulosx.length; a++) 
      { 
       for (int b = 1; b < circulosx.length; b++) 
           {
/* tanton los cuadrados como los circulos, el primero es el que tomo como referencia para luego
determinar la posicion de los otros 3. Uno se mueve en paralelo al eje X, otro en paralelo
al eje Y, y el otro en sentido contrario al primero.*/
            stroke(col, 255, 255);
            rect(circulosx[a], circulosy[b], circulosx[a]/6,  circulosx[b]/6);
            rect(width - circulosx[a], circulosy[b], circulosx[a]/6,  circulosx[b]/6); 
            rect(circulosx[a], height - circulosy[b], circulosx[a]/6,  circulosx[b]/6);   
            rect(width - circulosx[a], height - circulosy[b], circulosx[a]/6,  circulosx[b]/6);
  //--------------           
            stroke(255, col, 255);
            ellipse(circulosx[a], circulosy[b],circulosx[a]/12,  circulosx[b]/12);
            ellipse(width - circulosx[a], circulosy[b], circulosx[a]/12,  circulosx[b]/12); 
            ellipse(circulosx[a], height - circulosy[b], circulosx[a]/12,  circulosx[b]/12);   
            ellipse(width - circulosx[a], height - circulosy[b], circulosx[a]/12,  circulosx[b]/12);
           };
      };    
//-------------------------------
//rectangulo para que genere transparencia a medida que se generan las formas
 fill(0, 5);
 rect(0, 0, width*2, height*2);
//------------------------------------------ 
}
  

