
//definir tamanho da tela, parametros de cor, e suavidade das formas
size (800, 600);
background (random (0, 255));
smooth ();
  
  
//declarar primeira variavel de circulos (circulos sem stroke)
int numObject = 100;
  
for ( int i = 0; i < numObject; i = i +1)
{
     float m = map(i, 0, numObject, 50, 255);
   //definir parametros de cor aleatorios
   fill(m,random (255),random (255),random (255));
   noStroke ();
   float dimensao = random(100);
   //definir elipse com tamanho e posicao random
   ellipse(random(width/2-250, width/2+250),random( height/2-150, height/2+150), dimensao, dimensao);
             
}
  
  
//declarar segunda variavel de circulos (circulos com stroke) 
int nobjectos = 100;
for (int i=0; i<nobjectos; i=i+1)
{
  float tamanho = random(200);
  float cor = map (i, 0, nobjectos, 0, random (255));
  //definir parametros de cor aleatorios
  stroke (cor, random (255), 0, random (255));
  strokeWeight (4);
  fill (cor, random (255), 0, random (50));
  //definir elipse com tamanho e posicao random
  ellipse (random(1000),random( height/2-150, height/2+150), tamanho, tamanho);
  
}

//gerar 5 triangulos com cor e posicao aleatoria.
for ( int i = 0; i < 5; i = i +1)
{
   fill (255, random (255), random (255), 63);  
   triangle(random (0),random (height), width, height, width, height);
            
}                               
