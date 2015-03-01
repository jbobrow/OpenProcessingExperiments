
void setup() {
  size(800, 600);
}

void draw() {
  background(255);
  fill(23, 210, 255);
  //left wing
  //arc(500, 325, 50, 225, 0, PI+QUARTER_PI, OPEN);
  arc(mouseX+100, mouseY+25, mouseX-350, mouseY-75, 0, PI+QUARTER_PI, OPEN);
  //feet
  stroke(255, 168, 36);
  fill(255, 168, 36);
  //triangle(350,500,375,400,400,500);
 
// triangle(450, 500, 375, 400, 500, 500);
  triangle(mouseX - 50, mouseY + 200, mouseX - 25, mouseY + 100, mouseX, mouseY + 200);
  triangle(mouseX+50, mouseY+200, mouseX-25, mouseY+100, mouseX+100, mouseY+200);
  //bird body
  stroke(0);
  fill(23, 210, 255);
  //ellipse(400,300,250,350);  400, 300 is the center point. to make the penguin move, calculate the differences of each of the shapes from here
  ellipse(mouseX, mouseY, 250, 350);

  //bird belly
  stroke(157, 236, 255);
  fill(255);
  ellipse(mouseX, mouseY, 125, 150);

//bird beak
  stroke(255, 168, 36);
  fill(255, 168, 36);
  //triangle(400, 250, 425, 225, 500, 250); change to below
  triangle(mouseX, mouseY - 50, mouseX + 25, mouseY - 75, mouseX + 100, mouseY - 50);

  /*stroke(0);
   line(425,250,425,275);*/

  stroke(255, 168, 36);
  fill(255, 168, 36);
  triangle(mouseX, mouseY - 50, mouseX + 25, mouseY - 25, mouseX + 50, mouseY - 25);
 // triangle(400, 250, 425, 275, 450, 275);

  //bird eyes
  stroke(255);
  fill(0);
  ellipse(mouseX, mouseY - 100, 15, 15);
  ellipse(mouseX + 50, mouseY - 100, 13, 13);
//  ellipse(400, 200, 15, 15);
//  ellipse(450, 200, 13, 13);

//bird brows
  stroke(0);
//  line(390, 175, 410, 180);
//  line(440, 180, 460, 175);
  line(mouseX-10, mouseY-125, mouseX + 10, mouseY - 120);
  line(mouseX+40, mouseY-120, mouseX + 60, mouseY - 125);

  stroke(0);
  fill(23, 210, 255);
 // arc(320, 350, 50, 225, 0, PI+QUARTER_PI, OPEN);
  arc(mouseX-80, mouseY+50, mouseX-350, mouseY-75, 0, PI+QUARTER_PI, OPEN);
}



