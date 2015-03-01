

int xPos = 40; 
int yPos = 40; 
int s = 30; 


void setup() { 

  noStroke(); 
  size(800, 600); 
  background(230, 230, 230); 
  fill(255); 
  rect(110, 20, 670, 560); 

  fill(255, 0, 0); 
  rect(xPos, yPos, s, s); 

  fill(255, 179, 0); 
  rect(xPos, yPos+s, s, s); 

  fill(255, 255, 0); 
  rect(xPos, yPos+2*s, s, s); 

  fill(100, 255, 100); 
  rect(xPos, yPos+3*s, s, s); 

  fill(100, 200, 100); 
  rect(xPos, yPos+4*s, s, s); 

  fill(100, 180, 255); 
  rect(xPos, yPos+5*s, s, s); 

  fill(150, 100, 255); 
  rect(xPos, yPos+6*s, s, s); 

  fill(255, 100, 200); 
  rect(xPos, yPos+7*s, s, s); 

  fill(150); 
  rect(xPos, yPos+8*s, s, s); 

  fill(0); 
  rect(xPos, yPos+9*s, s, s); 
  
   
  fill(255); 
  rect(xPos, yPos+12*s, s, s); 



} 


  


void draw() { 


  


  if (mousePressed) { 


    if (mouseX > 190 && mouseX < 780 && mouseY >  20 && mouseY < 560) { 


      line (pmouseX, pmouseY, mouseX, mouseY); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos && mouseY < yPos+s) { 


      stroke(255, 0, 0); 


      strokeWeight(10); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s && mouseY < yPos+s+s) { 


      stroke(255, 179, 0); 


      strokeWeight(10); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s && mouseY < yPos+s+s+s) { 


      stroke(255, 255, 0); 


      strokeWeight(10); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s+s && mouseY < yPos+s+s+s+s) { 


      stroke(100, 255, 100); 


      strokeWeight(10); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+4*s && mouseY < yPos+5*s) { 


      stroke(100, 200, 100); 


      strokeWeight(10); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+5*s && mouseY < yPos+6*s) { 


      stroke(100, 180, 225); 


      strokeWeight(10); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+6*s && mouseY < yPos+7*s) { 


      stroke(150, 100, 225); 


      strokeWeight(10); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+7*s && mouseY < yPos+8*s) { 


      stroke(225, 100, 200); 


      strokeWeight(10); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+8*s && mouseY < yPos+9*s) { 


      stroke(150); 


      strokeWeight(10); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+9*s && mouseY < yPos+10*s) { 


      stroke(0); 


      strokeWeight(10); 


    } 
    
 
    } 


      if(mouseX > xPos && mouseX <xPos+s && mouseY > yPos+11*s && mouseY < yPos+12*s){ 


      stroke(255);  
   
      strokeWeight(20);


   } 


  } 




