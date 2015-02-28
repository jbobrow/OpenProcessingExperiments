
void setup() {
  size(400, 400);
  background(255);
  smooth();
}


void draw() {
  noStroke();
  fill(255);
  rect(0, 0, width, height);
  
  // pallini noisy
  noStroke();
  fill(0);
  ellipse(26, 26, 25, 25); 
  
  noStroke();
  fill(0);
  ellipse(80, 26, 51, 51); 
  
  noStroke();
  fill(0);
  ellipse(140, 28, 30, 30); 

  noStroke();
  fill(0);
  ellipse(110, 93, 40, 40);
 
  noStroke();
  fill(0);
  ellipse(173, 44, 30, 30);  
  
  noStroke();
  fill(0);
  ellipse(45, 93, 40, 40);
 
  noStroke();
  fill(0);
  ellipse(27, 160, 40, 40);   
  
  noStroke();
  fill(0);
  ellipse(25, 29, 40, 40);
  
  noStroke();
  fill(0);
  ellipse(150, 170, 80, 80);
  
  noStroke();
  fill(0);
  ellipse(65, 170, 15, 15);
  
  noStroke();
  fill(0);
  ellipse(275, 50, 70, 70);
  
  noStroke();
  fill(0);
  ellipse(200, 100, 52, 52);
  
  noStroke();
  fill(0);
  ellipse(50, 220, 48, 48);
  
  noStroke();
  fill(0);
  ellipse(220, 45, 15, 15);
  
  //cambio colore
  if(mousePressed) {
  stroke(0);
  strokeWeight(1);
  fill(255);
  ellipse(26, 26, 25, 25); 
  
  ellipse(80, 26, 51, 51); 
  
  ellipse(140, 28, 30, 30); 

  ellipse(110, 93, 40, 40);
 
  ellipse(173, 44, 30, 30);  
  
  ellipse(45, 93, 40, 40);

  ellipse(27, 160, 40, 40);   
  
  ellipse(25, 29, 40, 40);
  
  ellipse(150, 170, 80, 80);

  ellipse(65, 170, 15, 15);

  ellipse(275, 50, 70, 70);
  
  ellipse(200, 100, 52, 52);

  ellipse(50, 220, 48, 48);
  
  ellipse(220, 45, 15, 15);
  }


  //quad
  stroke(0);
  strokeWeight(3);
  fill(0);
  quad(mouseX, mouseY, 0, height, width, height, width, 0);
  
  //triangle
  fill(0);
  triangle(0, height, height, width, width, 0);
  
  // pallino nero
  noStroke();
  fill(255);
  ellipse(300, 300, 25, 25);  
}

