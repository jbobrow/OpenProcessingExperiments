
int[] c = new int[500];
int t = 0; // time step
int n = 0; // amount won

void setup() {
  size(600,400);  // size of the canvas
  background(255);// set background white
  frameRate(20);  // limit the number of frames per second
  // initialise counters
  for (int i = 0; i < c.length; i++) {
    c[i] = 0;
  }
}

void draw() {
  t = 0; // start at time 0
  n = 0; // with 0 winnings
  stroke(0, 0, 0, 100);  // set stroke colour to black but with some transparency
  
  while (t<200) { // run for 200 time steps
    float r = random(0,1); // draw a random number uniformly between 0 and 1
    if (r < 0.5) { // this happens with probability 1/2
      // Heads has come up, we increase n
      line(2*t,height-3*n,2*(t+1),height-3*(n+1));
      n=n+1;
    }
    else {
      // Tails has come up, we do not increase n
      line(2*t,height-3*n,2*(t+1),height-3*n);
    }
    t=t+1; // ready for next time step
  }
  
  // Now at the final value of n place an additional red square
  fill(255,0,0); // set fill colour to red
  rect(2*t+3*c[n], height-3*n, -3, -3); // this will place the new square to the right of previous ones
  c[n] = c[n] + 1; // increase the counter that counts how often the winnings at the end were equal to n
}
