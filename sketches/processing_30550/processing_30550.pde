

                
                size (1020,750);
background (255);
smooth();
 
 stroke(0);
 fill(255);
  
int grid = 5; 
int grid2 = 7; // ajuste dos espaços da grelha h e v, define-se numero para as duas
int stepSizeH = (int) (height/ grid)-9; // outra hipotese do ajuste de espaço
int stepSizeW = (int) (width/ grid2)-3;
 
for ( int h = 10; h < height+250; h = h + stepSizeH)
{
 rectMode(CENTER);
  for ( int w = 0; w < width+300; w = w + stepSizeW)
  {
    
    float quadrado = 110;
       fill (random (255),random (h),h);
         rect(w, h, quadrado, quadrado);
         noFill();
         noStroke();
 
     }
        
    }
     
saveFrame ("grelha1..png");
