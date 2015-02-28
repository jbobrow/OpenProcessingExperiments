
//Sam Legros, Exercise 3, Question 1

void setup() {
  size(400, 400);
  //noStroke();
}

//------------------------------------------------------

void draw() {

int eye1x = mouseX-7;
int eye1y = mouseY-5;
int eye2x = mouseX+7;
int eye2y = mouseY-5;
int smilex = mouseX-2;
int smiley = mouseY+10;
  
  background(100, 189, 255);
  fill(255, 247, 0);
  ellipse(mouseX, mouseY, 50, 50);
  ellipse(eye1x, eye1y, 10, 10);
  ellipse(eye2x, eye2y, 10, 10);
  arc(smilex, smiley, 20, 10, 0, PI+QUARTER_PI, OPEN);
  fill(198, 0, 3);
  rect(160, 200, 80, 100);
  fill(100, 100, 100);
  triangle(width/2, 130, 160, 200, 240, 200);
  fill(0);
  rect(190, 250, 20, 60);
  rect(170, 215, 20, 20);
  rect(210, 215, 20, 20);
  fill(44, 183, 52);
  ellipse(200, 450, 500, 350);
  noFill();


  if (mouseX > width/2) {
    background(0);
    
    fill(255, 247, 0);
    ellipse(10, 200, 10, 10);
    ellipse(46, 98, 10, 10);
    ellipse(111, 12, 10, 10);
    ellipse(70, 137, 10, 10);
    ellipse(205, 80, 10, 10);
    ellipse(333, 189, 10, 10);
    ellipse(288, 100, 10, 10);
    ellipse(378, 226, 10, 10);
    ellipse(120, 235, 10, 10);
    ellipse(380, 22, 10, 10);
    ellipse(300, 57, 10, 10);
    ellipse(290, 260, 10, 10);
    
    fill(229, 229, 229);
    ellipse(mouseX, mouseY, 40, 40);
    ellipse(eye1x, eye1y, 10, 10);
    ellipse(eye2x, eye2y, 10, 10);
    arc(smilex, smiley, 20, 10, 0, PI+QUARTER_PI, OPEN);
    fill(149, 0, 2);
    rect(160, 200, 80, 100);
    fill(60, 60, 60);
    triangle(width/2, 130, 160, 200, 240, 200);
    fill(0);
    rect(190, 250, 20, 60);
    fill(255, 247, 0);
    rect(170, 215, 20, 20);
    rect(210, 215, 20, 20);
    fill(20, 85, 23);
    ellipse(200, 450, 500, 350);
  }
}




