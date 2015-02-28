
/*
 This code will produce two histograms based on "dice" rolls. 
 The rolls are actually pseudo-random numbers produced by
 Processing's random() function.

 If the NUMBER_OF_DICE is greater than one, dice will be "rolled"
 in groups of that number. After MAX_NUMBER_OF_ROLLS the histograms
 are reset.

 This is free and unencumbered software released into the public domain.
 See: http://unlicense.org for license details.

 Written by Kyle Geske (@stungeye) December 2013
*/

int rolls[];
int roll_sums[];

int MAX_NUMBER_OF_ROLLS = 1700;
int NUMBER_OF_DICE = 2;
int DICE_SIDES = 6;
int BAR_WIDTH = 20;
int SCALING_BY = 2;
color[] PALETTE = {#008789, #FC4349, #111111, #F0F0F0};

int total_rolls;

void setup() {
  frameRate(20);
  size(400,300);
  stroke(PALETTE[2]);
  rolls = new int[DICE_SIDES + 1];
  roll_sums = new int [DICE_SIDES * NUMBER_OF_DICE + 1];
  reset_rolls();
}

void reset_rolls() {
  total_rolls = 0;
   for (int i = 1; i <= DICE_SIDES; i++) {
    rolls[i] = 0;
  }
  for (int i = 1; i <= DICE_SIDES * NUMBER_OF_DICE; i++) {
    roll_sums[i] = 0;
  }
}

void legend(color colour, String content, int x, int y) {
  fill(colour);
  rect(x, y, 10, 10);
  fill(PALETTE[2]);
  text(content, x + 15, y+10);
}

void draw() {
  background(PALETTE[3]);
  
  int dice_sum = 0;
  for(int i = 0; i < NUMBER_OF_DICE; i++) {
    int new_roll = (int)random(DICE_SIDES) + 1;
    rolls[new_roll]++;
    dice_sum += new_roll;
  }
  roll_sums[dice_sum]++;
  
  text("Dice Rolls", 50, 15);
  for (int i = 1; i <= DICE_SIDES; i++) {
    fill(PALETTE[0]);
    rect(i*BAR_WIDTH, 20, BAR_WIDTH, rolls[i]/SCALING_BY);
    fill(PALETTE[2]);
    text(i, i*BAR_WIDTH+5, 40);
  }
  
  text("Dice Sums", 240, 15);
  for (int i = 2; i <= DICE_SIDES * NUMBER_OF_DICE; i++) {
    fill(PALETTE[1]);
    rect(BAR_WIDTH*DICE_SIDES + i*BAR_WIDTH, 20 , BAR_WIDTH, roll_sums[i]/SCALING_BY);
    fill(PALETTE[2]);
    text(i, BAR_WIDTH*DICE_SIDES + i*BAR_WIDTH + 5, 40);
  }
  
  total_rolls++;
  
   legend(PALETTE[0],
         "Frequency of sides 1-6, " + (NUMBER_OF_DICE * total_rolls) + " rolls.", 
         180, 250);
  legend(PALETTE[1],
         "Frequency of " + total_rolls + " sums of " + NUMBER_OF_DICE + " dice." , 
         180, 270);
  
  
  if (total_rolls > MAX_NUMBER_OF_ROLLS) {
    reset_rolls();
  }
}
