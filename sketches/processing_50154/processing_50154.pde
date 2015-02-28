
/*

   Boltzmann.pde
   by Greg Recco, Jan 25, 2012

   A quick, cheap, and hacky visualization of the inexorable march of time,
   expressed as the increase in entropy in a simplified "gas." Inspired by
   a blog post by Chad Orzel:
   
   http://scienceblogs.com/principles/2012/01/notes_toward_a_toy_model_of_th.php
   
   We compute the entropy by looking at each 5x5 region and computing the log
   of the possible indistinguishable combinations that would result in its
   present state. At least, I think that's what this code is doing....

   The "gas" particles have no velocity information; we just check in every
   adjoining cell for free spaces, in random order, and then move if our
   move "roll" hits.  We march through the whole field with random vertical
   lines as a quick and dirty solution to the problem of bias introduced
   by a prior raster-style ordering.

   Any comments, questions, or corrections would be greatly appreciated.
   You can e-mail the author at: greg.recco@sjca.edu
   
*/

color white = color(255,255,255);
color black = color(0);
int x_size = 500;
int y_size = 500;
boolean[] candidates = new boolean[8]; // 
int[][] candidateOffsets = { {-1,-1}, {0,-1}, {1,-1}, {-1,0}, {1,0}, {-1,1}, {0,1}, {1,1}  };
float moveChance = 0.7;
boolean[] x_lines = new boolean[x_size];
int[] combos_25 = {1,25,300,2300,12650,53130,177100,480700,1081575,2042975,3268760,4457400,5200300,5200300,4457400,3268760,2042975,1081575,480700,177100,53130,12650,2300,300,25,1};
float[] entropies = new float[26];

PFont f;

void setup() {
  size(x_size, y_size+20);
  frameRate(60);
  background(black);
  stroke(white);
  f = loadFont("ArialNarrow-24.vlw");
  textFont(f);
  fill(0);
  for (int combo = 0; combo < 26; combo++) {
    entropies[combo] = log(combos_25[combo]);
  }  
  ellipseMode(CENTER);
  fill(white);
  stroke(white);
  ellipse(int(x_size/2), int(y_size/2), int(x_size/10), int(y_size/10));
}

void getEntropy(int x, int y) {
}

void checkCandidates(int x, int y) {
  for(int i=0; i<8; i++) {
    candidates[i] = false;
    int x_offset = candidateOffsets[i][0];
    int y_offset = candidateOffsets[i][1];
    int x_cand = x + x_offset;
    int y_cand = y + y_offset;
    if( (x_cand < x_size) && (x_cand >= 0) && (y_cand < y_size) && (y_cand >= 0) && (black == get(x_cand,y_cand)) ) {
      candidates[i] = true;
    }
  }    
}

void draw() {
  int x_lines_remaining = x_size;
  for(int i = 0; i < x_size; i++ ) {
    x_lines[i] = false;
  }
  while (x_lines_remaining > 0) {
    boolean up = (random(1) > 0.5);
    int y = 0;
    if (up) { y = y_size; }
    int incr = 1;
    if (up) { incr *= -1; }
    int x = int(random(x_size));
    while ( x_lines[ x ] ) { x = int(random(x_size)); }
    for( y = y; y >= 0 && y < y_size; y = y + incr) {
      if(get(x,y)==white) {
        checkCandidates(x,y);
        int firstCand = int(random(8));
        for(int i=firstCand; i<firstCand+8; i++) {
          int index = i;
          if (index >= 8) { index -= 8; }
          if(candidates[index] && random(1) > (1.0 - moveChance) ) {
            set(x,y,black);
            set(x + candidateOffsets[index][0], y + candidateOffsets[index][1], white);
            break;
          }
        }
      }
    }
    x_lines_remaining--;
    x_lines[x] = true;
  }
  float entropy = 0.0;
  for(int x = 0; x < x_size/5; x++) {
    for(int y = 0; y < y_size/5; y++) {
      int x_i = x * 5;
      int y_i = y * 5;
      int total_whites = 0;
      for(int x_ii = x_i; x_ii < x_i + 5; x_ii++ ) {
        for(int y_ii = y_i; y_ii < y_i + 5; y_ii++ ) {
          if ( white == get(x_ii, y_ii) ) { total_whites++; }
        }
      }
      entropy += entropies[total_whites];
    }
  }
  fill(0);
  stroke(0);
  rect( 0, y_size, x_size - 1, y_size + 19 );
  fill(255);
  String entropy_str = nf( int(entropy) , 4 );
  text( entropy_str, int(x_size*0.45), y_size + 20 );
}

