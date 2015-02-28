
float rectX = 0;  
float rectY = 0;  
float rectX2 = 0;  
float rectY2 = 0;  
float center;  


void setup() {  
  size(500,500);  
  smooth();  
  background(0);  

  center = width / 2;  
}  

void draw() {  
  
  //rectMode(CENTER);
  fill(frameCount % 255, random(255), random(255), 50);  
  stroke(frameCount % 255, 0,  255, 50);  
  rect(rectX2, frameCount % 255,rectY2,frameCount % 255 );
  rect(frameCount % 255,rectY2,rectX2, frameCount % 255 );  
  line(frameCount % 255,rectY2,rectX2, frameCount % 255 ); 
 // rect(rectX,rectY , rectX,rectY);  

  rectX = rectX + 10;   
  rectX = rectX % width;  
  
  rectY = rectY + 10;   
  rectY = rectY % width; 
  
  rect(rectX2,rectY2, frameCount % 255,frameCount % 255 ); 
  rectX2 = rectX2 + (frameCount % 30);  
  rectX2 = rectX2 % width;  
  
  rectY2 = rectY2 + (frameCount % 30);   
  rectY2 = rectY2 % width; 
  
 
 
  
} 


