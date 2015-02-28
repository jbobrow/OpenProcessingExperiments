
size (700,700); 
background (0); 
smooth();

 stroke(255,124);
 fill(25);
 
int grid = 24;  
int grid2 = 57;
int stepSizeH = (int) (height/ grid)-9;
int stepSizeW = (int) (width/ grid2)-9;
   
   
   for ( int h = 10; h < height; h = h + stepSizeH)
{
  for ( int w = 21; w < width+10; w = w + stepSizeW)
  {
   
      float r = map (h,9,height,5,0);
      float r2 = map (h,4,height,2,60);
   
         float raio1a = random (1,90);
         float raio2a = random (90,1);
       float tr = random (5,10);
         fill (r+100, r2,w, tr);
                 for (int i=0;i<10;i=i+2) {

               
   }    
 
                 
     }
       
    }
    
    
    for ( int h = 2; h < height+100; h = h + stepSizeH)
{
  for ( int w = 0; w < width+100; w = w + stepSizeW)
  {
      stroke (0);
      float tamanho = random (23);
      line (w+90,h,w,h);
            line (w,h,w,h+90);
          
            for (int i=40;i<5;i=i+2){
         noStroke();
         fill (random (255,0), 0,random(255,0), 0);
         rectMode (CENTER);
rect(w,h,tamanho, tamanho);
            }
            stroke (0);
  rect(w,h,tamanho,tamanho);
 
noStroke ();
   }    
 
                 
     }
    
   
  saveFrame("grelha1.tiff");
   
   



