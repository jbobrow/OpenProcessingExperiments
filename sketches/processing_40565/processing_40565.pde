
void setup() {
  size(400, 400);
  
  smooth();
}

void draw() {
    
  noStroke();
  fill(200, 80);
  rect(0, 0, width, height);
  
  stroke(0);
  
  //IF doesn't work if there's nothing to change
  if(mousePressed){
    stroke(255);
    strokeWeight(3);
    ellipse(width/2, height/2, 250, 250);
    noStroke();
  }
  else{
    
  strokeWeight(0.5);
  triangle(mouseX, mouseY, 15, 90, mouseY, 32);
  strokeWeight(1);
  triangle(15, 90, mouseX, mouseY, 63, 19);
  strokeWeight(0.3);
  triangle(46, 29, 89, 65, mouseX, mouseY);
  strokeWeight(0.8);
  triangle(90, mouseY, 20, 65, mouseX, 2);
  strokeWeight(0.2);
  triangle(56, 35, mouseY, 89, 3, mouseX);
  strokeWeight(0.4);
  triangle(78, 55, 23, mouseX, 9, mouseY);
  strokeWeight(0.9);
  triangle(mouseY, 300, 150, 89, 35, 60);
  strokeWeight(0.2);
  triangle(200, mouseX, 180, mouseY, 130, 78);
  
  }
}
                
