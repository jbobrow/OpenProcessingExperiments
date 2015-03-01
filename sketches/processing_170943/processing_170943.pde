
//Assignment: Draw a robot or an alien
int x = 0;
int y = 0;
int moveEye = 2;
int whichDirection = 1;
PImage img;
float angle = 0; 
float angle2 = 23;
float angle3 = 16;
float birdX = -40;

void setup() {
  size(500, 500);
  background(200);
  smooth();
  frameRate(15);
//  img = loadImage("prairieBackground_sm.jpg"); //load the photo
//  image(img, 0, 0);
}

void draw() {
  noStroke();
  fill(219,254,255); //light blue
  rect(0, 0, width, 288); //sky
  drawGrass();
  drawBird();
//  fill(69, 131, 81); //green ground
//  rect(0, 289, width, height); //ground
  //  background(200);
//  image(img, 0, 0); //puts the photo on the screen
  fill(15, 154, 160);         // blue fill
  stroke(0);
  ellipse(x+100, 100, 50, 50);   // head
  fill(252, 255, 100);        // yellow fill
  ellipse(x+100, 200, 50, 150);  // top of body
  rect(x+75, 200, 50, 75);       // bottom of body
  stroke(252, 255, 100);      // yellow stroke
  line(x+76, 200, x+124, 200);     // line that obscures the top of the rectangle
  fill(160, 15, 44);        // red fill
  stroke(0);                // black stroke
  ellipse(x+75, 280, 16, 16);    // left wheel
  ellipse(x+100, 280, 16, 16);   // middle wheel
  ellipse(x+125, 280, 16, 16);   // right wheel
  //  line(x+75, 280, x+83, 280);   //line on wheel
  line(x+75, 280, (x +75 + (8 * cos(angle))), (280 + (8 * sin(angle)))); //line on left wheel (x = radius * cos of the angle) (y = radius * sin of the angle)
  line(x+100, 280, (x +100 + (8 * cos(angle2))), (280 + (8 * sin(angle2)))); //line on middle wheel (x = radius * cos of the angle) (y = radius * sin of the angle)
  line(x+125, 280, (x +125 + (8 * cos(angle3))), (280 + (8 * sin(angle3)))); //line on right wheel (x = radius * cos of the angle) (y = radius * sin of the angle)
  line(x+93, 115, x+110, 113); // mouth
  fill(255);
  ellipse(x+90+moveEye, 100, 5, 5);       //left eye
  ellipse(x+110+moveEye, 100, 5, 5);      //right eye
  //  y = y+whichDirection;
  //  x = x+whichDirection;
  //  if (frameCount % 5 == 0) { //calculates whether the remainder of frameCount/5 equals 0
  //    moveEye = moveEye * -1;
  //  }
}

//void keyPressed() {
//  whichDirection = whichDirection*-1;
//}

void keyPressed() {
  if (keyCode == LEFT) {
    x = x-2;
    moveEye = -2;
    angle = angle - PI/8;
    angle2 = angle2 - PI/8;
    angle3 = angle3 - PI/8;
  }
  if (keyCode == RIGHT) {
    x = x+2;
    moveEye = 2;
    angle = angle + PI/8;
    angle2 = angle2 + PI/8;
    angle3 = angle3 + PI/8;
  }
}

void drawGrass() {
  fill(69, 131, 81); //green ground
  rect(0, 289, width, height); //ground
  fill(39, 85, 47); //darker green
  stroke(25,70,34); 
  for (int i = 10; i <= 500; i = i+20){
    for (int j = 10; j <= 500; j = j+20){
      ellipse(i, 289+j, 20, 20);
    }
  }
}

void drawBird() {
  fill(255);
  stroke(200);
  rect(birdX, 27, 20, 6);
  birdX = birdX + 3;
  if (birdX >= 550){
    birdX = random(-100,-40);
  }
}
