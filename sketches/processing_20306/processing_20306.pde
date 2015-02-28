
void setup ()   {

  size(1200, 1000);  
  background(0);  
  noStroke();  
  smooth();

}


void draw ()   {
  
 
 
  fill(0,100);
  rectMode(CENTER);
  rect(width/2,height/2,width,height);
  
  fill(225);
  ellipse(mouseX, mouseY, 200, 200);
  fill(100,0,0);
  ellipse(mouseX, mouseY, 150, 150);
  fill(225);
  ellipse(mouseX, mouseY, 100, 100);
  fill(100,0,0);
  ellipse(mouseX, mouseY, 50, 50);
    
}          
                
