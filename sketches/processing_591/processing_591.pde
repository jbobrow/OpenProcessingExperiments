
int[] freq = new int[81];
int[] counter = new int[81];
boolean[] decide = new boolean[81]; 
int f;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  smooth();
  ellipseMode(CENTER);
  for(int i = 0; i < 81; i++){
    if(i > 40){
      freq[i] = (82 - i) + 30;
    }  else {
    freq[i] = (i + 30);
    }
  }
  for(int j = 0; j < 81; j++){
    counter[j] = 1;
  }
  for(int k = 0; k < 81; k++) {
    decide[k] = true;
  }
    
}

void draw() {
  background(100, 0, 0);
  f = 0;
  for(int x = 50; x < 500; x += 50){
   for(int y = 50; y < 500; y += 50){
    blinkingCircle(x, y, map(counter[f], 1, freq[f], 1, 255));
    if (decide[f] == true) {
      counter[f] = counter[f] + 1;
    }
    if (decide[f] == false) {
      counter[f] = counter[f] - 1;
    }
    if(counter[f] > freq[f]) {
     decide[f] = false; 
    }
    if(counter[f] < 1) {
      decide[f] = true;
    }
    f++;
   }
  } 
}

void blinkingCircle(int x, int y, float trans) {
  fill(0, 100, 100, trans);
  ellipse(x, y, 25, 25);
}

