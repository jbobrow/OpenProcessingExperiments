
//Wenda
//Class wk 9 

float incrementer = 0;

void setup() {
  size(600, 400);
}

void draw () {
  for (int distance=10; distance<350;distance +=50) {
    float yOff = sin(incrementer * 7) * distance/2 ; //0.6 if you wanna go the opp direction
    float xOff = cos(incrementer *2) * distance;
    // println(sin(incrementer) * 50); // number increases w increments of .1 reaches almost 50 drops until almost -50 and repeats
    ellipse(300 + xOff, 200 + yOff, 20, 20);
  }
  incrementer += .01;
}


