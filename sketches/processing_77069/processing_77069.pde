
PImage recursion; //image name
float z;//increment for rotation
int x = 0;
int y = 0;


void setup () {
  size (300, 300);
recursion = loadImage("recur.jpg");//image filename


}

void draw() {
  smooth();
  imageMode(CENTER); //image centered
  background(63, 38, 25); //background matches image
  translate ((width/2)+x, (height/2)+y); //translates to center of screen, increments
  rotate(z*TWO_PI/360); //rotates 360 degrees around z
  image (recursion, 0, 0); //image display function
  z--; //increment for rotation
  //x-=3;//increment x-axis by 5(required for below 'if' statement//
  
  //UNCOMMENT THE BELOW LINES TO SEE THE IMAGE MOVE ACROSS THE X-AXIS
  /*if (x<-width+200) {//check for bounds
    x=width-400;//set back to beginning
  }*/
}

