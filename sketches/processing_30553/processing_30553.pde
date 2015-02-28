
      
                size (500,600);
background (255);
smooth();
 
 stroke(1);
 fill(255);
  
int grid = 5; 
int grid2 = 10; 
int stepSizeH = (int) (height/ grid);
int stepSizeW = (int) (width/ grid2);
 
 
for ( int h = 1; h < height+100; h = h + stepSizeH)
{
 rectMode(CENTER);
  for ( int w = 0; w < width+100; w = w + stepSizeW)
  {
    
     {
       fill (random (252));
       stroke (319);
         rect(w, h, 50,50);
         noFill();
         noStroke();
         for (int i=0; i<50; i=i+1)     
{
for (int e=0; e<10; e=e+1)
  {
 stroke (319);
 strokeWeight (0.8);
 float transparencia = random (50,100);
 fill (random (319), transparencia);
 float arco = random (10, 50);
 
 arc (w, h, arco, arco, radians (random (20)), radians (random (180)) );
  
  }
}
                  
     }
        
    }
}
saveFrame("exame.oo,png");
