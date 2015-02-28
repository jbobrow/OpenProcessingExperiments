
size (800,600);                      // tamanho da janela
background (0);                      //cor fundo
smooth();
 
stroke(0);
fill(255);
  
int grid = 15;                                     //variaveis declaradas
int grid2 = 20;
int stepSizeH = (int) (height/ grid);
int stepSizeW = (int) (width/ grid2);
 
 
for ( int h = 0; h < height+100; h = h + stepSizeH)   //variavel
{
 rectMode(CENTER);
  for ( int w = 0; w < width+100; w = w + stepSizeW)
  {
    
     {
       fill (random (20));
       stroke (255);
         rect(w, h, 38, 38);
         noFill();
         noStroke();
          
         for (int i=0; i<40; i=i+1)     
{
  
 
  for (int e=0; e<10; e=e+1)                                        //variaveis
  {
 stroke (0);
 strokeWeight (2.9);
 float transparencia = random (5,19);
 fill (random (200), transparencia);
 float arco = random (10, 38);
 

 arc (w, h, arco, arco, radians (random (10)), radians (random (360)) );  //amplitude dos circulos
  
  }
}
                  
     }
        
    }
    
}


