
////
// Light up tech board
// based off a sketch by u/seanspangler
// Patrick J. O'Donnel
// Tues Feb 25, 2014
////


int[] counter = new int[81];
boolean[] decide = new boolean[81];
int f;
 
void setup() {
  
  size(500, 500);
  frameRate (1);
  noStroke();
  smooth();
  ellipseMode(CENTER);
  
 
  for(int j = 0; j < 50; j++){
    counter[j] = 1;
  }
  for(int k = 0; k < 50; k++) {
    decide[k] = true;
  }
     
}
 
void draw() {
  background(30, 10, 0, 240);
  f = 0;
  for(int x = 50; x < 500; x += 50){
   for(int y = 50; y < 500; y += 50){
    blinkingCircle(x, y, random(0,100));
    
    
    if(counter[f] > random(5)) {
     decide[f] = false;
    }
    if(counter[f] < random(50)) {
      decide[f] = true;
    }
    f++;
   
  }
}
}
void blinkingCircle(int x, int y, float trans) {
  if (decide[f] == true) {
     
    fill(0, 120, 220, trans);
    ellipse(x, y, 25, 25);
    
  } else {
    fill (0,120,220,trans);
    rectMode(CENTER);
    rect(x,y,25,25);
  }
    
}


