
void setup() {
 size(500,700);
 smooth();
}

void draw() {
  background(255, 255, 170);
  
  noStroke();
  fill(50, 255, 100);
  ellipse(250, 650, 300, 80);
  fill(0,0,0,0);
  
  smooth();
  strokeWeight(4);
  stroke(0,170,100);
  arc(290, 500, 120, 800, 3.14159, 4.65);
  arc(310, 500, 120, 600, 3.14159, 4.5);
  arc(330, 500, 120, 400, 3.14159, 4.3);
  arc(210, 500, 120, 800, 4.85, 2*3.14159);
  arc(190, 500, 120, 600, 5, 2*3.14159);
  arc(170, 500, 120, 400, 5.2, 2*3.14159);
  
  noStroke();
  
  fill(200, 100, 50);
  ellipse(160, 325, 60, 25);
  ellipse(220, 325, 60, 25);
  ellipse(190, 355, 25, 60);
  ellipse(190, 295, 25, 60);
  
  fill(200, 50, 255);
  ellipse(170, 215, 60, 20);
  ellipse(230, 215, 60, 20);
  ellipse(200, 245, 20, 60);
  ellipse(200, 185, 20, 60);
  
  fill(150, 150, 255);
  ellipse(180, 105, 60, 15);
  ellipse(240, 105, 60, 15);
  ellipse(210, 75, 15, 60);
  ellipse(210, 135, 15, 60);
  
  fill(255, 150, 170);
  ellipse(260, 95, 60, 15);
  ellipse(320, 95, 60, 15);
  ellipse(290, 65, 15, 60);
  ellipse(290, 125, 15, 60);
 
  fill(255, 205, 50);
  ellipse(270, 205, 60, 20);
  ellipse(330, 205, 60, 20);
  ellipse(300, 175, 20, 60);
  ellipse(300, 235, 20, 60);
 
  fill(55, 150, 255);
  ellipse(280, 315, 60, 25);
  ellipse(340, 315, 60, 25);
  ellipse(310, 280, 25, 60);
  ellipse(310, 345, 25, 60);
 
  fill(0,170,100);
  ellipse(190, 325, 20,20);
  ellipse(200, 215, 20,20);
  ellipse(210, 105, 20,20);
  ellipse(290, 95, 20,20);
  ellipse(300, 205, 20,20);
  ellipse(310, 315, 20,20);
  
  noStroke();
  fill(0,0,255);
  beginShape();
  vertex(200, 500);
  bezierVertex(300, 550, 100, 625, 225, 675);
  vertex(275, 675);
  bezierVertex(400, 625, 200, 550, 300, 500);
  vertex(200,500);
  endShape();
  
  
}

