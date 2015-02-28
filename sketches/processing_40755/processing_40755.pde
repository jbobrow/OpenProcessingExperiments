
void setup() {
  size(400, 400);
  smooth();
}

void draw() {
  
    background(255, 3);

 
  if(mouseY > 220){ 
  noStroke();
  fill(0); 
  rect(170, 180, 60, 70);
  triangle(200, 350, 300, 250, 100, 250);} 
  
  if(mouseY < 180){ 
  noStroke();
  fill(0); 
  rect(170, 150, 60, 70);
  triangle(200, 50, 300, 150, 100, 150);}
  
  
  
  
  /*
  noStroke();
  fill(255);
  ellipse(360, 310, 30, 30);
  ellipse(310, 360, 30, 30);
  rect(320, 320, 80, 80);

  fill(0);
  rect(mouseX, mouseY, 82, 82);
  ellipse(mouseX+40, mouseY-8, 32, 32);
  ellipse(mouseX-10, mouseY+42, 32, 32);
  */
  
}


