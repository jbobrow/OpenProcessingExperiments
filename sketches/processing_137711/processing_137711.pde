
/** 
 * Demo code for rolling dice.
 * Calculates sums of dice and draws a bar graph
 * to reveal probablity distribution.
 */

/*
 * Exercises:
 * Rewrite for 7- or 8- or n-sided dice.
 * Rewrite to track total heads from 80 coins tossed at once.
 * Label each bar in the graph with the corresponding sum of dice.
 *
 */

int[] diceTotals;
int howManyDice = 4;

 
public void setup() {
  size(320, 240);
  initVars(); 
}

public void initVars() {
  int slots = howManyDice * 6  - howManyDice + 1;
  diceTotals = new int[slots];
  int i = 0;
  while (i < slots) {
    diceTotals[i++] = 0;
  }
  // println(diceTotals);
  i = 0;
  // do a few rolls
  while (i < howManyDice) {
    rollDice();
    i++;
  }
  // println(diceTotals);
}

public void draw() {
  background(127);
  int maxValue =  maxArrayValue();
  float rw = float(width) / diceTotals.length;
  float sy = (height - 10) / float(maxValue);
  if (sy > 5) sy = 5;
  noStroke();
  fill(233, 55, 89);
  for (int i = 0; i < diceTotals.length; i++) {
    float rx = i * rw;
    float rh = diceTotals[i] * sy;
    float ry = height - rh;
    rect(rx, ry, rw + 1, rh);
  }
  rollDice();
}

public void rollDice() {
  int sum = 0;
  for (int i = 0; i < howManyDice; i++) {
    sum += floor(random(1,7));
  }
  diceTotals[sum - howManyDice] += 1;
}

public int maxArrayValue() {
  int maxValue = 0;
  for (int val: diceTotals) {
    if (val > maxValue) maxValue = val;
  } 
  return maxValue;
}
