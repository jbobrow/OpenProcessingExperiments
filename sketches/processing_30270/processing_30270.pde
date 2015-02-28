

size (800, 600);                       // tamanho da janela
background (0);                    //cor de fundo
smooth ();
 
 
 
int numObject = 100;                                     //variaveis 
 
for ( int i = 0; i < numObject; i = i +1)
{
     float m = map(i, 0, numObject, 50, 255);
   
   fill(m,120,40,100);
    noStroke ();
    float dimensao = random(100);
   ellipse(random(width/2-250, width/2+250),random( height/2-150, height/2+150), dimensao, dimensao); //posicionamento dos circulos
            
}
 
 
 
int nobjectos = 100;                                          //variaveis / trasparencias
for (int i=0; i<nobjectos; i=i+1)
{
  float tamanho = random(200);
  float cor = map (i, 0, nobjectos, 0, 255);
  stroke (cor, 255, 0, 200);
  strokeWeight (4);
 fill (cor, 255, 0, 50);
  ellipse (random(1000),random( height/2-150, height/2+150), tamanho, tamanho); //posicionamento dos circulos
   
}
 



