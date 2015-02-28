
//week 3 home work
//Hector Ramirez



int y=0;

int z=255;  //this thin.e is awsom, it changes alot of stuff


void setup(){

 size(520,700);
 smooth();
 background(250.8,246);

}



void draw(){
  
  fill(255,0,y);
  ellipse(260,y,500,y);
   y=y+15;
  
  
  strokeWeight(10);
   stroke(z);
     z=z-5;
       line(0,y,700,y);
          y=y+10;
       
    if(y > 700){   
       y=y-700;
    
  
    
      
    }     
 }
   
   
    
 
    


 
 

   
   
   
 
   
 

