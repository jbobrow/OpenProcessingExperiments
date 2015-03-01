

//test
// variables for loading message
//counters
int i = 0;
int letter = 0;
boolean load = false;
// a character type array named 'sentence'
char[] sentence = {'L', 'O', 'V', 'I', 'N', 'G', ' ', 'A', 'R', 'T', '.', '.', '.'}; 

void setup() {
  size(600, 600);
  background(#ff00ff);
}

void draw() { 
  //load message 1 letter at a timme
  int m = millis(); // timer in ms?
  fill(#000000);
  textSize(32);
  if(m % 10 <= 2){                // if less than 2ms...???
  text(sentence[letter], i, 30);  // output 1 letter of sentence, increments of i across x-axis, maintain 30 spaces y-axis
  letter++;                       // add letters across
  i+=40;                          // in increments of 40 spaces
  letter = constrain(letter, 0, sentence.length); // constrains letter to start at 0 and end with last value in array,'sentence'
  if(letter >= sentence.length) {  // if letter has reached last value...
    noLoop();                      // stop looping 
    load = true;                    // start load ...technically check if load is true or false
  }
  if(load) {              //if load is true continue...
    strokeWeight(30);
    stroke(0,255,255,50);
    fill(255,255,0,50);
    rect(20, 20, 500, 500);
    strokeWeight(31);
    stroke( 255,255,0,50);
    fill(0,255,255,50);
    ellipse(250, 300, 100, 300);
      
    }
  }
}



