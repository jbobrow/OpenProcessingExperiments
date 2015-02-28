
// Iv Shqevi
// lab 3

void setup() {
  size(300, 300);
  noStroke();
  smooth();
  background(255);
}

float count = 90;
float squares;
float rndColor;

void draw() {

  if (count > 0) {
   rndColor = random(20);
   if(rndColor > 3){ // probability 
     fill(0);
   }else{
     fill(255,0,0);
   }
   
   // creation of random sqeares     
   squares = random(10,50);
   rect(random(width),random(height), squares, squares);
  }
  count--;
}



