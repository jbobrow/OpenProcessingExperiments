
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/150365*@* */


int edge, col, num=5; // declaring the variables for the edge round the image, the color and the number of columns
float unit; // unit = the width of a column, sz = size of the square
long rs = 100; // the variable for the randomSeed (that I want to change by mouseClick 

int [] fills = { 
   #007C6E, #A9BA29, #4F9C50, #002E51, #036472, 
  #00929C
};// array of colors

void setup() {
  size(600, 600);
  noStroke();
  rectMode(CENTER);
 
  edge = width/14; //the empty space around the 5x5 squares
  unit = (width-2*edge)/num; //the width of a column
 
}

void draw() {
 
   
randomSeed(rs);
  background(#eeeeee);
  for (int i=0; i<num; i++) {
    for (int j=0; j<num; j++) {
      float r = random(1);  // a random number between 0 and 0.9999 in order to differentiate between darker and lighter squares
      if (r>0.85) {  // if r is greater than 0.85 then the square will be darker
        
      } 
      else { //otherwiese it will be lighter

      }
      float varX = random(-20, 20);  // variables to make the squares look 'shaky'
      float varY = random(-20, 20);  // variables to make the squares look 'shaky'
int answer = int(random(fills.length)); 
      fill(fills[answer]); 
      plotRandomizedQuad(edge+(i)*unit+varX, edge+(j)*unit+varY, unit, unit);
    }
  }
}

void mouseClicked() {
  rs = hour()+minute()+second()+millis(); // = generate a new randomSeed > different look of the image
  //fill(fills[answer]); // = generate a new color
}

void plotRandomizedQuad(float x, float y, float w, float h) {
  float num =20;

  beginShape();
  vertex(x+random(-num, num), y+random(-num, num));
  vertex(x+random(-num, num), y+h+random(-num, num));
  vertex(x+w+random(-num, num), y+h+random(-num, num));
  vertex(x+w+random(-num, num), y+random(-num, num));
  endShape(CLOSE);
} // end plotRandomizedQuad

