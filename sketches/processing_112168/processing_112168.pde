
int posX= 20;
int speedX = 100;
int posY = 20;
int speedY = 100;

void setup() {
  size(1000,600); 
   
}
 
 
void draw() {
  background(0,250,80);
 
   
  for(int X = 0; X<=1000 ; X+=20) {
    for(int Y = 0; Y<=600; Y+=20) {
       
      float distance = dist(X, Y, mouseX, mouseY);
      float squareSize = map(distance, 0, 500, 20, 0);
       
    fill(0, 250,238);
      rect (X,Y,squareSize,squareSize);
        
    } 
     
  }
 
   posX = posX + speedX;
   posY = posY + speedY;
    
   if (posX >= width || posX <=0) {
     speedX *= -1;
  
 }
  
    if (posY >= height || posY <=0) {
     speedY *= -1;
      
   }
    
 fill (255,231,0);
 ellipse(posY, posX, 10,10);
 
 
 fill (255,231,0);
  
 ellipse(posX, posY, 20,20);
 


    
    

    }
   
   
   



