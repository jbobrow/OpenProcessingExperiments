
PImage img;
int x;
int y;

int dot= 0;// save the number of the bubble
int [] mox= new int[19];// make a list of 20 that contains a new bubble's xaxis 
int [] my= new int[19];// make a list  of  20 that contains a new bubble's xaxis
boolean blue;

//color pix;
//float pointillize = 10;
//
//float lerp;

void setup() {
  size(457,658);
  img = loadImage("night.jpg");
//  imageMode(CENTER);
  noStroke();
}


void draw() {
   image(img, 0, 0);
   
  if (blue==true) {
    // blue is the switch to draw the new and old bubbles
        fill(237, 248, 170, 30);
    for(int i=1; i < dot+1; i++){ // sort through all of the available dots made
    
    for(int j=7; j < 100; j+=7) {
      float r= random(10);
    
    ellipse( mox[i], my[i], j+r, j+r);// draw each of the dots with their respectively stored locations. This is sorting form 1 to the amout of times you have released your mouse +1 so that you draw the next one/
    }
  }
}

}

void mouseReleased(){ // checking mouse released 
    dot++; //increase the dot number
    mox [dot]= mouseX; // make the next value of mox the current mouseX and mouseY positions
    my [dot]= mouseY;
    blue=true; // switch on your blue ellipse
   if (dot>=20) {// don't let dot be greater than the number of values in the mox and my arrays
    dot=0;
  }
  }


