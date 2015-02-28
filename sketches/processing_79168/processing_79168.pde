
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/72785*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
PImage img8;
PImage img9;
PImage img10;
PImage img11;
PImage img12;

int i;

void setup() 
{
  size(900, 800);  
  
  img1 = loadImage("001.jpg");
  img2 = loadImage("002.jpg");
  img3 = loadImage("003.jpg");
  img4 = loadImage("004.jpg");
  img5 = loadImage("005.jpg");
  img6 = loadImage("006.jpg");
  img7 = loadImage("007.jpg");
  img8 = loadImage("008.jpg");
  img9 = loadImage("009.jpg");
  img10 = loadImage("010.jpg");
  img11 = loadImage("011.jpg");
  img12 = loadImage("012.jpg");
  
  
  int i = 1;
  
  
}

void draw()
{
 
  if ( i == 1 )
  {
    i= i + 1;
    image(img1, 0, 0);
  }
  
  else if (i == 10)
  {
    i= i + 1;
    image(img2, 0, 0);    
  }
  
  else if (i == 20)
  {
    i= i + 1;
    image(img3, 0, 0);    
  }
  
  else if (i == 30)
  {
    i= i + 1;
    image(img4, 0, 0);    
  }
  
  else if (i == 40)
  {
    i= i + 1;
    image(img5, 0, 0);    
  }
  
  else if (i == 50)
  {
    i= i + 1;
    image(img6, 0, 0);    
  }
  
  else if (i == 60)
  {
    i= i + 1;
    image(img7, 0, 0);    
  }
  
  else if (i == 70)
  {
    i= i + 1;
    image(img8, 0, 0);    
  }
  
  else if (i == 80)
  {
    i= i + 1;
    image(img9, 0, 0);    
  }  
  
    else if (i == 90)
  {
    i= i + 1;
    image(img10, 0, 0);    
  }
  
    else if (i == 100)
  {
    i= i + 1;
    image(img11, 0, 0);    
  }
  
    else if (i == 110)
  {
    i= i + 1;
    image(img12, 0, 0);    
  }
  
    else
  {
    i = i + 1;
    
    if ( i == 150)
      {
        i = 1;
      }
  }
  
}

