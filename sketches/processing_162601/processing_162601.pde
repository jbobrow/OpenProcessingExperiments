

int xPos = 50; 


int yPos = 50; 


int s = 30; 


  


  


void setup() { 


  noStroke(); 


  size(800, 600); 


  background(242,242,242); 


  fill(255); 


  rect(130, 20, 650, 560); 


  


  fill(255, 0, 0); 


  rect(xPos, yPos, s, s); 


  


  fill(255, 255, 0); 


  rect(xPos, yPos+s, s, s); 


  


  fill(90, 90, 90); 


  rect(xPos, yPos+2*s, s, s); 


  


  fill(46, 152, 255); 


  rect(xPos, yPos+3*s, s, s); 


  


  fill(107, 203, 122); 


  rect(xPos, yPos+4*s, s, s); 


  


  fill(194, 100, 229); 


  rect(xPos, yPos+5*s, s, s); 


  


  fill(206, 240, 123); 


  rect(xPos, yPos+6*s, s, s); 


  


  fill(118, 229, 226); 


  rect(xPos, yPos+7*s, s, s); 


    


    fill(255,112,3); 


  rect(xPos, yPos+8*s, s, s); 


    


      fill(255,52,154); 


  rect(xPos, yPos+9*s, s, s); 


    


  fill(200,200,200); 


  rect(25,510,50,40); 


  fill(255,255,255); 


  rect(75,510,30,40); 


} 


  


void draw() { 


  


  if (mousePressed) { 


    if (mouseX > 220 && mouseX < 780 && mouseY > 20 && mouseY < 580) { 


      line (pmouseX, pmouseY, mouseX, mouseY); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos && mouseY < yPos+s) { 


      stroke(255, 0, 0); 


      strokeWeight(5); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s && mouseY < yPos+s+s) { 


      stroke(255, 255, 0); 


      strokeWeight(5); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s && mouseY < yPos+s+s+s) { 


      stroke(90, 90, 90); 


      strokeWeight(5); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s+s && mouseY < yPos+s+s+s+s) { 


      stroke(46, 152, 255); 


      strokeWeight(5); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+4*s && mouseY < yPos+5*s) { 


      stroke(107, 203, 122); 


      strokeWeight(5); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+5*s && mouseY < yPos+6*s) { 


      stroke(194, 100, 229); 


      strokeWeight(5); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+6*s && mouseY < yPos+7*s) { 


      stroke(206, 240, 123); 


      strokeWeight(5); 


    } 


    if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+7*s && mouseY < yPos+8*s) { 


      stroke(118, 229, 226); 


      strokeWeight(5); 


    } 


        if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+8*s && mouseY < yPos+9*s) { 


      stroke(255,112,3); 


      strokeWeight(5); 


    } 


            if (mouseX > xPos && mouseX < xPos+s && mouseY > yPos+9*s && mouseY < yPos+10*s) { 


      stroke(255,52,154); 


      strokeWeight(5); 


    } 


                if (mouseX > 25 && mouseX < 105 && mouseY > 510 && mouseY < 550) { 


      stroke(255,255,255); 


      strokeWeight(10); 


    } 


  } 


} 

