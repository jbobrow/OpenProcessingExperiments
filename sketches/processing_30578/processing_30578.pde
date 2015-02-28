
size (500,500);   
background (0);   
smooth();  

   
 stroke(3);  
 fill(55);  

    

int grid1 = 10;    

int grid2 = 10; 

int stepSizeA = (int) (height/ grid1)-5;   

int stepSizeB = (int) (width/ grid2)-5;  

   

      

      

    

      

      

   for ( int h = 1; h < height; h = h + stepSizeA)  

{  

  for ( int w = 3; w < width+10; w = w + stepSizeB)  

  {  

      

      float r1 = map (h,0,height,25,0);  

      float r2 = map (h,0,height,255,67);  

       

noStroke ();  

         float raio1a = random (1,50);  

         float raio2a = random (20,1);  

       float tr = random (5,50);  

         fill (r1, r2,w, tr);  

                 for (int i=0;i<30;i=i+1) {  

           ellipse (w-i,h+i, raio1a, raio2a);   

   }      

     }  
     
    }  

    for ( int h = 0; h < height+90; h = h + stepSizeA)  

{  

  for ( int w = 0; w < width+90; w = w + stepSizeB)  

  {  

      stroke (225);  

      float tamanho = random (40);  

      line (w+10,h,w,h);  

            line (w,h,w,h+10);  

             

            for (int i=0;i<10;i=i+1){  

         noStroke();  

         fill (random (2), random (100),40, 60);  

arc(w,h,tamanho, tamanho, radians (random (10)), radians (random (60)));  

            }  

            stroke (225);  

  ellipse(w,h,tamanho,tamanho);  

    

noStroke ();  

   }                        

     }  

     saveFrame ("1.png");  


