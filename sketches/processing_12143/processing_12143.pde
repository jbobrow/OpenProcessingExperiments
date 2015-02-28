
// in this example we are using the loop to get the colour value from a row of pixels
// the colour of each pixel is then put into a sequence of squares


int Xpos; 
int Ypos; 
int myWidth; 
int myHieght; 
PImage img;

void setup() {
  size(610,610);
  img = loadImage("image0013.jpg");

}
void draw() {
  background(255);

  myWidth = 50;
  myHieght = myWidth;
  Xpos = 10;
  Ypos = 10;


  for(int i = 1; i<=100; i++){
    
    /* using the counter of i we are getting the colour value of the pixels from  image image0013.jpg
   the first time through the loop we will get the colour value of the pixel positioned at x = 1 and y = 1
  the next time the loop runs we will get the colour value of the pixel positioned at x = 2 and y = 2
   and so on and so on until the loop finishes and gets the colour value at x and y = 100;
   The colour value is stored in a variable called myPixel
   */


    color myPixel = img.get(i,i);
   // the value of the fill colour changes every time we loop through because the value of myPixel is being constantly updated
   // this means that every time that we assign a fill colour to a new square it will be different


    fill (myPixel);

    rect(Xpos,Ypos,myWidth,myHieght);

    Xpos = Xpos+myWidth+10;

    if (Xpos >= width){

      Ypos = Ypos+myHieght+10; 

      Xpos = 10;
    }
  }
}




