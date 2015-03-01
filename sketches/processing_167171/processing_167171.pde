
//INFO PROGRAMA
//Para cambiar de estado 1 a 2 apretar la tecla 'j' o 'J'.
//El movimiento del mouse afecta tanto en X como en Y a formas de ellipses y colores.


//Inicio VARIABLES

int tamx, tamy;
int nfilas;
int estado = 2; //valor del segundo estado (Ver = Void KeyPressed)

//Inicio SETUP 

void setup ()
{
  size(800, 800);
  nfilas = 20;
  tamx = width/nfilas;
  tamy = height/nfilas;
  rectMode (CORNER);
  ellipseMode (CENTER);
  smooth();
  frameRate (60); 
}

//Inicio DRAW

void draw ()
{
  background (0);
  noStroke();
  
  if (estado == 2)
  {
    for (int j=0; j<nfilas; j++)
    {
      for (int i=0; i<nfilas; i++)
      {
        float x1 = map(mouseX, 0, width, 0, 255); //Mapear el mouseX para que del valor 0 a ancho total pase a tener 0 a 255.
        float x2 = map(mouseY, 0, height, 0, 255); //Igual que anterior pero en el eje de las Y.
        float x3 = map(mouseX, 0, width, 5, 20);

        fill(240, x1, 105);
        ellipse (i*tamx+(tamx/2), j*tamy+(tamy/2), tamx, tamy);  //Redonda tamaño exacto celda unitaria.
        
        fill(240, x2, 105);
        beginShape(); //Quadrado girado 45 grados adaptado a la celda.
        vertex(i*tamx, j*tamy+(tamy/2));
        vertex(i*tamx+(tamx/2), j*tamy);
        vertex(i*tamx+tamx, j*tamy+(tamy/2));
        vertex(i*tamx+(tamx/2), j*tamy+tamy);
        vertex(i*tamx, j*tamy+(tamy/2));
        endShape();

        fill (0);
        //ellipse (i*tamx+(tamx/2), j*tamy+(tamy/2), tamx-(tamx/2), tamy-(tamy/2)); //Ellipse central celda unitaria reducida 1/2.  
        ellipse (i*tamx+(tamx/2), j*tamy+(tamy/2), x3, x3); //varia en función de mouseX tanto para las X como para las Y una distancia de 5 a 20 valores.
      }
    } 
  }
  
    else
{
  for (int j=0; j<tamy; j++)
  {
    for (int i=0; i<=j; i++)
    {
      float x1 = map(mouseX, 0, width, 0, 255); //Mapear el mouseX para que del valor 0 a ancho total pase a tener 0 a 255.
      float x2 = map(mouseY, 0, height, 0, 255); //Igual que anterior pero en el eje de las Y.
      float x3 = map(mouseX, 0, width, 5, 20);

      fill(105, x1, 240);
      ellipse (i*tamx+(tamx/2), j*tamy+(tamy/2), tamx, tamy);  //Redonda tamaño exacto celda unitaria.

      fill(105, x2, 240);
      beginShape(); //Quadrado girado 45 grados adaptado a la celda.
      vertex(i*tamx, j*tamy+(tamy/2));
      vertex(i*tamx+(tamx/2), j*tamy);
      vertex(i*tamx+tamx, j*tamy+(tamy/2));
      vertex(i*tamx+(tamx/2), j*tamy+tamy);
      vertex(i*tamx, j*tamy+(tamy/2));
      endShape();

      fill (0);
      //ellipse (i*tamx+(tamx/2), j*tamy+(tamy/2), tamx-(tamx/2), tamy-(tamy/2)); //Ellipse central celda unitaria reducida 1/2.  
      ellipse (i*tamx+(tamx/2), j*tamy+(tamy/2), x3, x3); //varia en función de mouseX tanto para las X como para las Y una distancia de 5 a 20 valores.
    }
  }
}

}

//Inicio KEYPRESSED

void keyPressed()
{
  if (key == 'j' || key == 'J') //cuando se haya pulsado la tecla j o J cambiará al estado 1 else (hasta que se pulse otra tecla)
  {
    estado = 1;
  }
  else  
  {
    estado = 2;
  }
}
