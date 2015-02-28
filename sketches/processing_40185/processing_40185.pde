
PImage img;
int numdots = 500;
int[] dotsize = new int[numdots];
int xposition = 0;

PImage img2;

void setup() {
  smooth();
  size(300,300);
  noStroke();
  rectMode(CORNER);
  frameRate(20);

  img = loadImage("substanceD.jpg");                  //image used as color source
  img2 = loadImage("substanceDgray.jpg");              //background image

  background(img2);

  for(int i = 0; i < numdots; i++) {
    dotsize[i] = 1;
  }
}
void draw() {
  noStroke();
  fill(0,1);
  rect(0,0,300,300);
  for (int i = 0; i <300; i++) {

    color c = img.get(xposition, i);
    int dark = int((255-brightness(c))/7);        //finds the darkness value and this corresponds to the size of the triangles
    dotsize[i] = dark;

    fill(c);
    stroke(c);
    triangle(xposition, i+100, xposition,i,(xposition-dotsize[i]),i+50);     //draws a triangle filled with the color taken from the image
    strokeWeight(2);
    line(xposition,0,xposition,300);

    if(xposition > width) {                      //resets the scanner when it grows to 300 px
      xposition = 0;
      tint(150);                         //lowers the opacity of the image
      image(img2,0,0);                  //places the background image
    }
  }
  xposition++;
}


