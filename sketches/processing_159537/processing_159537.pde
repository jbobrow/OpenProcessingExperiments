
//reference Easing http://processing.org/examples/easing.html
float x;
float y;
float a = 0.05;

void setup() {
  size(600, 800); 
  smooth();
}

void draw() { 
  background(60);
  
  float targetX = mouseX;
  float dx = targetX - x;
  if(abs(dx) > 1) {
    x += dx * a;
  }
  
  float targetY = mouseY;
  float dy = targetY - y;
  if(abs(dy) > 1) {
    y += dy * a;
  }
  
//body green 
  stroke(104,59,255,150);
  strokeWeight(10);
  fill(135, 237, 96);
  triangle(x, y, 270, 500, 130, 425);
  triangle(x, y, 330, 500, 470, 425);
  
//body purple
  noStroke();
  fill(104, 59, 255, 150);
  triangle(x, y, 200, 600, 400, 600);
  
//feet
  stroke(104, 59, 255, 200);
  strokeWeight(10);
  noFill();
  arc(300, 580, 50, 100, HALF_PI, PI);
  arc(340, 580, 50, 100, HALF_PI, PI);
  noStroke();
  fill(135, 237, 96);

//eye arc
  stroke(104,59,255, 150);
  strokeWeight(12);
  noFill();
  arc(x, y, 160, 80, PI, TWO_PI);
  
//eyeballs
  stroke(255);
  fill(104, 59, 255);
  ellipse(x - 80, y, 25, 25);
  ellipse(x + 80, y, 25, 25);
  
//eyebrows
  noStroke();
  fill(255, 236, 64);
  triangle(x - 60, y - 20, x - 110, y - 40, x - 130, y - 70);
  triangle(x + 60, y - 20, x + 110, y - 40, x + 130, y - 70);
  fill(234, 86, 45);
  triangle(x - 60, y - 20, x - 80, y - 20, x - 130, y - 50);
  triangle(x + 60, y - 20, x + 80, y - 20, x + 130, y - 50);
  
//mouth
  fill(255, 236, 64);
  triangle(x - 40, y + 50, x + 40, y + 50, x, y + 200);
  fill(255);
  triangle(x - 40, y + 50, x - 30, y + 50, x, y + 200);
  triangle(x + 40, y + 50, x + 30, y + 50, x, y + 200);
  
//teeth
  fill(255, 157, 239);
  rect(x - 22, y + 50, 20, 20);
  rect(x + 2, y + 50, 20, 20);
  
//bow
  beginShape();
  vertex(x - 30, y + 183);
  vertex(x - 40, y + 200);
  vertex(x - 30, y + 220);
  vertex(x + 30, y + 183);
  vertex(x + 40, y + 200);
  vertex(x + 30, y + 220);
  vertex(x - 30, y + 183);
  endShape();

}



