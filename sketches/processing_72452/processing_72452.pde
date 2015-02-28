
float circleX = 0;  
float circleY = 0;  

void setup() {  
  size(400,400);  
  smooth();  
  background(frameCount % 255);  

}  

void draw() {  
 

  
  stroke(frameCount % 255,0,mouseY);  
  //fill(255, 255, 255, 0); // alpha transparent  
  fill(0,4);
  rect(0,0,400,400);
  ellipse(circleX , circleY,frameCount % 30,frameCount % 30 );

  line(width/2, circleY, mouseX, mouseY);  

  circleX = circleX + (frameCount % 30) ;   
  circleX = circleX % width;  
  // Move circle down + keep it in range  
  circleY = circleY + 10.5;  
  circleY = circleY % width;  
 
} 


