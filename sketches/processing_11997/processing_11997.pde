
//change hues
float hueCounter = 0;
float rateOfChange = 0.05;

void setup () {
  size (500, 500);
  colorMode (HSB, 100);
}

void draw () {
 
 hueCounter = hueCounter + rateOfChange;
 //setting variable
 if (hueCounter > 100) {
  hueCounter = 0; 
 }
  color changingColor = color (hueCounter, 100, 100);
  background (changingColor);  
  
}


