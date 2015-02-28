
/*
  Todo:
 - refine gameplay to be more consistent w/original
 */

Frogger f;
Mover [] movers, Row1, Row2, Row3, Row4, Row5;
Pad [] row1, row2, row3, row4, row5;

color Frogger_green = color(0, 255, 0);
color bark = color(139, 69, 19);
color wood = color(255, 222, 179);

boolean dead, won, jumping, onLillyPad;
boolean onLillyPad1, onLillyPad2, onLillyPad3, onLillyPad4, onLillyPad5;
//set the number of player lives at 3
int lives = 3;
int count = 0;
int counter = 0;

PFont font;
PFont myFont;

void setup() {
  size(400, 540);
  rectMode(CENTER);
  ellipseMode(CENTER);

  font = loadFont("Helvetica-48.vlw");
  textFont(font, 48);
  textAlign(CENTER, CENTER);
  
  /*myFont = loadFont("Helvetica-12.vlw");
  textFont(font, 12);
  textAllign(CENTER, CENTER);*/

  //set up the frog
  f = new Frogger(width/2, height-25);

  //initlialize the lillypads/logs/etc.
  //row 1
  row1 = new Pad[15];
  int inc = -50;
  int k = 2;
  while (k < row1.length) {
    row1[k-2] = new Pad(inc, 230, 1, -1);
    row1[k-1] = new Pad(inc+30, 230, 1, -1);
    row1[k] = new Pad(inc+60, 230, 1, -1);
    inc += 110;
    k += 3;
  }

  //row 2
  row2 = new Pad[3];
  inc = (width/2)-150;
  for (int i = 0; i < row2.length; i++) {
    row2[i] = new Pad(inc, 190, 2, .5);
    inc += (width/2)+150;
  }

  //row 3
  row3 = new Pad[2];
  inc = width/5;
  for (int i = 0; i < row3.length; i++) {
    row3[i] = new Pad(inc, 150, 3, 1);
    inc += (width/5)*3;
  }

  //row 4
  row4 = new Pad[8];
  inc = 50;
  int j = 1;
  while (j < row4.length) {
    row4[j-1] = new Pad(inc, 110, 1, -1);
    row4[j] = new Pad(inc+30, 110, 1, -1);
    inc += 90;
    j += 2;
  }


  //row 5
  inc = width/8;
  row5 = new Pad[3];
  for (int i = 0; i < row5.length; i++) {
    row5[i] = new Pad(inc, 70, 4, 1);
    inc += (width/8)*3;
  }

  //initialize the cars
  //row 1
  inc = (width/2)-45;
  Row1 = new Mover[3];
  for (int i = 0; i < Row1.length; i++) {
    Row1[i] = new Mover(inc, 470, 2, -1);
    inc += 120;
  }

  //row 2
  inc = (width/2)-15;
  Row2 = new Mover[2];
  for (int i = 0; i < Row2.length; i++) {
    Row2[i] = new Mover(inc, 430, 2, 1);
    inc += 120;
  }

  //row 3
  inc = (width/2)-35;
  Row3 = new Mover[3];
  for (int i = 0; i < Row3.length; i++) {
    Row3[i] = new Mover(inc, 390, 2, -1);
    inc += 100;
  }

  //row 4
  Row4 = new Mover[1];
  for (int i = 0; i < Row4.length; i++) {
    Row4[i] = new Mover(-30, 350, 2, 1);
  }

  //row 5
  inc = (width/2);
  Row5 = new Mover[2];
  for (int i = 0; i < Row5.length; i++) {
    Row5[i] = new Mover(inc, 310, 1, -1);
    inc += 190;
  }
}

void draw() {
  //road
  background(50);
  //pond
  fill(0, 0, 255);
  noStroke();
  rect(width/2, height/4, width, height/2);
  rect(width/2, 20, 50, 10);
  //grass (start area, median, end area)
  fill(34, 100, 34);
  rect(width/2, 20, width, 40);
  rect(width/2, height/2, width, 40);
  rect(width/2, height-20, width, 40);
  //ending areas
  fill(0, 0, 255);
  noStroke();
  rect(width/2-160, 25, 40, 30);
  rect(width/2-80, 25, 40, 30);
  rect(width/2, 25, 40, 30);
  rect(width/2+80, 25, 40, 30);
  rect(width/2+160, 25, 40, 30);

  //lillpads
  for (int i = 0; i < row1.length; i++) {
    row1[i].display();
    row1[i].current();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, row1[i].x+12.5, row1[i].y+10, 25, 20)) {
      onLillyPad1 = true;
      onLillyPad2 = false;
      onLillyPad3 = false;
      onLillyPad4 = false;
      onLillyPad5 = false;
      f.x += row1[i].direction;
    }
    else {
      //onLillyPad1 = false;
    }
  }

  //row 2
  for (int i = 0; i < row2.length; i++) {
    row2[i].current();
    row2[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, row2[i].x-30, row2[i].y-10, 60, 20)) {
      onLillyPad1 = false;
      onLillyPad2 = true;
      onLillyPad3 = false;
      onLillyPad4 = false;
      onLillyPad5 = false;
      f.x += row2[i].direction;
    }
    else {
      //onLillyPad2 = false;
    }
  }

  //row 3
  for (int i = 0; i < row3.length; i++) {
    row3[i].current();
    row3[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, row3[i].x-50, row3[i].y-10, 100, 20)) {
      onLillyPad1 = false;
      onLillyPad2 = false;
      onLillyPad3 = true;
      onLillyPad4 = false;
      onLillyPad5 = false;
      f.x += row3[i].direction;
      
    }
    else {
      //onLillyPad3 = false;
    }
  }

  //row 4
  for (int i = 0; i < row4.length; i++) {
    row4[i].current();
    row4[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, row4[i].x-12.5, row4[i].y-10, 25, 20)) {
      onLillyPad1 = false;
      onLillyPad2 = false;
      onLillyPad3 = false;
      onLillyPad4 = true;
      onLillyPad5 = false;
      f.x += row4[i].direction;
      
    }
    else {
      //onLillyPad4 = false;
    }
  }

  //row 5
  for (int i = 0; i < row5.length; i++) {
    row5[i].current();
    row5[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, row5[i].x-40, row5[i].y-10, 80, 20)) {
      onLillyPad1 = false;
      onLillyPad2 = false;
      onLillyPad3 = false;
      onLillyPad4 = false;
      onLillyPad5 = true;
      f.x += row5[i].direction;
      
    }
    else {
      //onLillyPad5 = false;
    }
  }

  //if player is in the water, take away a life
  if (!onLillyPad1 && !onLillyPad2 && !onLillyPad3 && !onLillyPad4 &&
  !onLillyPad5 && f.y < 220) {
    negInc();
    f.x = width/2;
    f.y = height-20;
  }

  //display and move the frog
  f.display();
  /*fill(0);
  textSize(12);
  //text("Jumping: "+jumping, width/4, height-20);
  text("onLillyPad1: "+onLillyPad1, width/4, height-36);
  text("onLillyPad2: "+onLillyPad2, width/4, height-28);
  text("onLillyPad3: "+onLillyPad3, width/4, height-22);
  text("onLillyPad4: "+onLillyPad4, width/4, height-16);
  text("onLillyPad5: "+onLillyPad5, width/4, height-10);
  text("Lives: "+lives, width/4*3, height-20);*/

  //println(f.y);
  //f.movement();

  //cars
  //row 1
  for (int i = 0; i < Row1.length; i++) {
    Row1[i].movement();
    Row1[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, Row1[i].x-15, Row1[i].y-10, 30, 20)) {
      negInc();
      f.x = width/2;
      f.y = height-20;
    }
  }

  //row 2
  for (int i = 0; i < Row2.length; i++) {
    Row2[i].movement();
    Row2[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, Row2[i].x-15, Row2[i].y-10, 30, 20)) {
      negInc();
      f.x = width/2;
      f.y = height-20;
    }
  }

  //row 3
  for (int i = 0; i < Row3.length; i++) {
    Row3[i].movement();
    Row3[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, Row3[i].x-15, Row3[i].y-10, 30, 20)) {
      negInc();
      f.x = width/2;
      f.y = height-20;
    }
  }

  //row 4
  for (int i = 0; i < Row4.length; i++) {
    Row4[i].movement();
    Row4[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, Row4[i].x-15, Row4[i].y-10, 30, 20)) {
      negInc();
      f.x = width/2;
      f.y = height-20;
    }
  }

  //row 5
  for (int i = 0; i < Row5.length; i++) {
    Row5[i].movement();
    Row5[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, Row5[i].x-37.5, Row5[i].y-10, 75, 20)) {
      negInc();
      f.x = width/2;
      f.y = height-20;
    }
  }

  //kill the player if Frogger leaves the horizontal edges of the screen
  if (f.x >= width || f.x <= 0) {
    negInc();
    f.x = width/2;
    f.y = height-20;
  }

  //if the player has no lives, game over
  if (lives == 0) {
    dead = true;
  }

  //run for playerdeath
  death();

  //if player reaches the ending zones
  if (rectangle_collision(f.x, f.y, 18.5, 18.5, width/2-160, 20, 40, 20) ||
    rectangle_collision(f.x, f.y, 18.5, 18.5, width/2-80, 20, 40, 20) ||
    rectangle_collision(f.x, f.y, 18.5, 18.5, width/2, 20, 40, 20) ||
    rectangle_collision(f.x, f.y, 18.5, 18.5, width/2+80, 20, 40, 20) ||
    rectangle_collision(f.x, f.y, 18.5, 18.5, width/2+160, 20, 40, 20)) {
    counter += 1;
    f.x = width/2;
    f.y = height-20;
    onLillyPad1 = false;
    onLillyPad2 = false;
    onLillyPad3 = false;
    onLillyPad4 = false;
    onLillyPad5 = false;
  }

  //change the speed of the pads and cars
  speed();
  //run if the player wins
  win();
} //end draw

void keyPressed() {
  if (key == 'w') {
    f.y -= 40;
    jumping = true;
  }
  if (key == 'd') {
    f.x += 40;
    jumping = true;
  }
  if (key == 's') {
    f.y += 40;
    jumping = true;
  }
  if (key == 'a') {
    f.x -= 40;
    jumping = true;
  }
}

void keyReleased() {
  jumping = false;
}

boolean rectangle_collision(float x_1, float y_1, 
float width_1, float height_1, 
float x_2, float y_2, 
float width_2, float height_2)
{
  return !(x_1 > x_2+(width_2) || x_1+(width_1) < x_2 || y_1 > y_2+(height_2) || y_1+(height_1) < y_2);
}

void speed() {
  //holyshit lots of code
  //sorry but it was the only way I could get it to work
  if (counter == 1) {
    for (int i = 0; i < row1.length; i++) {
      for (int j = 0; j < row2.length; j++) {
        for (int k = 0; k < row3.length; k++) {
          for (int l = 0; l < row4.length; l++) {
            for (int m = 0; m < row5.length; m++) {
              for (int n = 0; n < Row1.length; n++) {
                for (int o = 0; o < Row2.length; o++) {
                  for (int p = 0; p < Row3.length; p++) {
                    for (int q = 0; q < Row4.length; q++) {
                      for (int r = 0; r < Row5.length; r++) {
                        row1[i].direction = -1.5;
                        row2[j].direction = 1.0;
                        row3[k].direction = 1.5;
                        row4[l].direction = -1.5;
                        row5[m].direction = 1.5;
                        Row1[n].direction = -1.5;
                        Row2[o].direction = 1.5;
                        Row3[p].direction = -1.5;
                        Row4[q].direction = 1.5;
                        Row5[r].direction = 1.5;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (counter == 2) {
    for (int i = 0; i < row1.length; i++) {
      for (int j = 0; j < row2.length; j++) {
        for (int k = 0; k < row3.length; k++) {
          for (int l = 0; l < row4.length; l++) {
            for (int m = 0; m < row5.length; m++) {
              for (int n = 0; n < Row1.length; n++) {
                for (int o = 0; o < Row2.length; o++) {
                  for (int p = 0; p < Row3.length; p++) {
                    for (int q = 0; q < Row4.length; q++) {
                      for (int r = 0; r < Row5.length; r++) {
                        row1[i].direction = -2.0;
                        row2[j].direction = 1.5;
                        row3[k].direction = 2.0;
                        row4[l].direction = -2.0;
                        row5[m].direction = 2.0;
                        Row1[n].direction = -2.0;
                        Row2[o].direction = 2.0;
                        Row3[p].direction = -2.0;
                        Row4[q].direction = 2.0;
                        Row5[r].direction = 2.0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (counter == 3) {
    for (int i = 0; i < row1.length; i++) {
      for (int j = 0; j < row2.length; j++) {
        for (int k = 0; k < row3.length; k++) {
          for (int l = 0; l < row4.length; l++) {
            for (int m = 0; m < row5.length; m++) {
              for (int n = 0; n < Row1.length; n++) {
                for (int o = 0; o < Row2.length; o++) {
                  for (int p = 0; p < Row3.length; p++) {
                    for (int q = 0; q < Row4.length; q++) {
                      for (int r = 0; r < Row5.length; r++) {
                        row1[i].direction = -2.5;
                        row2[j].direction = 2.0;
                        row3[k].direction = 2.5;
                        row4[l].direction = -2.5;
                        row5[m].direction = 2.5;
                        Row1[n].direction = -2.5;
                        Row2[o].direction = 2.5;
                        Row3[p].direction = -2.5;
                        Row4[q].direction = 2.5;
                        Row5[r].direction = 2.5;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (counter == 4) {
    for (int i = 0; i < row1.length; i++) {
      for (int j = 0; j < row2.length; j++) {
        for (int k = 0; k < row3.length; k++) {
          for (int l = 0; l < row4.length; l++) {
            for (int m = 0; m < row5.length; m++) {
              for (int n = 0; n < Row1.length; n++) {
                for (int o = 0; o < Row2.length; o++) {
                  for (int p = 0; p < Row3.length; p++) {
                    for (int q = 0; q < Row4.length; q++) {
                      for (int r = 0; r < Row5.length; r++) {
                        row1[i].direction = -3.0;
                        row2[j].direction = 2.5;
                        row3[k].direction = 3.0;
                        row4[l].direction = -3.0;
                        row5[m].direction = 3.0;
                        Row1[n].direction = -3.0;
                        Row2[o].direction = 3.0;
                        Row3[p].direction = -3.0;
                        Row4[q].direction = 3.0;
                        Row5[r].direction = 3.0;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if (counter == 5) {
    for (int i = 0; i < row1.length; i++) {
      for (int j = 0; j < row2.length; j++) {
        for (int k = 0; k < row3.length; k++) {
          for (int l = 0; l < row4.length; l++) {
            for (int m = 0; m < row5.length; m++) {
              for (int n = 0; n < Row1.length; n++) {
                for (int o = 0; o < Row2.length; o++) {
                  for (int p = 0; p < Row3.length; p++) {
                    for (int q = 0; q < Row4.length; q++) {
                      for (int r = 0; r < Row5.length; r++) {
                        row1[i].direction = -3.5;
                        row2[j].direction = 3.0;
                        row3[k].direction = 3.5;
                        row4[l].direction = -3.5;
                        row5[m].direction = 3.5;
                        Row1[n].direction = -3.5;
                        Row2[o].direction = 3.5;
                        Row3[p].direction = -3.5;
                        Row4[q].direction = 3.5;
                        Row5[r].direction = 3.5;
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void death() {
  if (dead) {
    fill(0);
    rect(width/2, height/2, width, height);
    fill(255, 0, 0);
    text("Dead", width/2, height/2);
  }
}

void win() {
  if (counter == 5) {
    fill(0);
    rect(width/2, height/2, width, height);
    fill(0, 255, 0);
    text("You won!", width/2, height/2);
  }
}

void negInc() {
  if (lives == 3) {
    lives = 2;
  }
  else if (lives == 2) {
    lives = 1;
  }
  else if (lives == 1) {
    lives = 0;
  }
}

class Frogger {
  float x, y;
  boolean up, down, left, right;
  
  Frogger(float myX, float myY) {
    x = myX;
    y = myY;
  }

  void movement() {
    //move the frog based on keys pressed
    if (keyPressed) {
      if (key == 'w') {
        y -= 1;
      }
      if (key == 'd') {
        x += 1;
      }
      if (key == 's') {
        y += 1;
      }
      if (key == 'a') {
        x -= 1;
      }
      //prevent it from leaving, mua ha ha
      if (x+12.5 <= 0 || x-12.5 >= width) {
        x = -x;
      }
      if (y+12.5 <= 0 || y-12.5 >= height) {
        y = -y;
      }
    }
  }

  void display() {
    //just a placeholder for right now
    //head
    fill(Frogger_green);
    triangle(x-7, y-7, x, y-10, x+7, y-7);
    fill(255, 0, 0);
    rect(x-4, y-7, 2, 2);
    rect(x+4, y-7, 2, 2);
    //body
    fill(Frogger_green);
    noStroke();
    rect(x, y, 14, 14);
    fill(255, 255, 0);
    rect(x, y, 7, 7);
    //legs
    //front legs
    fill(Frogger_green);
    rect(x-7, y-4, 6, 3);
    rect(x-10, y-6, 2, 6);
    rect(x+7, y-4, 6, 3);
    rect(x+10, y-6, 2, 6);
    //rear legs
    rect(x-7, y+4, 6, 3);
    rect(x-10, y+6, 2, 6);
    rect(x+7, y+4, 6, 3);
    rect(x+10, y+6, 2, 6);
  }
}

class Mover {
  float x, y, direction;
  int type;

  //the cars and trucks, will kill the frogger if they come into
  //contact w/each other (not yet though)
  Mover(float myX, float myY, int myType, float myDirection) {
    x = myX;
    y = myY;
    type = myType;
    direction = myDirection;
  }

  //increase the horizontal postion by direction
  //reset if goes beyond certain point
  void movement() {
    pushMatrix();
    x += direction;
    if (x <= -100) {
      x = width+50;
    }
    if (x >= width+100) {
      x = -50;
    }
    popMatrix();
  }

  //display the cars
  void display() {
    if (type == 1) {
      //make the trucks look like they're going in opposite directions
      //instead of just driving forward and backward
      if (direction >= 1) {
        semitruck_right();
      }
      else {
        semitruck_left();
      }
    }
    else {
      if (direction >= 1) {
        car_right();
      }
      else {
        car_left();
      }
    }
  }

  //types of cars: semitruck, normal car (not added yet)
  void semitruck_right() {
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rect(x, y, 25, 25);
    fill(150);
    stroke(150);
    rect(x-37.5, y, 50, 25);
  }

  void semitruck_left() {
    fill(255, 0, 0);
    noStroke();
    rect(x, y, 25, 25);
    fill(150);
    stroke(150);
    rect(x+37.5, y, 50, 25);
  }

  void car_left() {
    fill(0);
    stroke(255);
    rect(x-10, y-10, 6, 4);
    rect(x-10, y+10, 6, 4);
    rect(x+10, y-10, 6, 4);
    rect(x+10, y+10, 6, 4);
    fill(175);
    noStroke();
    rect(x-15, y, 6, 20);
    fill(255, 0, 0);
    rect(x, y, 30, 20);
  }

  void car_right() {
    fill(0);
    stroke(255);
    rect(x-10, y-10, 6, 3);
    rect(x-10, y+10, 6, 3);
    rect(x+10, y-10, 6, 3);
    rect(x+10, y+10, 6, 3);
    fill(175);
    noStroke();
    rect(x+15, y, 6, 20);
    fill(255, 0, 0);
    rect(x, y, 30, 20);
  }
}

class Pad {
  float x, y, direction;
  int type;

  Pad(float myX, float myY, int myType, float myDirection) {
    x = myX;
    y = myY;
    type = myType;
    direction = myDirection;
  } //end constructor

  void current() {
    //pushMatrix();
    x += direction;
    if (x <= -100) {
      x = width+50;
    }
    if (x >= width+100) {
      x = -50;
    }
    //popMatrix();
  } //end current

  void display() {
    if (type == 1) {
      lillypad();
    }
    else if (type == 2) {
      log_small();
    }
    else if (type == 3) {
      log_large();
    }
    else if (type == 4) {
      log_medium();
    }
  }
  //end display

  void lillypad() {
    fill(Frogger_green);
    noStroke();
    ellipse(x, y, 25, 20);
  } //end lillypad

  void log_small() {
    fill(bark);
    noStroke();
    rect(x, y, 60, 20);
    ellipse(x-32, y, 15, 20);
    fill(wood);
    ellipse(x+32, y, 15, 20);
  } //end log_small
  
  void log_large() {
    fill(bark);
    noStroke();
    rect(x, y, 100, 20);
    ellipse(x-50, y, 15, 20);
    fill(wood);
    ellipse(x+50, y, 15, 20);
  } //end log_large
  
  void log_medium() {
    fill(bark);
    noStroke();
    rect(x, y, 80, 20);
    ellipse(x-40, y, 15, 20);
    fill(wood);
    ellipse(x+40, y, 15, 20);
  } //end log_medium
}



