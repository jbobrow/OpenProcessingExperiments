
float xLast; 


float yLast; 


boolean switchStroke = true; 


boolean switchRotation = true; 


boolean onOff = true; 


boolean backGround = true; 


int value = 0; 


  


  


void setup() { 


  size(600, 600); 


  smooth(); 


  frameRate(10); 


} 


  


void draw() { 


  background(255); 
  ellipseMode(CENTER); 


  noStroke();  
  fill(#7CB291); 
  ellipse(mouseX+100, mouseY+1, 20, 20); 

noStroke();  
  fill(#7CB291); 
  ellipse(mouseX+200, mouseY+3, 20, 20); 

  fill(#405F57); 


  ellipse(mouseX+105, mouseY+6, 70, 70); 
  if (keyPressed == true) { 
    fill(random(#C4DEAF), random(#405F57), random(#ACE395)); 
  rect(mouseX+100, mouseY+1,70,70);


  } 


  


  fill(#56A798); 


  rect(mouseX-110, mouseY+1, 20, 20); 


  fill(#598376); 


  rect(mouseX-105, mouseY+6, 10, 10); 


  


  if (keyPressed == true) { 


    fill(random(255), random(255), random(255)); 


    ellipse(mouseX-105, mouseY+6, 10, 10); 


  } 


  


  strokeWeight(3); 


  stroke(#FCF8D9); 


 

  noStroke(); 
  fill(#7CB291 ); 
  ellipse(xLast, yLast, 100, 100);  

  xLast=pmouseX; 
  yLast=pmouseY; 

  title(); 
} 





void title() {  
  fill(222, 215,215);  
  textAlign(RIGHT); 
  text("WOO Eunhye, Untitled, Dynamic Media, 2014", width-50, height-20);  


}  

