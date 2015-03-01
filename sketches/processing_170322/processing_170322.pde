
int eSize = 5;
 
size(400, 400);
background(255);
smooth();
 
 for(int y = 0; y <=height; y +=10){
 for(int x = 0; x <=width; x +=10){
 
  
   if(x > 80 && x < 320 && y > 80 && y < 320) {
    fill(255,0,0);
   }else if(x > 55 && x < 335 && y > 55 && y < 335){
     fill(255,50,50);
   }else if(x > 35 && x < 355 && y > 35 && y < 355){
     fill(255,100,100); 
   }else if(x > 20 && x < 370 && y > 20 && y < 370){
     fill(255,150,150); 
   }else if(x > 10 && x < 380 && y > 10 && y < 380){
     fill(255,200,200); 
   }else if(x > 5 && x < 385 && y > 5 && y < 385){
     fill(255,50,50); 
  } else{
    fill(255,0,0);
    
    
  }
   noStroke();
   rect(x,y,9,9);
    stroke(255,x,60);
  line(y/2,100,100, x/2);
  line(y,200,200, x);
 
   
  
}
}

   
 
 
  


