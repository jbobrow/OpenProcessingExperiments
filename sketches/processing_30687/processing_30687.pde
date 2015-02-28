
size (800,600); // define o tamanho da janela
background (0); // define a cor do background
smooth();// aplica anti-alias

 stroke(255);//define a cor da linha
 fill(0);//define a cor
 
//define as variáveis da grelha 
int grid = 14;  
int grid2 = 27;
int stepSizeH = (int) (height/ grid)-4;
int stepSizeW = (int) (width/ grid2)-3;
   
//define as variáveis do loop
   
   for ( int h = 0; h < height; h = h + stepSizeH)
{
  for ( int w = 0; w < width+10; w = w + stepSizeW)
  {
   
      float r = map (h,0,height,255,0);
      float r2 = map (h,0,height,255,0);
   
         float raio1a = random (1,90);
         float raio2a = random (90,1);
       float tr = random (5,50);
       
//define as caracteristicas da forma

         fill (r+100, r2,w, tr);
                 for (int i=0;i<10;i=i+2) {
           ellipse (w-i,h+i, raio1a, raio2a); 
               
   }    
 
                 
     }
       
    }
    
    
    for ( int h = 0; h < height+200; h = h + stepSizeH)
{
  for ( int w = 0; w < width+100; w = w + stepSizeW)
  {
      stroke (0);
      float tamanho = random (50);
      line (w+90,h,w,h);
            line (w,h,w,h+90);
          
            for (int i=0;i<10;i=i+1){
         noStroke();
         fill (random (255), 10,random(29), 20);
         rectMode (CENTER);
rect(w,h,tamanho, tamanho);
            }
            stroke (0);
  rect(w,h,tamanho,tamanho);
 
noStroke ();
   }    
 
                 
     }
    
   
  saveFrame("grelha1.tiff");
   
   



