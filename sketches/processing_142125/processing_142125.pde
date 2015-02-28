
/*
  Todo:
 - refine gameplay to be more consistent w/original
 - make Frogger and other assets look more like the original
 
 CREDITS (where credit is due)
 - James Robe (collision detection for logs/lillypads, goal class)
 - Jeff Thompson (standard collision detection) https://github.com/jeffThompson/CollisionDetectionFunctionsForProcessing/blob/master/Examples/rectRect_Example/rectRect_Example.pde
 */

Frogger f;
ArrayList<Car> Row1, Row2, Row3, Row4, Row5;
Pad [] row1, row2, row3, row4, row5;
Goal [] goals;

color Frogger_green = color(0, 255, 0);
color bark = color(139, 69, 19);
color wood = color(255, 222, 179);

boolean dead, won, jumping, onLillyPad;
boolean onLillyPad1, onLillyPad2, onLillyPad3, onLillyPad4, onLillyPad5;
boolean a;
//set the number of player lives at 3
int lives = 3;
int count = 0;
int counter = 0;
int levelCount = 0;
float primeX, deltaX;

PFont font;
PFont myFont;

void setup() {
  size(400, 540);
  rectMode(CENTER);
  ellipseMode(CENTER);

  font = loadFont("Helvetica-48.vlw");
  textFont(font, 48);
  textAlign(CENTER, CENTER);

  //set up the frog
  f = new Frogger(width/2, height-30);

  //initialize the goals
  int inc = (width/2)-160;
  goals = new Goal[5];
  for (int i = 0; i < goals.length; i++) {
    goals[i] = new Goal(inc, 25, 40, 30);
    inc += 80;
  }

  //initlialize the lillypads/logs/etc.
  //row 1
  row1 = new Pad[15];
  inc = -50;
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
  Row1 = new ArrayList<Car>();
  for (int i = 0; i < 3; i ++) {
    Row1.add(new Car(inc, 480, 2, -1));
    inc += 120;
  }

  //row 2
  inc = (width/2)-15;
  Row2 = new ArrayList<Car>();
  for (int i = 0; i < 2; i++) {
    Row2.add(new Car(inc, 440, 2, 1));
    inc += 120;
  }

  //row 3
  inc = (width/2)-35;
  Row3 = new ArrayList<Car>();
  for (int i = 0; i < 3; i++) {
    Row3.add(new Car(inc, 400, 2, -1));
    inc += 100;
  }

  //row 4
  Row4 = new ArrayList<Car>();
  Row4.add(new Car(-30, 360, 2, 1));

  //row 5
  inc = (width/2-100);
  Row5 = new ArrayList<Car>();
  for (int i = 0; i < 2; i++) {
    Row5.add(new Car(inc, 320, 1, -1));
    inc += 150;
  }
} //end setup

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

  //first x value
  primeX = f.x;

  //goal areas
  for (int i = 0; i < goals.length; i++) {
    goals[i].display();
    goals[i].math(f);
  }


  //lillpads
  for (int i = 0; i < row1.length; i++) {
    row1[i].display();
    row1[i].current();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, row1[i].x-12.5, row1[i].y-10, 25, 20)) {
      f.x += row1[i].direction;
    }
  }

  //row 2
  for (int i = 0; i < row2.length; i++) {
    row2[i].current();
    row2[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, row2[i].x-30, row2[i].y-10, 60, 20)) {
      f.x += row2[i].direction;
    }
  }

  //row 3
  for (int i = 0; i < row3.length; i++) {
    row3[i].current();
    row3[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, row3[i].x-50, row3[i].y-10, 100, 20)) {
      f.x += row3[i].direction;
    }
  }

  //row 4
  for (int i = 0; i < row4.length; i++) {
    row4[i].current();
    row4[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, row4[i].x-12.5, row4[i].y-10, 25, 20)) {
      f.x += row4[i].direction;
    }
  }

  //row 5
  for (int i = 0; i < row5.length; i++) {
    row5[i].current();
    row5[i].display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, row5[i].x-45, row5[i].y-10, 90, 20)) {
      f.x += row5[i].direction;
    }
  }

  //display and move the frog
  f.display();

  //the second x position value  
  deltaX = f.x;
  /*Get the change in value from the first and second x positions.
   If the value hasn't changed, the player is not moving and
   therefore not on a lillypad, so take away a life.*/
  if ((deltaX - primeX) == 0 && f.y <= 250 && f.y >= 60) {
    negInc();
    f.x = width/2;
    f.y = height-30;
  }

  //display the number of lives the player has left
  fill(0);
  textSize(12);
  text("Lives: "+lives, width/4*3, height-20);
  text("Level: "+levelCount, width/4*3, height-10);

  //cars
  //row 1
  for (int i = Row1.size()-1; i >= 0; i--) {
    Car car = Row1.get(i);
    car.movement();
    car.display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, car.x-15, car.y-10, 30, 20)) {
      negInc();
      f.x = width/2;
      f.y = height-30;
    }
  }

  //row 2
  for (int i = Row2.size()-1; i >= 0; i--) {
    Car car = Row2.get(i);
    car.movement();
    car.display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, car.x-15, car.y-10, 30, 20)) {
      negInc();
      f.x = width/2;
      f.y = height-30;
    }
  }

  //row 3
  for (int i = Row3.size()-1; i >= 0; i--) {
    Car car = Row3.get(i);
    car.movement();
    car.display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, car.x-15, car.y-10, 30, 20)) {
      negInc();
      f.x = width/2;
      f.y = height-30;
    }
  }

  //row 4
  for (int i = Row4.size()-1; i >= 0; i--) {
    Car car = Row4.get(i);
    car.movement();
    car.display();
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, car.x-15, car.y-10, 30, 20)) {
      negInc();
      f.x = width/2;
      f.y = height-30;
    }
  }

  //row 5
  for (int i = Row5.size()-1; i >= 0; i--) {
    Car car = Row5.get(i);
    car.movement();
    car.display();
    println(i, car.x);
    if (rectangle_collision(f.x, f.y, 18.5, 18.5, car.x-15, car.y-10, 30, 20)) {
      negInc();
      f.x = width/2;
      f.y = height-30;
    }
  }

  //kill the player if Frogger leaves the horizontal edges of the screen
  if (f.x >= width || f.x <= 0) {
    negInc();
    f.x = width/2;
    f.y = height-30;
  }

  //if the player has no lives, game over
  if (lives == 0) {
    dead = true;
  }

  //run for playerdeath
  death();

  //if player wins the level, increase the level counter, reset
  //the goal counter and give the player full lives
  if (counter == 5) {
    for (int i = 0; i < goals.length; i++) {
      goals[i].win = false;
    }
    levelCount += 1;
    lives = 3;
    counter = 0;
    reset();
  }

  //change the speed of the pads and cars
  levelUpdate();

  //run if the player wins
  win();
  /*if (levelCount == 2) {
   //add some cars
   Row4.add(new Car(-90, 360, 2, 1));
   Row5.add(new Car(width, 320, 1, 1));
   }*/
} //end draw

void keyPressed() {
  if (key == 'w') {
    f.y -= 40;
  }
  if (key == 'd') {
    f.x += 40;
  }
  if (key == 's') {
    f.y += 40;
  }
  if (key == 'a') {
    f.x -= 40;
  }
  if (dead) {
    if (key == 'r') {
      reset();
      counter = 0;
      lives = 3;
      levelCount = 0;
    }
  }
} //end keypressed

boolean rectangle_collision(float x_1, float y_1, 
float width_1, float height_1, 
float x_2, float y_2, 
float width_2, float height_2)
{
  return !(x_1 > x_2+(width_2) || x_1+(width_1) < x_2 || y_1 > y_2+(height_2) || y_1+(height_1) < y_2);
}

void levelUpdate() {
  //holyshit lots of code
  //sorry but this is the only way I could get it to work
  if (levelCount == 1) {
    //change the speed
    for (int i = 0; i < row1.length; i++) {
      for (int j = 0; j < row2.length; j++) {
        for (int k = 0; k < row3.length; k++) {
          for (int l = 0; l < row4.length; l++) {
            for (int m = 0; m < row5.length; m++) {
              for (int n = Row1.size()-1; n >= 0; n--) {
                for (int o = Row2.size()-1; o >= 0; o--) {
                  for (int p = Row3.size()-1; p >= 0; p--) {
                    for (int q = Row4.size()-1; q >= 0; q--) {
                      for (int r = Row5.size()-1; r >= 0; r--) {
                        row1[i].direction = -1.5;
                        row2[j].direction = 1.0;
                        row3[k].direction = 1.5;
                        row4[l].direction = -1.5;
                        row5[m].direction = 1.5;
                        Car car1 = Row1.get(n);
                        Car car2 = Row2.get(o);
                        Car car3 = Row3.get(p);
                        Car car4 = Row4.get(q);
                        Car car5 = Row5.get(r);
                        car1.direction = -1.5;
                        car2.direction = 1.5;
                        car3.direction = -1.5;
                        car4.direction = 1.5;
                        car5.direction = -1.5;
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
  if (levelCount == 2) {
    //add some cars
    int timer = millis();
    if (timer < 145) {
      Row4.add(new Car(-90, 360, 2, 1.5));
      Row5.add(new Car(width, 320, 1, -1.5));
    }
  }
  if (levelCount == 3) {
    for (int i = 0; i < row1.length; i++) {
      for (int j = 0; j < row2.length; j++) {
        for (int k = 0; k < row3.length; k++) {
          for (int l = 0; l < row4.length; l++) {
            for (int m = 0; m < row5.length; m++) {
              for (int n = Row1.size()-1; n >= 0; n--) {
                for (int o = Row2.size()-1; o >= 0; o--) {
                  for (int p = Row3.size()-1; p >= 0; p--) {
                    for (int q = Row4.size()-1; q >= 0; q--) {
                      for (int r = Row5.size()-1; r >= 0; r--) {
                        row1[i].direction = -2.0;
                        row2[j].direction = 1.5;
                        row3[k].direction = 2.0;
                        row4[l].direction = -2.0;
                        row5[m].direction = 2.0;
                        Car car1 = Row1.get(n);
                        Car car2 = Row2.get(o);
                        Car car3 = Row3.get(p);
                        Car car4 = Row4.get(q);
                        Car car5 = Row5.get(r);
                        car1.direction = -2.0;
                        car2.direction = 2.0;
                        car3.direction = -2.0;
                        car4.direction = 2.0;
                        car5.direction = -2.0;
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
  textSize(48);
  if (dead) {
    fill(0);
    rect(width/2, height/2, width, height);
    fill(255, 0, 0);
    text("Dead", width/2, height/2);
  }
  else {
    return;
  }
}

void win() {
  textSize(48);
  if (levelCount == 4) {
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

//at the beginning of every new level, reset the lillypads and cars
void reset() {
  //reset frogger
  f.x = width/2;
  f.y = height-30;
  //reset the lillypads
  int inc = -50;
  int k = 2;
  while (k < row1.length) {
    row1[k-2].x = inc;
    row1[k-1].x = inc+30;
    row1[k].x = inc+60;
    inc += 110;
    k += 3;
  }
  inc = (width/2)-150;
  for (int i = 0; i < row2.length; i++) {
    row2[i].x = inc;
    inc += (width/2)+150;
  }
  inc = width/5;
  for (int i = 0; i < row3.length; i++) {
    row3[i].x = inc;
    inc += (width/5)*3;
  }
  inc = 50;
  int j = 1;
  while (j < row4.length) {
    row4[j-1].x = inc;
    row4[j].x = inc+30;
    inc += 90;
    j += 2;
  }
  inc = width/8;
  for (int i = 0; i < row5.length; i++) {
    row5[i].x = inc;
    inc += (width/8)*3;
  }

  //reset cars
  inc = (width/2)-45;
  for (int i = Row1.size()-1; i >= 0; i--) {
    Car car = Row1.get(i);
    car.x = inc;
    inc += 120;
  }
  inc = (width/2)-15;
  for (int i = Row2.size()-1; i >= 0; i--) {
    Car car = Row2.get(i);
    car.x = inc;
    inc += 120;
  }
  inc = (width/2)-35;
  for (int i = Row3.size()-1; i >= 0; i--) {
    Car car = Row3.get(i);
    car.x = inc;
    inc += 100;
  }
  inc = -30;
  for (int i = Row4.size()-1; i >= 0; i--) {
    Car car = Row4.get(i);
    car.x = inc;
    inc -= 60;
  }
  inc = width/2;
  for (int i = Row5.size()-1; i >= 0; i--) {
    Car car = Row5.get(i);
    car.x = inc;
    inc += 190;
  }
}

class Car {
  float x, y, direction;
  int type;

  //the cars and trucks, will kill the frogger if they come into
  //contact w/each other (not yet though)
  Car(float myX, float myY, int myType, float myDirection) {
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

  //types of cars: semitruck, normal carww
  void semitruck_right() {
    int w = 22;
    int ww = 8;
    //wheels
    fill(0);
    //front tires
    rect(x, y-12.5, ww, 3);
    rect(x, y+12.5, ww, 3);
    //rear tires
    rect(x-50, y-12.5, ww, 3);
    rect(x-50, y+12.5, ww, 3);
    //cab
    fill(255, 0, 0);
    noStroke();
    //stroke(255, 0, 0);
    rect(x, y, w, w);
    //trailer
    fill(150);
    noStroke();
    //stroke(150);
    rect(x-37.5, y, 50, w);
  }

  void semitruck_left() {
    int w = 22;
    int ww = 8;
    //wheels
    fill(0);
    //front tires
    rect(x, y-12.5, ww, 3);
    rect(x, y+12.5, ww, 3);
    //rear tires
    rect(x+50, y-12.5, ww, 3);
    rect(x+50, y+12.5, ww, 3);
    //cab
    fill(255, 0, 0);
    noStroke();
    //stroke(255, 0, 0);
    rect(x, y, w, w);
    //trailer
    fill(150);
    noStroke();
    //stroke(150);
    rect(x+37.5, y, 50, w);
  }

  void car_left() {
    fill(0);
    noStroke();
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
    noStroke();
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
    fill(255, 0, 0);
    rect(x-4, y-7, 2, 2);
    rect(x+4, y-7, 2, 2);
    //body
    fill(Frogger_green);
    ellipse(x, y, 14, 18.5);
    noStroke();
    fill(255, 255, 0);
    ellipse(x, y, 11, 15);
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
class Goal {
  boolean win;
  float x, y, w, h;
  Goal(float myX, float myY, float myW, float myH) {
    x = myX;
    y = myY;
    w = myW;
    h = myH;
  }
  
  void display() {
    fill(0, 0, 255);
    noStroke();
    rect(x, y, w, h);
    if (win == true) {
      fill(255, 0, 0);
      ellipse(x, y, w, h);
    }
  }
  
  void math(Frogger F) {
    if (rectangle_collision(F.x, F.y, 18.5, 18.5, x, y, w, h)) {
      fill(0, 255, 0);
      ellipse(x, y, w, h);
      win = true;
      counter += 1;
      F.x = width/2;
      F.y = height-30;
    }
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



