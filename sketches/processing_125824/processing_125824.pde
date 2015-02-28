
int cx, cy;  //declaring the center of the canvas
float secondsRadius; //radius of the colored arc based on the second
float clockDiameter; //clock size
int numChars = 26;  //26 letters in the alphabet
color[] colors = new color[numChars]; //color gradient
boolean newletter;


void setup() {
  size(1000, 1000); //canvas size
  background (0); //black background
  noStroke(); //no outline
  colorMode(HSB, numChars); //color mode
  for(int i = 0; i < numChars; i++) {
    colors[i] = color(i, numChars, numChars);  //assigning colors to letters
  
  int radius = min(width, height) / 2;  //radius is half of diameter
  secondsRadius = radius * .72;  //max arc size in relation to canva
  clockDiameter = radius * 2;  //diameter is twice the radius
  
  cx = width / 2; //assigning center
  cy = height / 2;  //assigning center
}
}

void draw() {
  }  

void keyPressed()
{
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;  //position of arc relative to second
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI;  //position of arc relative to minute of the hour
  int keyIndex = -1;
  if (key >= 'A' && key <= 'Z') {  //A through Z makes an arc!!
    keyIndex = key - 'A';
  } else if (key >= 'a' && key <= 'z') {  //a thourgh z makes an arc!!
    keyIndex = key - 'a';
  }
  if (keyIndex == -1) {
    
    
  } else { 
    fill(colors[key-'a'], 30); //assign fill color
    arc (cx, cy, width * second() / 60, height * second() / 60, m, m + PI / 30);  //assign arc origin and length
  }
}


