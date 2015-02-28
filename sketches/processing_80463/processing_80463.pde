
PFont letra;
int posx;
int inc;

void setup()
  {
    size(800,400);
    letra = createFont ("verdana.vlw", 1);
    textSize(80);
    fill(100,10,250);
    posx = 0;
  }
  
 void draw()
 {
   background(0);  //sintaxis de text('palabra', coordenada X, coordenada Y)
   text('G', posx, height/2);// aqui aparecen todas las letras encimadas
   text('E', posx + inc * 2, height/2); // con este incremento despegamos la primera letra
   text('R', posx + inc * 4, height/2);// se despega la siguente letra
   text('A', posx + inc * 6, height/2);
   text('R', posx + inc * 8, height/2);
   text('D', posx + inc * 10, height/2);
   text('O', posx + inc * 12, height/2);
if((posx + inc * 12) >= width-68)// condicion para parar el ciclo
   {
     noLoop();// instruccion para parar el ciclo de draw.
     save("image.gif");// salva la pantalla que genera la corrida como una imagen de formato Gif
   }
   inc ++;
 }


