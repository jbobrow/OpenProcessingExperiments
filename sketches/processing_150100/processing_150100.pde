

float xLast; 


float yLast; 


boolean switchStroke = true; 


boolean switchRotation = true; 


boolean onOff = true; 


boolean backGround = true; 


    


    


void setup() { 


  size(600, 600); 


  smooth(); 


  background(178,204,255); 


  frameRate(15); 


} 


  


void draw()  { 


   ellipseMode(CENTER); 


   noStroke(); 


   fill(246,246,246); 


  ellipse(mouseX-30, mouseY-30, 80, 80); 
}

