

float xLast; 
float yLast; 


  
void setup() { 
  size(600, 600); 
  smooth(); 
  background(0); 

} 


void draw() { 
      noStroke(); 
    fill(210,20); 
    ellipse(mouseX, mouseY,100, 100); 
     title(); 
    xLast = pmouseX; 
    yLast = pmouseY; 


     

  } 


   





void title() { 

  fill(255); 
  textAlign(RIGHT); 
  text("EOM Hyebin, interactive Drawing with mouse, Dynamic Media, 2014", width-50, height-20); 


} 

