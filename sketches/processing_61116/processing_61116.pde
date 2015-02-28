
size (800,600);
background (255);
smooth();
 
 stroke(0);
 fill(305);
  
int grid = 5; 
int grid2 = 7; // ajuste dos espaços da grelha h e v, define-se numero para as duas
int stepSizeH = (int) (height/ grid); // outra hipotese do ajuste de espaço
int stepSizeW = (int) (width/ grid2+5);
 
for ( int h = 0; h < height+200; h = h + stepSizeH)
{
 rectMode(CENTER);
  for ( int w = 0; w < width+200; w = w + stepSizeW)
  {
    
    float quadrado = 110;
       fill (random (255));
       stroke (210);
         rect(w+w, h+h, quadrado, quadrado);
         noFill();
         noStroke();
 
     }
        
    }
     
     
    // -----------------------------------------------------------------------
     
for ( int h = 0; h < height+100; h = h + stepSizeH)
{
  for ( int w = 0; w < width+100; w = w + stepSizeW)
  {
    
    float quadrado = 110;
       fill (random (255));
       stroke (0);
        ellipse(w, h, quadrado, quadrado);
         noFill();
         noStroke();
          
          
         float raio1 = random (40,110);
         float raio2 = random (30, 105);
         fill (random (255));
                 for (int i=0;i<100;i=i+2) {
           ellipse (w,h, raio1, raio2);
  
   }   
  
                  
     }
        
    }
    
    
   // ----------------------------
    
  saveFrame ("grelha1.tiff");
    


