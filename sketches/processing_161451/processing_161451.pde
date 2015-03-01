
import processing.pdf.*;

boolean renderpass1 = true;

int posX = 10;
int posY = 10;
int distance = 120;
int rectWidth = 100;
int rectHeight = 100;


void setup() {
  size(1200,800);
 //size(1200,800,PDF, "X:/temppro/ALBERTSBOX.pdf");
 noSmooth();
colorMode(HSB, 360, 100, 100);
noStroke();
}

void draw() {
  //rect(posX,posY,rectWidth,rectHeight);
  if(renderpass1){ 
       for (int l = 0; l <6; l = l+1){  
       //12 rows
      
       
       
               for (int i = 0; i <10; i = i+1) {
                 float color1 = random(1,359);
                 float color2 = 1;
                 if (color1 > 180){
                  color2 = color1 -180;
                 } 
               if (color1 < 180){
                  color2 = color1 +180;
                 } 
                 
                //10 
                fill(color1,100,100);
                rect(posX,posY,rectWidth,rectHeight); 
                
                 fill(color2,100,100);
                rect(posX+15,posY+25,rectWidth-30,rectHeight-30);  
                                 fill(color1,50,85);
                rect(posX+25,posY+40,rectWidth-50,rectHeight-50);  
                
                
                posX = posX + distance;
               }
 
                posY = posY + distance;
               posX = 10;
               int i = 0;
               
               
        
       }
          
      }
  
  renderpass1 = false;
   println("Finished.");
 //exit(); 
}

