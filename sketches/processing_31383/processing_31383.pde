
void setup (){
  size(500,500);
  background (255);
  fill(250,191);
  stroke(246);
  strokeWeight(10);
  
for(int i = 0; i <22; i++){  
      for(int j = 0; j < 22; j++){  
       pushMatrix();  
        translate(i*25, j*25);  
      int startX = 0;
  int startY = 0;
  int arcWidth = 50;
  int arcHeight = 50;
  float d = random(5);
        if (d <0.99){
        arc(startX,startY,arcWidth, arcHeight,0,PI/2);
        }
     else if (d > 1&& d<1.99){
        arc(startX,startY,arcWidth, arcHeight,PI/2,PI);
        }
        else if (d > 2&&d<2.99){
        arc(startX,startY,arcWidth, arcHeight,PI,PI+PI/2); 
       }
       else if (d>3&&d<5){
         arc(startX,startY,arcWidth, arcHeight,PI+PI/2,2*PI); 
        }
        smooth();
        popMatrix();  
     }  
 }  


}

void draw (){
  for(int i = 0; i <22; i++){  
      for(int j = 0; j < 22; j++){  
       pushMatrix();  
        translate(i*25, j*25);  
      int startX = 0;
  int startY = 0;
  int arcWidth = 50;
  int arcHeight = 50;
  float d = random(5);
        if (d <0.99){
        arc(startX,startY,arcWidth, arcHeight,0,PI/2);
        }
     else if (d > 1&& d<1.99){
        arc(startX,startY,arcWidth, arcHeight,PI/2,PI);
        }
        else if (d > 2&&d<2.99){
        arc(startX,startY,arcWidth, arcHeight,PI,PI+PI/2); 
       }
       else if (d>3&&d<5){
         arc(startX,startY,arcWidth, arcHeight,PI+PI/2,2*PI); 
        }
        smooth();
        popMatrix();  
     }  
 }  
        
      
        
       
  
}

