
void setup(){ 
  
      size(500,500); 
} 


void draw(){ 
    background(255); 
    
    noStroke(); 
    fill(0); 
    ellipseMode(CENTER); 
    ellipse(mouseX,mouseY,160,160); 
    
    noStroke(); 
    fill(0); 
    ellipseMode(CENTER); 
    ellipse(mouseX-45,mouseY-55,80,80); 
    ellipse(mouseX-70,mouseY-25,50,50); 
    ellipse(mouseX-70,mouseY-5,45,45); 
    ellipse(mouseX-70,mouseY+15,45,45); 
    ellipse(mouseX-60,mouseY+45,60,60); 
    ellipse(mouseX-30,mouseY+75,60,60); 
    ellipse(mouseX-5,mouseY+65,60,60); 
    ellipse(mouseX+25,mouseY+65,60,60); 
    ellipse(mouseX+45,mouseY+65,60,60); 
    ellipse(mouseX+65,mouseY+65,60,60); 
    ellipse(mouseX+75,mouseY+75,70,70); 
    ellipse(mouseX+65,mouseY+45,60,60); 
    ellipse(mouseX+70,mouseY+15,50,50); 
    ellipse(mouseX+50,mouseY-5,100,100); 
    ellipse(mouseX+50,mouseY-45,80,80); 
    ellipse(mouseX+75,mouseY-65,60,60); 
    ellipse(mouseX+95,mouseY-65,60,60); 

    noStroke(); 
    fill(255); 
    ellipseMode(CENTER); 
    ellipse(mouseX-25,mouseY,30,30); 
    ellipse(mouseX+55,mouseY,30,30); 

    noStroke(); 
    fill(0); 
    ellipseMode(CENTER); 
    ellipse(mouseX-25,mouseY,25,25); 
    ellipse(mouseX+55,mouseY,25,25); 

    noStroke(); 
    fill(255); 
    ellipseMode(CENTER); 
    ellipse(mouseX-25,mouseY,20,20); 
    ellipse(mouseX+55,mouseY,20,20); 

    noStroke(); 
    fill(0); 
    ellipseMode(CENTER); 
    ellipse(mouseX-25,mouseY,15,15); 
    ellipse(mouseX+55,mouseY,15,15); 

    noStroke(); 
    fill(255); 
    ellipseMode(CENTER); 
    ellipse(mouseX-25,mouseY,10,10); 
    ellipse(mouseX+55,mouseY,10,10); 
} 
