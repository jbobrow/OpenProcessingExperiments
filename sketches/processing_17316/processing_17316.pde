

void setup(){
  size(900, 500);
  background(77, 29, 29);
  smooth();
}

void draw(){
 background(map(mouseY, 0, 500, 0, 100), 29, 29);
  stroke(255);
  strokeWeight(random(0,10));
  line(0, 0, mouseX, mouseY);
  
  
  stroke(255);
  strokeWeight(map(mouseY, 0, 500, 1, 10));
  line(100, 0, mouseX, mouseY);
  
   
  stroke(255);
  strokeWeight(map(mouseY, 0, 500, 1, 10));
  line(200, 0, mouseX, mouseY);

  
  stroke(255);
  strokeWeight(map(mouseY, 0, 500, 1, 10));
  line(300, 0, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(map(mouseY, 0, 500, 1, 10));
  line(400, 0, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(map(mouseY, 0, 500, 1, 10));
  line(500, 0, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(map(mouseY, 0, 500, 1, 10));
  line(600, 0, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(map(mouseY, 0, 500, 1, 10));
  line(700, 0, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(map(mouseY, 0, 500, 1, 10));
  line(800, 0, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(map(mouseY, 0, 500, 1, 10));
  line(900, 0, mouseX, mouseY);
  
  
// bottom rows of strokes
  stroke(255);
  strokeWeight(random(0,5));
  line(0, 500, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(random(0,5));
  line(100, 500, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(random(0,5));
  line(200, 500, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(random(0,5));
  line(300, 500, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(random(0,5));
  line(400, 500, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(random(0,5));
  line(500, 500, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(random(0,5));
  line(600, 500, mouseX, mouseY);

  stroke(255);
  strokeWeight(random(0,5));
  line(700, 500, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(random(0,5));
  line(800, 500, mouseX, mouseY);
  
  stroke(255);
  strokeWeight(random(0,5));
  line(900, 500, mouseX, mouseY);
  
  
  fill(29, 77, 71, 180);
  noStroke();
  ellipse(mouseX, mouseY, 100, 100);
  
  fill(29, 77, 71, 180);
  noStroke();
  ellipse(mouseX, mouseY, 200, 200);
  
  noFill();
  strokeWeight(1);
  stroke(255, 100);
  ellipse(mouseX, mouseY, 300, 300);
}


