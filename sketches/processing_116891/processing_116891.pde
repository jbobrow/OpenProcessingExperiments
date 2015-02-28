
PImage img;
int x;
int y;

int dot= 0;// save the number of the bubble
int [] mox= new int[12];// make a list of 20 that contains a new bubble's xaxis 
int [] my= new int[12];// make a list  of  20 that contains a new bubble's xaxis
boolean light;

void setup() {
  size(457, 658);
  img = loadImage("night.jpg");
  //  imageMode(CENTER);
  noStroke();
}


void draw() {
  image(img, 0, 0);

  if (light==true) {
    fill(237, 248, 170, 30);
    for (int i=1; i < dot+1; i++) { 
      for (int j=7; j < 100; j+=7) {
        float r= random(10);

        ellipse( mox[i], my[i], j+r, j+r);
      }
    }
  }
}


void mouseReleased() { // checking mouse released
  if (mouseX > 120 && mouseY > 120 && mouseX < 380 && mouseY < 530 ) // set the limit
  {    
    dot++; //increase the dot number
    light=true; // switch on your blue ellipse

      if (dot>=12) {// don't let dot be greater than the number of values in the mox and my arrays
      dot=0;
    }

    else

    {

      mox [dot]= mouseX; // make the next value of mox the current mouseX and mouseY positions

      my [dot]= mouseY;
    }
  }
}



