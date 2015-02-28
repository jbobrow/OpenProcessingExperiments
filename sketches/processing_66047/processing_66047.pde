
// Glendon  Manhattan Bridge Group Day 2 Homework
// Mondrian in Motion


float[] vert = new float[8]; //vert and horiz line positions
float[] horiz = new float[5];
float[] vMove = new float[8];//vert and horiz motion;
float[] hMove = new float[5];
boolean moveIt = false;

void setup() {
  size (300, 330);
  background(255);
  vert[0] = 20; // set initial values to match Mondrian
  vert[1] = 94;
  vert[2] = 132;
  vert[3] = 206;
  vert[4] = 217;
  vert[5] = 234;
  vert[6] = 258;
  vert[7] = 291;
  horiz[0] = 31;
  horiz[1] = 117;
  horiz[2] = 197;
  horiz[3] = 253;
  horiz[4] = 315;

  for (int i = 0; i < 5 ; i++) { // set initial speeds
    hMove[i] = random(-1, 1);
  }
  for (int i = 0; i < 8 ; i++) {
    vMove[i] = random(-1, 1);
  }
}

void draw() {
  background(255);
  noStroke();  //draw the colored rectangles first
  fill (203, 32, 12); //red 
  rect (0, 0, vert[0], horiz[0]);
  rect (0, horiz[0], vert[0], (horiz[1]-horiz[0])/2.5);
  float diff = horiz[2]-horiz[1];
  rect (0, horiz[2] - diff/3.7, vert[0], diff/3.7);
  rect (vert[6], horiz[1]+diff/2.2, vert[7]-vert[6], diff/3.3);

  fill(251, 197, 10); //yellow
  rect(vert[1], horiz[1], vert[2]-vert[1], horiz[2]-horiz[1]);

  fill(44, 60, 175);//blue
  rect(vert[1], 0, vert[2]-vert[1], horiz[0]);
  rect(vert[6], horiz[4], width-vert[6], height-horiz[4]);
  stroke(0);
  strokeWeight(9); //horixontal lines  + or - 2 so the ends don't stick out
  line (0, horiz[0], vert[7]-2, horiz[0]);
  line (vert[0]+2, horiz[1], vert[7]-2, horiz[1]);
  line (0, horiz[2], width, horiz[2]);
  line (vert[3]+2, horiz[3], width, horiz[3]);
  line (vert[1]+2, horiz[4], width, horiz[4]);

  //vertical lines
  strokeWeight (7);
  line (vert[0], 0, vert[0], horiz[2]);
  line (vert[1], 0, vert[1], height);
  line (vert[2], 0, vert[2], horiz[2]);  
  line (vert[3], 0, vert[3], height);
  line (vert[4], 0, vert[4], height);
  line (vert[5], 0, vert[5], horiz[4]);
  line (vert[6], 0, vert[6], height);
  line (vert[7], 0, vert[7], horiz[2]);

  if (moveIt) {
    for (int i= 0; i < 5; i++) { // check to see if horizontal lines collide or go 
      //off screen and reverse directions if needed
      if ((horiz[i] + hMove [i]) < 0) {
        hMove[i] *= -1;
      }
      if (i > 0 && (horiz[i] + hMove[i]) < horiz[i-1]) {
        hMove[i] *= -1;
      }
      if (i < 4 && (horiz[i] + hMove[i]) > horiz[i+1]) {
        hMove[i] *= -1;
      }
      if ((horiz[i] + hMove [i]) > height) {
        hMove[i] *= -1;
      }
    }
    for (int i= 0; i < 8; i++) { // check to see if vertical lines collide or go 
      //off screen and reverse directions if needed
      if ((vert[i] + vMove [i]) < 0) {
        vMove[i] *= -1;
      }
      if (i > 0 && (vert[i] + vMove[i]) < vert[i-1]) {
        vMove[i] *= -1;
      }
      if (i < 7 && (vert[i] + vMove[i]) > vert[i+1]) {
        vMove[i] *= -1;
      }
      if ((vert[i] + vMove [i]) > width) {
        vMove[i] *= -1;
      }
    }

    for (int i= 0; i < 5; i++) {  // now move the lines
      horiz[i] += hMove[i];
    }
    for (int i= 0; i < 8; i++) { 
      vert[i] += vMove[i];
    }
  }
}

void keyPressed() {
  if (key == ' ') { // spacebar toggles motion
    moveIt = !moveIt;
  } 
  if (key == 'r') {
    moveIt = false;
    vert[0] = 20; // reset values to match Mondrian
    vert[1] = 94;
    vert[2] = 132;
    vert[3] = 206;
    vert[4] = 217;
    vert[5] = 234;
    vert[6] = 258;
    vert[7] = 291;
    horiz[0] = 31;
    horiz[1] = 117;
    horiz[2] = 197;
    horiz[3] = 253;
    horiz[4] = 315;

    for (int i = 0; i < 5 ; i++) { // set new speeds
      hMove[i] = random(-1, 1);
    }
    for (int i = 0; i < 8 ; i++) {
      vMove[i] = random(-1, 1);
    }
  }
}


