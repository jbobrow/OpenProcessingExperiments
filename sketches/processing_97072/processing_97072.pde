
void setup() { 


  size (200, 200); 


  background (255); 


} 


  


void draw() { 


  noStroke(); 


  fill(0); 


  rect (75, 75, 50, 50); 


  fill(mouseX, mouseY, 0); 


  ellipse(mouseX, mouseY, 10, 10); 


  { 


    if (mouseX>=75 && mouseX<=125 && mouseY>=75 && mouseY<=125) 


      background(255); 


  } 


}
