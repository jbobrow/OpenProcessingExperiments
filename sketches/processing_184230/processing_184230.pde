
Select all of the code and replace it with the following:
int die_count = 6;
int rolls = 0;
int ones = 0;
int twos = 0;
int threes = 0;
int fours = 0;
int fives = 0;
int sixes = 0;

void setup() {
  size(640, 360);
  noSmooth();
  fill(126);
  background(0);
  noLoop();
}

void draw() {
  background(0);
  die_count = int(random(2,8)-1);
  rolls = rolls + 1;
  
  switch(die_count) {
  case 1: 
    ones++;
    break;
  case 2: 
    twos++;
    break;
  case 3: 
    threes++;
    break;
  case 4: 
    fours++;
    break;
  case 5: 
    fives++;
    break;
  case 6: 
    sixes++;
    break;
  default:
    break;
  }
  
  textSize(32);
  text("Die: " + die_count, 10, 30);
  text("Rolls: " + rolls, 10, 60);
  text("Ones: " + ones, 10, 120);
  text("Twos: " + twos, 10, 150);
  text("Threes: " + threes, 10, 180);
  text("Fours: " + fours, 10, 210);
  text("Fives: " + fives, 10, 240);
  text("Sixes: " + sixes, 10, 270);
}

void mousePressed() {
   redraw(); 
}
