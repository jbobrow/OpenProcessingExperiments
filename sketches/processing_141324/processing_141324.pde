
//HW_9
// copyright Joanne Lo jylo 2014
//used Cartoon Network's drawing
// if key press 'a', then background will turn white
// if mouse press, then 

final int MAX_IMAGE=5;
PImage [ ] picArray;
PFont font;
PImage img;


String [] words = {
  "IT'S","HOT","IN","TOPEKA","!", 
};
int x=30;

void setup()
{
size (500,400);
background(70,100,50);
imageMode(CENTER);
  picArray = new PImage [ MAX_IMAGE ];
  ImageArray(picArray);

}

void draw ()
{
  fill(75,100,57);
  rect(0,0,width, height);
  fill(255);
  font =loadFont ("AmericanTypewriter-48.vlw");
  textFont(font, 32);
  textAlign(CENTER);
  for( int i=0; i<words.length; i++)
  {
    text(words[i],i*100+70, x);
  }
  moveSentence();
  showImage();
}
int deltaX= 1;

void moveSentence()
{
  x=deltaX+x;
  if ( x > width )
  {x=0;}
}

int i=0;
void showImage()
{
  for(int i=0; i<picArray.length; i++)
  {
    image(picArray[i], 250, 300, 450, 300);
  }
}
 
void ImageArray(PImage [ ] picArray)
{
  for(int i = 0; i<picArray.length; i++)
  {
    String imageName = "th.png";
    picArray [i] = loadImage(imageName);
  }
}
 
void keyPressed()
{
  if (key == 'a')
  {
    fill(255,0,0);
    rect(0,0,width,height);
  }
}
void mouseMoved()
{
  img=loadImage("sun 3.png");
  image(img,0,0);
}



