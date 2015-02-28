
/*
*  Created by Joowon Chung 
*  Contact: chung@gmail.com
*
*  Copyright 2011 Joowon Chung. All rights reserved.
*
*/



void setup(){
 size(450,450);
 background(255);

}

void draw(){}
  
void mouseReleased(){
if(mouseButton == LEFT){
background(0);
for(int i=0; i<500; i++){
strokeWeight(random(1));
stroke(random(255),0);
stroke(random(255),0);
      fill(254,255,0,20);  
      
      quad(random(width),random(height),random(86),random(height),random(width),random(height),random(width),random(height));
      fill(255,0,230,30);  
      quad(random(300),random(height),random(400),random(height),random(width/2),random(height),random(width/2),random(height));
      quad(random(300),random(height/3),random(500),random(height/3),random(width),random(height),random(width),random(height));
       fill(255,0,0,20);  
       quad(random(100),random(height),random(300),random(height),random(500),random(height),random(300),random(height));
       fill(0,255,116,30); 
      quad(random(250),random(height/5),random(30),random(height/5),random(width),random(height/5),random(width),random(height/5));
      fill(0,255,116,30); 
      quad(random(250),random(height/3),random(30),random(height/3),random(width),random(height/3),random(width),random(height/3));
     fill(0,255,116,30); 
      quad(random(250),random(height/2),random(30),random(height/2),random(width),random(height/2),random(width),random(height/2));
      }


}

}

 

    

 




