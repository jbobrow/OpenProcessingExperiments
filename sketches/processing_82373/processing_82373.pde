
//global_variables
float easeX, easeY, inc;

void setup() {
  
  size(400, 400);
  smooth();
  noCursor();
  strokeWeight(5);
  strokeCap(ROUND);
  easeX = width/2;
  easeY = height/2;
  inc = .07; //determines how fast an eased obeec catches up with the mouse
  
}

void draw() {
  background(0);
  
  easeBall();
  
  easeConnector();
  
  mouseBall();
 
}

void mouseBall() {
    fill(240, 172, 27); 
    ellipse(mouseX, mouseY, 30, 30);
}

void easeBall() {
  
  fill(255);
  
  //easeX += (mouseX - easeX)*inc;
  easeX = easeX + (mouseX - easeX)*inc;
  easeY = easeY + (mouseY - easeY)*inc;
  
  ellipse(easeX, easeY, 50,50);
  
}

void easeConnector() {
  
  stroke(200);
  line(mouseX, mouseY, easeX, easeY);
  noStroke();
  
  
}

