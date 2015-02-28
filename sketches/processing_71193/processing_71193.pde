
//stability + chaos project

void setup() {
  size(700, 700);
  background(0);
  smooth();
}

void draw() {
  frameRate(map(mouseY, 500, 700, 1, 500));
  background(map(mouseY, 0, 700, 255, 0));
  //constrain(mouseX, 300, 400);
 
    if (mousePressed == true) {
    background(random(0, 255), random(0, 230), random(0, 153));
  }
  
  //spikes of DEATH
  noStroke();
  fill(map(mouseY, 300, 700, 230, 255), map(mouseX, 300, 700, 240, 0), map(mouseX, 300, 700, 230, 0));
  triangle(1, 700, 25, map(mouseY, 600, 700, 100, 600), 50, 700);
  triangle(50, 700, 75, map(mouseY, 600, 700, 100, 600), 100, 700);
  triangle(100, 700, 125, map(mouseY, 600, 700, 100, 600), 150, 700);
  triangle(150, 700, 175, map(mouseY, 600, 700, 100, 600), 200, 700);
  triangle(200, 700, 225, map(mouseY, 600, 700, 100, 600), 250, 700);
  triangle(250, 700, 275, map(mouseY, 600, 700, 100, 600), 300, 700);
  triangle(300, 700, 325, map(mouseY, 600, 700, 100, 600), 350, 700);
  triangle(350, 700, 375, map(mouseY, 600, 700, 100, 600), 400, 700);
  triangle(400, 700, 425, map(mouseY, 600, 700, 100, 600), 450, 700);
  triangle(450, 700, 475, map(mouseY, 600, 700, 100, 600), 500, 700);
  triangle(500, 700, 525, map(mouseY, 600, 700, 100, 600), 550, 700);
  triangle(550, 700, 575, map(mouseY, 600, 700, 100, 600), 600, 700);
  triangle(600, 700, 625, map(mouseY, 600, 700, 100, 600), 650, 700);
  triangle(650, 700, 675, map(mouseY, 600, 700, 100, 600), 700, 700);
  //end spikes of DEATH
 
  noFill();
  strokeWeight(mouseY/100);
  stroke(map(mouseY, 0, 700, 0, 255), 0, 0);
  beginShape();
  vertex(mouseX, mouseY);
  vertex(mouseX+((mouseY)/2), mouseY-((random(1, 200))/2));
  vertex(mouseX-((random(1, 200))/2), mouseY+((random (1, 200))/2));
  vertex(mouseX, mouseY+(random (1, 100)));
  endShape();
  

 
  //smooth
  smooth();
}

//sobs
