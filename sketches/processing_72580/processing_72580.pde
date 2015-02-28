


int weight = 0;

void setup() {
  size(400, 400);
  background(255);
}

void draw() {
 
  if(mouseX % 4 == 0) weight = 1;
  else if(mouseX % 4 == 1) weight = 4;
  else if(mouseX % 4 == 2) weight = 8;
  else if(mouseX % 4 == 3) weight = 12;
  
  strokeWeight(weight);
  
  if(mousePressed)
  {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  
}

