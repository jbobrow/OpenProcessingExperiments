
/**********************************
 * Assignment:   #2
 * Name:         Wang Xiang
 * E-mail:       wxiang01@brynmawr.edu
 * Course:       CS 110 - Section 01
 * Submitted:    09/19/2012
 * Description:  This is a simple image of the ocean where fishes of different sizes exist.
                 When key is pressed, the color of the ocean changes and when mouse is clicked, bubbles appear.
                 Sizes of bubbles depend on bubbles' locations.
                 
 ***********************************************/

void setup() {
  size(500, 500);
  smooth();
  background(20,50,200);
  
}
void draw() {
  //fish 1 body
    fill(37, 245, 215);
    noStroke();
    ellipse(100, 200, 40, 20);

    //draw tail
    triangle(80, 200, 70, 190, 70, 210);

    // fish eye
    fill(0);
    stroke(0);
    ellipse(110, 200, 2, 2);

    //second fish
    //fish body
    fill(224, 252, 112);
    noStroke();
    ellipse(300, 250, 40, 20);

    //tail
    triangle(320, 250, 330, 230, 330, 270);

    //eye
    fill(0);
    stroke(0);
    ellipse(290, 250, 2, 2);

    //fish #3 
    fill(252, 112, 250);
    noStroke();
    ellipse(260, 160, 20, 10);

    //eye
    fill(0);
    stroke(0);
    ellipse(255, 160, 2, 2);

    //fish 4
    fill(255, 255, 255);
    noStroke();
    ellipse(340, 160, 20, 10);

    //eye
    fill(0);
    stroke(0);
    ellipse(335, 160, 2, 2);

    //fish 5
    fill(200, 55, 55);
    noStroke();
    ellipse(150, 300, 200, 50);

    //eye
    fill(55, 170, 1);
    stroke(0);
    rect(220, 300, 5, 5);

    //tail
    line(50, 300, 0, 280);
    line(50, 300, 0, 300);
    line(50, 300, 0, 320);

    //fish 6
    //body
    fill(100, 25, 55);
    noStroke();
    ellipse(400, 400, 250, 70);

    //eye
    fill(random(50), random(50), random(50));
    stroke(0);
    ellipse(300, 390, 15, 10);
  }
  
void mouseClicked() {
  if (mouseY>350) {
    strokeWeight(2);
    fill(255, 0, 0);
    float R=random(10, 20);
    ellipse(mouseX, mouseY, R, R);
  }
  else if (mouseY<=350&&mouseY>200) {
    strokeWeight(2);
    fill(255, 0, 0);
    float R=random(30, 40); 
    ellipse(mouseX, mouseY, R, R);
  } 
  else if (mouseY<200) {
    strokeWeight(2);
    fill(255, 0, 0);
    float R=random(40, 60); 
    ellipse(mouseX, mouseY, R, R);
  }
}
 void keyPressed(){
   float a=random(255);
   float b=random(255);
   float c=random(255);
   background(a,b,c);
  
}





