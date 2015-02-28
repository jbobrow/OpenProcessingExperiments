
void setup() {
  size(500, 500);
  background(250, 250, 250);
};

void draw() {

  //horizontal
  line(0, height*.5, width, height*.5);
  //top left vertical
  line(width*.25, 0, width*.25, height*.5);
  //bottom right vertical
  line(width*.75, height*.5, width*.75, height);
  
if ((mouseX > width*.25) && (mouseY < height*.5)) {
  
  noStroke();
  fill(255, 186, 0);
    ellipse(300, 40, 15, 15);
    fill(0 , 192, 255);
    ellipse(220, 100, 30, 30);
    fill(240, 255, 0);
    ellipse(300, 120, 50, 50);
    fill(190, 138, 255);
    ellipse(400, 47, 60, 60);
    fill(152, 238, 60);
    ellipse(190, 190, 67, 67);
    fill(0, 16, 110);
    ellipse(160, 30, 20, 20);
    fill(251, 18, 0);
    ellipse(450, 220, 40, 40);
    fill(83, 249, 200);
    ellipse(350, 200, 30, 30);
  }

if ((mouseX > width*.75) && (mouseY > height*.5)) {
  noStroke();
  fill(0, 0, 0);
  rect(390, 300, 15, 15);
  fill(0, 0, 0);
  rect(450, 400, 15, 15);
  fill(0, 0, 0);
  rect(450, 475, 15, 15);
  fill(0, 0, 0);
  rect(450, 300, 15, 15);
  fill(0, 0, 0);
  rect(450, 450, 15, 15);
  fill(0, 0, 0);
  rect(410, 410, 15, 15);
  fill(0, 0, 0);
  rect(410, 470, 15, 15);
  fill(0, 0, 0);
  rect(380, 350, 15, 15);
  fill(0, 0, 0);
  rect(400, 375, 15, 15);
  fill(0, 0, 0);
  rect(410, 270, 15, 15);
  fill(0, 0, 0);
  rect(480, 280, 15, 15);
  fill(0, 0, 0);
  rect(450, 450, 15, 15);
}

if ((mouseX < width*.25) && (mouseY < height*.5)) {
  noStroke();
  fill(0, 0, 0);
  rect(100, 100, 15, 15);
  fill(0, 0, 0);
  rect(100, 200, 15, 15);
  fill(0, 0, 0);
  rect(50, 100, 15, 15);
  fill(0, 0, 0);
  rect(25, 25, 15, 15);
  fill(0, 0, 0);
  rect(30, 200, 15, 15);
}

if ((mouseX < width*.75) && (mouseY > height*.5)) {
  noStroke();
  fill(255, 186, 0); //orange
    ellipse(100, 300, 15, 15);
    fill(0 , 192, 200); //blue
    ellipse(200, 400, 30, 30);
    fill(450, 255, 0); //yellow
    ellipse(50, 340, 50, 50);
    fill(190, 138, 255); //purple
    ellipse(300, 500, 100, 100);
    fill(152, 238, 60); //green
    ellipse(70, 450, 67, 67);
    fill(0, 16, 110); //navy
    ellipse(160, 300, 20, 20);
    fill(251, 18, 0); //red
    ellipse(350, 275, 40, 40);
    fill(83, 249, 200); //aqua
    ellipse(310, 375, 30, 30);
}

}
