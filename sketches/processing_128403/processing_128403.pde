
void setup() {
  size(200, 200);
  background(0, 255, 0);
}

//mover o rato

void draw() {
  background(219, 250, 249);
  smooth();
  noCursor();
  
 //corpo
   rectMode(CENTER);
  stroke(0);
  fill(150);
  rect(mouseX, mouseY, 20, 80);
  
 //cara
  ellipseMode(CENTER);
  stroke(0);
  fill(255);
  ellipse(mouseX, mouseY-40, 60, 60);
 //olhos
  noStroke();
  fill(0);
  ellipse(mouseX-20, mouseY-40, 15, 30);
  ellipse(mouseX+20, mouseY-40, 15, 30);
 //braços
  stroke(0);
  line(mouseX-10, mouseY+40, mouseX-20, mouseY+50);
  line(mouseX+10, mouseY+40, mouseX+20, mouseY+50); 

//relva
fill(0, 255, 0);
triangle(0, 200, 10, 200, 5, 190);
triangle(10, 200, 20, 200, 15, 190);
triangle(20, 200, 30, 200, 25, 190);
triangle(30, 200, 40, 200, 35, 190);
triangle(40, 200, 50, 200, 45, 190);
triangle(50, 200, 60, 200, 55, 190);
triangle(60, 200, 70, 200, 66, 190);
triangle(70, 200, 80, 200, 75, 190);
triangle(80, 200, 90, 200, 85, 190);
triangle(90, 200, 100, 200, 95, 190);
triangle(100, 200, 110, 200, 105, 190);
triangle(110, 200, 120, 200, 115, 190);
triangle(120, 200, 130, 200, 125, 190);
triangle(130, 200, 140, 200, 135, 190);
triangle(140, 200, 150, 200, 145, 190);
triangle(150, 200, 160, 200, 155, 190);
triangle(160, 200, 170, 200, 165, 190);
triangle(170, 200, 180, 200, 175, 190);
triangle(180, 200, 190, 200, 185, 190);
triangle(190, 200, 200, 200, 195, 190);

}



