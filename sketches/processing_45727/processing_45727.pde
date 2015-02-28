
float posX;
float posY;
float nz = 0.01;


void setup (){
 size (800,600);
 background (255); 
 smooth();
  
  
}


void draw(){
  
  translate (width/2, height/2);
 float n = 5;
n = noise (nz)*n;
 
  stroke (0);
  
  strokeWeight(50);
  for (int i=0; i<3000; i++){
    posX = posX+i;
    posY = posY+i;
   line (posX, posY, posX*n, posY*n);
   rotate(45);
  }
  
 
  
  
}



  
  
  



