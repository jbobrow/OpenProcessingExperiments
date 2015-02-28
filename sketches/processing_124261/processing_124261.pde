
/*
 This code will produce two histograms based on NUMBER_OF_ROLLS
 "dice" rolls. The rolls are actually pseudo-random numbers produced 
 by Processing's random() function.
 
 If the NUMBER_OF_DICE is greater than one, dice will be "rolled"
 in groups of that number NUMBER_OF_ROLLS times. 
 
 Every second the histograms are cleared and regenerated.
 
 This is free and unencumbered software released into the public domain.
 See: http://unlicense.org for license details.
 
*/

int rolls[];
int roll_sums[];

int NUMBER_OF_ROLLS = 75;
int NUMBER_OF_DICE = 2;
int DICE_SIDES = 6;
int BAR_WIDTH = 20;
int SCALING_BY = 8;
color[] PALETTE = {#008789, #FC4349, #111111, #F0F0F0};

void setup() {
  frameRate(1);
  size(400,300);
  stroke(PALETTE[2]);
  fill(PALETTE[2]);
  rolls = new int[DICE_SIDES + 1];
  roll_sums = new int [DICE_SIDES * NUMBER_OF_DICE + 1];
  reset_rolls();
}

void reset_rolls() {
   for (int i = 1; i <= DICE_SIDES; i++) {
    rolls[i] = 0;
  }
  for (int i = 1; i <= DICE_SIDES * NUMBER_OF_DICE; i++) {
    roll_sums[i] = 0;
  }
}

void draw() {
  background(PALETTE[3]);
  
  for (int j = 0; j < NUMBER_OF_ROLLS; j++) {
    int dice_sum = 0;
    for(int i = 0; i < NUMBER_OF_DICE; i++) {
      int new_roll = (int)random(DICE_SIDES) + 1;
      rolls[new_roll]++;
      dice_sum += new_roll;
    }
    roll_sums[dice_sum]++;
  }
  
  text("Dice Rolls", 50, 15);
  for (int i = 1; i <= DICE_SIDES; i++) {
    fill(PALETTE[0]);
    rect(i*BAR_WIDTH, 20, BAR_WIDTH, rolls[i] * SCALING_BY);
    fill(PALETTE[2]);
    text(i, i*BAR_WIDTH+5, 40);
  }
  
  text("Dice Sums", 240, 15);
  for (int i = 2; i <= DICE_SIDES * NUMBER_OF_DICE; i++) {
    fill(PALETTE[1]);
    rect(BAR_WIDTH*DICE_SIDES + i*BAR_WIDTH, 20 , BAR_WIDTH, roll_sums[i] * SCALING_BY);
    fill(PALETTE[2]);
    text(i, BAR_WIDTH*DICE_SIDES + i*BAR_WIDTH + 5, 40);
  }


  legend(PALETTE[0],
         "Frequency of sides 1-6, " + (NUMBER_OF_DICE * NUMBER_OF_ROLLS) + " rolls.", 
         180, 250);
  legend(PALETTE[1],
         "Frequency of " + NUMBER_OF_ROLLS + " sums of " + NUMBER_OF_DICE + " dice." , 
         180, 270);
        
  reset_rolls();

}

def legend(color colour, String content, int x, int y) {
  fill(colour);
  rect(x, y, 10, 10);
  fill(PALETTE[2]);
  text(content, x + 15, y+10);
}
