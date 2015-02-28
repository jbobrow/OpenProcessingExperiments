
//copyright Laura Contero 2014
//Homework 9

/* Click your mouse to see a different picture. 
Press any key on your keyboard to reset the images.
*/


final int MAX_IMAGE = 3;
String [ ] wordsArray = {"the", "cat's", "meow"};
int catIndex = 0; //the initial image to start with

//PImage cat;
PImage [ ] catArray;

void setup( )
{
  size(400, 400);
  textSize(24);
  stroke(5);
  fill(180, 180, 180);

  imageMode(CENTER);
  catArray = new PImage[MAX_IMAGE];
  initImageArray(catArray);
}

void draw()
{
  background(255);
  printArray(wordsArray);
  showCat();
}

void printArray(String [ ] wordsArray)
{
  for ( int i = 0; i < wordsArray.length; i++)
  {
    text(wordsArray[i], 290, 24*i+300);
  }
}

void initImageArray(PImage [ ] catArray)
{
  for(int i = 0; i < catArray.length; i++)
  {
    String catName = "cat" + i + ".jpg";
    catArray[i] = loadImage(catName);
  }
}

void showCat()
{
  for(int i = 0; i < catArray.length; i++)
  {
    image(catArray[catIndex], width/3, height/2, 300, 400);
  }
}

void mousePressed()
{
  catIndex = int(random(catArray.length));
}

void keyPressed()
{
  background(255);
  catIndex = 0;
}



