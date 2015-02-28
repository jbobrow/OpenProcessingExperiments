

void setup()

{
  size(100, 400);

  //Background color
  fill (210, 50, 0);
  rect (1, 1, 100, 400);

  //Bottom body shape
    //Feet
    fill (210, 100, 0);
    stroke(0);
    rect (0, 375, 100, 100, 25);
    //Torso
    noStroke();
    ellipse (50, 350, 100, 100);
    stroke(0);
    arc(50, 350, 100, 100, -PI-QUARTER_PI-QUARTER_PI/2, QUARTER_PI+QUARTER_PI-QUARTER_PI/2, OPEN);
      //Hands
      noFill();
      for (int i = 345; i >= 330; i -= 5) {
        if (i != 330) {
          arc(50, i, 100, 100, QUARTER_PI, QUARTER_PI+QUARTER_PI-QUARTER_PI/2, OPEN);
          arc(50, i, 100, 100, -PI-QUARTER_PI-QUARTER_PI/2, -PI-QUARTER_PI, OPEN);
        }
        else {
          arc(50, i, 100, 100, QUARTER_PI-QUARTER_PI/3, QUARTER_PI+QUARTER_PI-QUARTER_PI/2, OPEN);
          arc(50, i, 100, 100, -PI-QUARTER_PI-QUARTER_PI/2, -PI-QUARTER_PI+QUARTER_PI/3, OPEN);
        }
      }


  //Head
  fill (210, 100, 0);
  rect(0, 0, 100, 300);

  //Chin
  arc (50, 300, 100, 25, 0, PI);

    //Chin Outline
    stroke(0);
    fill(0);
    arc (50, 300, 100, 30, 0, PI);
    fill(210, 100, 0);
    arc (50, 300, 100, 25, 0, PI);

  //Eyes
  fill(0);
  for (int i = 25; i <=75; i += 50) {
    ellipse(i, 100, 10, 10);
  }

  //Brow
  arc(50, 85, 100, 30, PI, 3*PI/1.5);

  //Nose
    //Ridge
    fill (210, 100, 0);
    arc(50, 85, 15, 10, PI, 3*PI/1.5);
    //Sides
    stroke(0);
    curve(43, -200, 43, 80, 25, 252, -100, 235);
    curve(56, -200, 56, 80, 75, 252, 200, 235);
    //Bottom
    fill(0);
    arc(50, 260, 60, 30, PI, 3*PI/1.5);
    //Splinters
    noFill();
    for (int i = 150; i <= 175; i += 25) {
      curve(43, -200+i, 42, i, 0, i+70, -100, i+75);
      curve(56, -200+i, 57, i, 100, i+70, 200, i+75);
    }
 
  //Mouth
  fill(0);
  arc(50, 280, 50, 15, PI, 3*PI/1.5);
  arc(50, 280, 50, 30, 0, PI);
  noStroke();
  fill (230, 200, 120);
  arc(50, 280, 49, 20, 0, PI);

  //Jewels
  stroke(0);
  fill (250, 100, 0);
  ellipse (50, 50, 25, 25);
  ellipse (50, 350, 40, 40);

  //Grid for Test
  /*
  noFill();
   for (int i = 0; i < 400; i += 50) {
   for (int j = 0; j < 100; j += 50) {
   rect(j, i, j+50, i+50);
   }
   }
   */
}



