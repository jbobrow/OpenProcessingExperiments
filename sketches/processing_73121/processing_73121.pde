
/*****************************************
 ** Assignment #3
 ** Name:         Emily Chang
 ** E-mail:       echang@brynmawr.edu
 ** Course:       CS 110 - 01
 ** Submitted:    10/3/2012
 **
 **This sketch illustrates three circles hanging out on 
 **a pretty nice day, following a few clouds moving across the sky
 **with their eyes. When you hover over their faces, they get 
 **round noses that kind of make them look like characters on  
 **Sesame Street.
  
***********************************************/
//color variables
float r = random(0, 255);
float g = random(0, 255);
float b = random (0, 255);

//Monster variables
float widthMonster = random(140, 200);
float lengthMonster = random(135, 150);
//monster 1
float x1 = random(0, 150);
float y1 = random(325, 450);
//monster 2
float x2 = random(125, 325);
float y2 = random(350, 450);
//monster 3
float x3 = random(300, 450);
float y3 = random(375, 450);


//cloud variables
float widthCloud = random(110, 125);
float lengthCloud = random(75, 95);
  
void setup() {
size (500, 500);
smooth ();
}

void drawMonster1 () {
  noStroke();
  fill (r, g, 0);
  ellipse (x1, y1, widthMonster, lengthMonster);
  stroke (0);
  strokeWeight(2);
}

void drawMonster2 () {
  noStroke();
  fill (0, g, b);
  ellipse (x2, y2, widthMonster, lengthMonster);
  stroke (0);
  strokeWeight(2);
}

void   drawMonster3 () {
    noStroke();
  fill (r, 0, b);
  ellipse (x3, y3, widthMonster, lengthMonster);
  stroke (0);
  strokeWeight(2);
}

void drawCloud () {
  ellipse (mouseX, mouseY, widthCloud, lengthCloud);
  ellipse (mouseX-150, mouseY+25, widthCloud, lengthCloud);
  ellipse (mouseX+150, mouseY+25, widthCloud, lengthCloud);
}
  
void draw () {
  background (0, 200, 220);
  
  //draw a cloud that moves with the mouse
   fill(255);
   drawCloud ();
   
  //draw grass
  fill (0, 125, 50);
  noStroke();
  rect (0, 325, 500, 250);

  drawMonster1 ();
  //Draw eyes that follow cloud
     noStroke ();
      fill (255);
      ellipse (x1 + 10, y1 + 10, 30, 30);
      ellipse (x1 +45, y1 + 10, 30, 30);
      fill (0, g, b);
      float lefteyeX1 = constrain (mouseX, x1, x1 + 20);
      float lefteyeY1 = constrain (mouseY, y1, y1 + 20);
      ellipse (lefteyeX1, lefteyeY1, 9, 9);
      float righteyeX1 = constrain (mouseX, x1 + 40, x1 + 55);
      float righteyeY1 = constrain (mouseY, y1, y1 + 20);
      ellipse (righteyeX1, righteyeY1, 9, 9);
      stroke (0);
   //as mouse hovers over monster, draw a nose
  if (mouseX <= x1+(widthMonster/2) && mouseX >= x1-(widthMonster/2) && mouseY <= y1+(lengthMonster/2) && mouseY >= y1-(lengthMonster/2)) {
    fill(r, 0, 0);
    ellipse(x1+30, y1+30, 25, 30);
  }
  
  drawMonster2 ();
      noStroke ();
      fill (255);
      ellipse (x2 + 10, y2 + 10, 30, 30);
      ellipse (x2 +45, y2 + 10, 30, 30);
      fill (0);
      float lefteyeX2 = constrain (mouseX, x2, x2 + 20);
      float lefteyeY2 = constrain (mouseY, y2, y2 + 20);
      ellipse (lefteyeX2, lefteyeY2, 9, 9);
      float righteyeX2 = constrain (mouseX, x2 + 40, x2 + 55);
      float righteyeY2 = constrain (mouseY, y2, y2 + 20);
      ellipse (righteyeX2, righteyeY2, 9, 9);
      stroke (0);
   //as mouse hovers over monster, draw a nose
  if (mouseX <= x2+(widthMonster/2) && mouseX >= x2-(widthMonster/2) && mouseY <= y2+(lengthMonster/2) && mouseY >= y2-(lengthMonster/2)) {
    fill(0, g, 0);
    ellipse(x2+30, y2+30, 25, 30);
}
  drawMonster3 ();
      noStroke ();
      fill (255);
      ellipse (x3 + 10, y3 + 10, 30, 30);
      ellipse (x3 +45, y3 + 10, 30, 30);
      fill (0);
      float lefteyeX3 = constrain (mouseX, x3, x3 + 20);
      float lefteyeY3 = constrain (mouseY, y3, y3 + 20);
      ellipse (lefteyeX3, lefteyeY3, 9, 9);
      float righteyeX3 = constrain (mouseX, x3 + 40, x3 + 55);
      float righteyeY3 = constrain (mouseY, y3, y3 + 20);
      ellipse (righteyeX3, righteyeY3, 9, 9);
      stroke (0);
   //as mouse hovers over monster, draw a nose
  if (mouseX <= x3+(widthMonster/2) && mouseX >= x3-(widthMonster/2) && mouseY <= y3+(lengthMonster/2) && mouseY >= y3-(lengthMonster/2)) {
    fill(0, 0, b);
    ellipse(x3+30, y3+30, 25, 30);
  }
}
