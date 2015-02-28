

float x;
float y;
int ecart= 150;
int diam = 10;
void setup() {
  size(800, 800);
  smooth();
}


void draw() {
  
background(255, 255, 255);

noStroke();


for (float x = 200; x < 600; x = x+10) {
      for (float y = 200; y < 600; y = y+10) {
    
    
      float distanceX = dist(mouseX, 0, x, 0);
      float distanceY = dist(mouseY, 0, y, 0);
      
      float distance = sqrt(distanceX*distanceX+distanceY*distanceY);
  
      float rndX = random(-distance,distance); 
      float rndY = random(-distance,distance); 
     
  
   if (mousePressed == true){
  
   fill(0,19,0,50);
   ellipse(x+200/rndX, y+200/rndY,diam,diam);
   }else{
   fill(0,19,0,50);
      ellipse(x+0.1/rndX*rndX, y+0.1/rndY*rndY,diam,diam);
    









   
    }
    
     }
      }
      }
     
    
 
   void mouseReleased(){
      background(255, 255, 255);

noStroke();


for (float x = 200; x < 600; x = x+10) {
      for (float y = 200; y < 600; y = y+10) {
    
    
      float distanceX = dist(mouseX, 0, x, 0);
      float distanceY = dist(mouseY, 0, y, 0);
      
      float distance = sqrt(distanceX*distanceX+distanceY*distanceY);
  
      float rndX = random(-distance,distance); 
      float rndY = random(-distance,distance); 
       
      ellipse(x+0.1/rndX, y+0.1/rndY,diam,diam);
    } 
    
      }
      
      }



 






  
 
  

  



