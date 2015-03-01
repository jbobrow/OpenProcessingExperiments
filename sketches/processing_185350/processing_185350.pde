
/* @pjs preload=" bearNoBlink.jpg, bearBlink.jpg, catBlink.jpg, catNoBlink.jpg, owlBlink.jpg, owlNoBlink.jpg, sealBlink.jpg, sealNoBlink.jpg, dogBlink.jpg, dogNoBlink.jpg, redBlink.jpg, redNoBlink.jpg, goldenBlink.jpg, goldenNoBlink.jpg"; */ 


int num = 0;
String newImage = "bearBlink.jpg";

void setup()
{
  size(500,500);
 // noLoop();
   background(255);
   
  num = int(random( 0, 7));
   //print (num);


  
  if (num == 0)
  {
  PImage bear= loadImage("bearNoBlink.jpg");
  image(bear, 0,0, 500,500);
  newImage = "bearBlink.jpg";
  }
  if (num == 1)
  {
  PImage cat= loadImage("catNoBlink.jpg");
  image(cat, 0,0, 500,500);
  newImage = "catBlink.jpg";
  }
  
  if (num == 2)
  {
  PImage owl= loadImage("owlNoBlink.jpg");
  image(owl, 0,0, 500,500);
  newImage = "owlBlink.jpg";
  }
  
  if (num == 3)
  {
  PImage seal= loadImage("sealNoBlink.jpg");
  image(seal, 0,0, 500,500);
  newImage = "sealBlink.jpg";
  }
    if (num == 4)
  {
  PImage dog= loadImage("dogNoBlink.jpg");
  image(dog, 0,0, 500,500);
  newImage = "dogBlink.jpg";
  }
  
    if (num == 5)
  {
  PImage golden= loadImage("goldenNoBlink.jpg");
  image(seal, 0,0, 500,500);
  newImage = "goldenBlink.jpg";
  }
    if (num == 6)
  {
  PImage red= loadImage("redNoBlink.jpg");
  image(red, 0,0, 500,500);
  newImage = "redBlink.jpg";
  }
}
 
  
 



void draw()
{
  
}

void mouseClicked() {

   PImage wink= loadImage(newImage);
  image(wink, 0,0, 500,500);

  

}


