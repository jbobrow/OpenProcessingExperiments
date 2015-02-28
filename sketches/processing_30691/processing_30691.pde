
size (800,600); // define o tamanho da janela
background (0); // define a cor do background
smooth(); // aplica anti-alias

 stroke(0); //define a cor da linha
 fill(255); //define a cor da forma
 
 
//define as variáveis da grelha  
int grid = 10;  
int grid2 = 15;
int stepSizeH = (int) (height/ grid);
int stepSizeW = (int) (width/ grid2);

//define as variáveis do loop
for ( int h = 0; h < height+100; h = h + stepSizeH)
{
 rectMode(CENTER);
  for ( int w = 0; w < width+100; w = w + stepSizeW)
  {
   
     {
       
       
 //define as caracteristicas da forma      
       fill (random (255));//define a cor da forma
       strokeWeight (6);//define a espessura da linha
       stroke (255);//define a cor da linha
         rect(w, h, 38, 38);//define o tamanho e posição da forma
         noFill();
         noStroke();
         
         for (int i=0; i<40; i=i+1)      
{
 

  for (int e=0; e<50; e=e+1)
  {
noStroke ();
 fill (random (255), random (255), random (255));
 float corpo = random (5, 38);

 rect (w, h, corpo, corpo );
 
  }
}
                
     }
        }
   
}

saveFrame ("grelha2.tiff");//salva uma imagem

