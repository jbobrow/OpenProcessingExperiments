

int i = 1;
int j = 1;
int k = 1;
int l = 1;
int n = 1;
int freqOne = 110;
int freqTwo = 130;
int freqThree = 170;
int freqFour = 230;
int freqFive = 290;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  noStroke();
}

void draw() {
  background(100, 0, 100);
  recedingSquares(i, freqOne, 1, 72);
  recedingSquares(j, freqTwo, 73, 144);
  recedingSquares(k, freqThree, 145, 216);
  recedingSquares(l, freqFour, 217, 288);
  recedingSquares(n, freqFive, 289, 360);
  i++;
  if (i > freqOne) {
    i = 1;
  }
  
  j++;
  if (j > freqTwo) {
    j = 1;
  }
  
  k++;
  if (k > freqThree) {
    k = 1;
  }
  
  l++;
  if (l > freqFour) {
    l = 1;
  }
  
  n++;
  if (n > freqFive) {
    n = 1;
  }
  
}

void recedingSquares(int m, int freq, int lowValue, int highValue) {
  fill(map(m, 1, freq, lowValue, highValue), 100, 70, 255 - map(m, 1, freq, 1, 255));
  rect(height/ 2, width /2, map(m, 1, freq, 1, height), map(m, 1, freq, 1, width));
}




