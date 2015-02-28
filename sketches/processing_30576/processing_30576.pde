
size (500,500);   

background (0);   

smooth();  
 

 stroke(0);  

 fill(2);  

int grid1 = 10;    

int grid2 = 10; 

int stepSizeH = (int) (height/ grid1);  

int stepSizeW = (int) (width/ grid2);  


for ( int h = 0; h < height+10; h = h + stepSizeH)  

{  

 rectMode(CENTER);  

  for ( int w = 0; w < width+10; w = w + stepSizeW)  

  {  
     {  

       fill (random (102));  

       stroke (255, 0, 165);  

         rect(w, h, 40, 40);  

         noFill();  

         noStroke();  

            

         for (int i=0; i<9; i=i+1)        

{  

  for (int e=0; e<1; e=e+1)  

  {  

 stroke (3);  

 strokeWeight (0.9);  

 float transparencia = random (10,20);  

 fill (random (25), transparencia);  

 float arco = random (19, 45);  

 arc (w, h, arco, arco, radians (random (1)), radians (random (360)) );  

  }  

}  
    }  

    }  

} 
saveFrame ("2.png"); 


