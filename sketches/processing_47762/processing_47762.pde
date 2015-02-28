
void setup() { 

  size(200,200); 
  smooth();
}


void draw() {

  background(127); 

  ellipseMode(CENTER); 

  // draw his legs
  stroke(0); 
  line(mouseX-10,mouseY+30,85,170); 
  line(mouseX+15,mouseY+30,120,170); 

  // draw his body
  fill(220); 
  ellipse(mouseX,mouseY,80,80);
  // and the white highlight bit
  noStroke();
  fill(255); 
  ellipse(mouseX-2,mouseY-1,69,69); 

  // eyes
  noStroke(); 
  fill(0);
  ellipse(mouseX-16,mouseY-8,18,20);
  ellipse(mouseX+8,mouseY-8,18,20);

  // eye glints
  fill(255); 
  ellipse(mouseX-13,mouseY-13,4,4);
  ellipse(mouseX+11,mouseY-13,4,4);

  // nostrils
  fill(200); 
  ellipse(mouseX-6,mouseY+7,2,2); 
  ellipse(mouseX-3,mouseY+7,2,2); 

  //mouth
  stroke(0); 
  line(mouseX-10,mouseY+18,mouseX-3,mouseY+17);

  //feet
  ellipse(80,170,20,12); 
  ellipse(116,170,20,12);
}
                
