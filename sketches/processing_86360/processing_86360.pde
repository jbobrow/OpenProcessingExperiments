

void setup(){
  
  size(500,500);
  background(255);
  smooth();
  noFill();
}

   void draw(){
     
     for(int i =0;i<4;i++){
       
      
    rect(0,0,30,20);
    rect(0,0,20,30);
    rect(40,0,10,20);
    rect(0,40,20,10);
      
    
    translate(140,0);
    rotate(radians(90));
   
    
     }
   }
   


