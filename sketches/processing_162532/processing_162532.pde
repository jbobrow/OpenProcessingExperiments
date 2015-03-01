

int xPos = 150;
int xPos1 = 120;
int xPos2 = 90;
int xPos3 = 60;
int xPos4 = 20;

int yPos = 200;
int yPos1 = 200;
int yPos2 = 200;
int yPos3 = 200;
int yPos4 = 210;
int yPos5 = 350;

int W = 30;
int H = 5;





int W2 = 30;


void setup() {

  size(800, 600);
  background(240);
  fill(0);
  rect(200, 0, 600, 600);

  for (int i = 1; i < width; i+=H) {

    pushMatrix();
    fill(255, i/1.5, 100);
    noStroke();
    rect(xPos, i+yPos, W, H);
    popMatrix();

    pushMatrix();
    fill(150, i/1.5, 120);
    noStroke();
    rect(xPos1, i+yPos1, W, H);
    popMatrix();

    pushMatrix();
    fill(80, i/1.5, 180);
    noStroke();
    rect(xPos2, i+yPos2, W, H);
    popMatrix();

    pushMatrix();
    fill(30, i/1.5, 220);
    noStroke();
    rect(xPos3, i+yPos3, W, H);
    popMatrix();

    fill(170);   
    rect(xPos4, yPos4-50, W, W);
    rect(xPos4, yPos4, W, W);
    rect(xPos4, yPos4+40, W, W);
    rect(xPos4, yPos4+40+40, W, W);
    rect(xPos4, yPos5, W, W);
    rect(xPos4, yPos5+40, W, W);
    rect(xPos4, yPos5+80, W, W);
    rect(xPos4, yPos5+120, W, W);

    fill(255);
    ellipse(xPos4+15, yPos4+15, 5, 5);
    ellipse(xPos4+15, yPos4+15+40, 10, 10);
    ellipse(xPos4+15, yPos4+15+40+40, 20, 20);

    stroke(0);
    strokeWeight(3);
    line(xPos4+25, yPos4-25, xPos4+5, yPos4-40-5);
    stroke(0);
    strokeWeight(2);
    line(xPos4+5, yPos4-25, xPos4+25, yPos4-40-5);

    line(xPos4+10, yPos5+15, xPos4+20, yPos5+15);
    ellipse(xPos4+15, yPos5+40+15, 10, 10);
    rect(xPos4+10, yPos5+40+50, 10, 10);
    triangle(xPos4+10, yPos5+140, xPos4+5+10, yPos5-8+140, xPos4+10+10, yPos5+140);
  }
}
void draw() {





  if (mousePressed) {

    if (mouseX >220  && mouseX <780  && mouseY >20 && mouseY <580 ) {
      fill(0);
      ellipse(mouseX, mouseY, 10, 10);
    }

    for (int a = 1; a <width; a+=H) {
      if (mouseX >xPos  && mouseX <xPos+W  && mouseY >yPos+a && mouseY <yPos+a+H ) {
        stroke(255, a/1.5, 100);
      } 
      if (mouseX >xPos1  && mouseX <xPos1+W  && mouseY >yPos1+a && mouseY <yPos1+a+H ) {
        stroke(150, a/1.5, 120);
      }
      if (mouseX >xPos2  && mouseX <xPos2+W  && mouseY >yPos2+a && mouseY <yPos2+a+H ) {
        stroke(80, a/1.5, 180);
      }
      if (mouseX >xPos3  && mouseX <xPos3+W  && mouseY >yPos3+a && mouseY <yPos3+a+H ) {
        stroke(30, a/1.5, 220);
      }

      if (mouseX >xPos4  && mouseX <xPos4+W  && mouseY >yPos4 && mouseY <yPos4+W ) {
        strokeWeight(5);
      }
      if (mouseX >xPos4  && mouseX <xPos4+W  && mouseY >yPos4+40 && mouseY <yPos4+W+W+40 ) {
        strokeWeight(10);
      }  
      if (mouseX >xPos4  && mouseX <xPos4+W  && mouseY >yPos4+40+40 && mouseY <yPos4+W+W+W+40 ) {
        strokeWeight(20);
      }
      if (mouseX >xPos4  && mouseX <xPos4+W  && mouseY >yPos4-50 && mouseY <yPos4-20 ) {
        stroke(0);
        strokeWeight(30);
      }
    }
  }
}

