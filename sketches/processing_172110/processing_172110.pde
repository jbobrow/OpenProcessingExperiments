
int[] rules = { 1,1,0,0,0,1,0,1,0};// 10 rules here, but it can be as many rules as i want
int gen = 1; // Generation
color on = color(255);
color off = color(0);

//instead of checking three 3 pixels, you have to check more

void setup() {
  size(400, 400);
  frameRate(60); // Slow down to 8 frames each second
  background(0);
  set(width / 6, 50, on); // Set the top, middle pixel to white
}

void draw() {
// For each pixel, determine new state by examining current
// state and neighbor states and ignore edges that have only
// one neighbor
  for (int i = 1; i < width - 1; i++) {
    int left = get(i - 1, gen - 1);
    int left_b = get(i - 2, gen - 1); // Left neighbor
    int me = get(i, gen - 1); // Current pixel, "get" is a way to get a value
    int right = get(i + 1, gen - 1);
    int right_b = get(i + 2, gen - 1); // Right neighbor
    if (rules(left, left_b, me, right, right_b) == 1) {
      set(i, gen, on);
    }
  }
  gen++; // Increment the generation by 1
  if (gen > height - 1) { // If reached the bottom of the screen,
    noLoop(); // stop the program
  }
}
// Implement the rules
int rules(color a, color b, color c, color d , color e) {
  if ((a == on) && (b == on) && (c == on) && (d == on) && (e == on)) {
    return rules[0];
  }
  if ((a == on) && (b == on) && (c == on)&& (d == on) && (e == off)) {
    return rules[1];
  }
  if ((a == on) && (b == on) && (c == on) && (d == off) && (e == off))  {
    return rules[2];
  }
  if ((a == on) && (b == on) && (c == off)&& (d == off) && (e == off)) {
    return rules[3];
  }
  if ((a == on) && (b == off) && (c == off) && (d == off) && (e == off)) {
    return rules[4];
  }
  if ((a == off) && (b == off) && (c == off) && (d == off) && (e == off)) {
    return rules[5];
  }
  if ((a == off) && (b == on) && (c == off) && (d == off) && (e == off)) {
    return rules[6];
  }
  if ((a == off) && (b == on) && (c == on)&& (d == off) && (e == off)) {
    return rules[7];

  }
  if ((a == off) && (b == on) && (c == on) && (d == on) && (e == off)) {
    return rules[8];
  }
  
                                              //add this 
  if ((a == off) && (b == on) && (c == off) && (d == on) && (e == off)) {
    return rules[9];
  }
    
  
  
  
  return 0;
}


