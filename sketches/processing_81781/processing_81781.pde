
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
PImage img13;
PImage img14;
PImage img15;
PImage img16;
PImage img17;
PImage img18;
PImage img19;
PImage img20;
PImage img21;
PFont font;
float a = 10;

int i;

void setup() 
{
  size(600, 400);  
  
  img1 = loadImage("01.jpg");
  img2 = loadImage("02.jpg");
  img3 = loadImage("03.jpg");
  img4 = loadImage("04.jpg");
  img5 = loadImage("05.jpg");
  img6 = loadImage("06.jpg");
  img7 = loadImage("07.jpg");
  img8 = loadImage("08.jpg");
  img9 = loadImage("09.jpg");
  img10 = loadImage("10.jpg");
  img11 = loadImage("11.jpg");
  img12 = loadImage("12.jpg");
  img13 = loadImage("13.jpg");
  img14 = loadImage("14.jpg");
  img15 = loadImage("15.jpg");
  img16 = loadImage("16.jpg");
  img17 = loadImage("17.jpg");
  img18 = loadImage("18.jpg");
  img19 = loadImage("19.jpg");
  img20 = loadImage("20.jpg");
  img21 = loadImage("21.jpg");
  font = loadFont("MountainRetreat-70.vlw");
  
  
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
  
      else if (i == 120)
  {
    i= i + 1;
    image(img13, 0, 0);    
  }
  
      else if (i == 130)
  {
    i= i + 1;
    image(img14, 0, 0);    
  }
  
      else if (i == 140)
  {
    i= i + 1;
    image(img15, 0, 0);    
  }
  
        else if (i == 150)
  {
    i= i + 1;
    image(img16, 0, 0);    
  }
  
        else if (i == 160)
  {
    i= i + 1;
    image(img17, 0, 0);    
  }
  
        else if (i == 170)
  {
    i= i + 1;
    image(img18, 0, 0);    
  }
        else if (i == 180)
  {
    i= i + 1;
    image(img19, 0, 0);    
  }
  
          else if (i == 190)
  {
    i= i + 1;
    image(img20, 0, 0);    
  }
  
          else if (i == 200)
  {
    i= i + 1;
    image(img21, 0, 0);    
  }
    else
  {
    i = i + 1;
    
    if ( i == 220)
      {
        i = 1;
      }
  }
  
  textFont (font);
  fill (0);
  text("gishwhes", a, 120);
    a +=1;
  
}

