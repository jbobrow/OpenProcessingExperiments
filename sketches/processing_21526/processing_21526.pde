


Ball Ball1;
Ball Ball2;

void setup() {
  
  size(600,600);
  background (000);
  Ball1 = new Ball (0,60, 2, color(260, 65, 62)); 
    Ball2 = new Ball (600,540, 2, color(40, 76, 2) ); 
}


void draw() {
  background (71, 87, 87);
  



   Ball1.Place1();  
 Ball1.shaped2();
 Ball1.shaped();
 Ball1.flow();
 Ball1.change(); 

//Ball2.Place2();
  Ball2.shaped2();
  Ball2.shaped();
 Ball2.flow();
 Ball2.change(); 
 
  noStroke();
 fill( 0, 92, 87);
 rect(0, 0, 200, 200);
 
  fill( 137, 92, 87);
 rect(600, 600, 200, 200);
 
   fill( 137, 70, 52);
 rect(0, 600, 200, 200);
 
   fill( 0, 92, 87);
 rect(600, 0, 200, 200);

 
    
}



  
  


