
int eSize = 3;

size(510,510);
background(250);
stroke(0);

strokeWeight(5); 
fill(300,60,60);    
ellipse(100, 70, 100, 100);

   
  for (int x = 0; x<=width; x ++){
   
     
      stroke(510,x,60,10); 
       line( width, 0, x, height); 
         stroke(310,x,60,10); 
    line( width, 190, x, height); 
    
    
      stroke(310,x,60,10); 
    line( width, -190, x, height); 
    
    
      stroke(100,x,60,10); 
    line( width, -250, x, height); 
    
     stroke(310,x,90,10); 
    line( width, -500, x, height); 
    
     stroke(210,x,50,10); 
    line( width, -600, x, height);
    
     
     stroke(10,x,600,100); 
    line( width, 120, x, height); 
         stroke(10,x,100,100); 
    line( width, 290, x,405); 
        
          
     stroke(30,x,60,100); 
    line( width, 120, x, height); 
         stroke(10,x,600,100); 
    line( width, 290, x,405); 
    
        
     stroke(x,10,205,10); 
    line( width, 250, 250, height); 
     stroke(x,640,105,60); 
    line( width, -250, -250, height);     

 stroke(x,6,5,160); 
    line( 510, 400, 400, 510); 
    
    stroke(x,405,20,90); 
    line( 510, 300, 300, 510); 


}




