
void setup() { 
  size(500,500);
  background(245,230,250);
}

void draw() {

  float diam = random (60);
  fill(random(255), random(255), random(255),100);
  stroke(200,190,190);
  ellipse(mouseX+random(-45,0),mouseY+random(-40,0), diam,diam);
  
  ellipse(mouseX,mouseY,10,10);
  
  ellipse(mouseX+random(-25,25),mouseY+random(-25,25), 35,35);
  
  
  ellipse(mouseX+random(-50,50),mouseY+random(-50,50), 40, 40);
  
}
                
                                                
