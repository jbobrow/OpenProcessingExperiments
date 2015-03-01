
int eSize = 10; 


size(400, 400); 


background(255); 


smooth(); 


   


fill(0); 


   


for(int y = 0; y <= height; y += 15){ 


for(int x = 0; x <= width; x += 15){ 


    stroke(255,255,255); 


    fill(x/2, 200, y/2); 


    ellipse(x, y, eSize, eSize); 


  } 


} 



  


for(int x= 10; x <= 500; x+=60){ 

  strokeWeight(3);
  
  stroke(0,232,255,x); 


  noFill(); 


   ellipse(0,50,x,x); 
   
   strokeWeight(8);
   
   stroke(x,x,x,x); 

   
   ellipse(200,200,x,x);
 
  
    strokeWeight(3);
    
    stroke(255,255,0,x);
      
     ellipse(400,350,x,x);
   
 

}
     


