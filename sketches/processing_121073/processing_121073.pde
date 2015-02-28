
// ColorCodeClock.pde

int[] clist = {
  #000000,
  #955629,
  #FF0000,
  #FF8C00,
  #FFFF00,
  #00A000,
  #0000FF,
  #8B008B,
  #808080,
  #FFFFFF
};

void setup() {
  size(415,150);
  background(220);
}

void draw() {
  int h = hour();
  int m = minute();
  int s = second();
  // Hour
  fill(clist[floor(h/10)]);
  rect(20,50,50,50);
  fill(clist[h%10]);
  rect(75,50,50,50);
  // Minute
  fill(clist[floor(m/10)]);
  rect(155,50,50,50);
  fill(clist[m%10]);
  rect(210,50,50,50);
  // Second
  fill(clist[floor(s/10)]);
  rect(290,50,50,50);
  fill(clist[s%10]);
  rect(345,50,50,50);
} 
