

//img & img2 dimensions are 52w X 90h
//img is the varible for "pattern1.gif"
PImage img;
//img2 is the varible for "basis.gif"
PImage img2;

void setup() {
  size (450, 450);
  img = loadImage("pattern1.gif");
  img2 = loadImage("basis.gif");
  background (255, 255, 255);
}


void draw() {
  //repeats "i" 10 times across
  for (int i=0; i< 10; i++) {
    //repeats "c" 6 times down for each time "i" is looped above
    for (int c=0; c<6; c++) {
      /*spaces registration points for "pattern1.gif" 52 pixels apart horizontally
       and 90 pixels apart vertically*/
      image(img, i*52, c*90);
    }
  }
  //"basis.gif" is the same as "pattern1.gif" only black
  image(img2, 312, 270);
}


