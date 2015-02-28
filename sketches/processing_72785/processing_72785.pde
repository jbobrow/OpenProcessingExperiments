
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
  size(800, 800);  
  
  img1 = loadImage("Start.jpg");
  img2 = loadImage("Highway.jpg");
  img3 = loadImage("Tunnel.jpg");
  img4 = loadImage("Beach.jpg");
  img5 = loadImage("City.jpg");
  img6 = loadImage("Detour.jpg");
  img7 = loadImage("Mountain.jpg");
  img8 = loadImage("Forest.jpg");
  img9 = loadImage("Closed.jpg");
  img10 = loadImage("Snow.jpg");
  img11 = loadImage("Sunny.jpg");
  img12 = loadImage("Finish.jpg");
  
  
  int i = 1;
  
  
}

void draw()
{
 
  if ( i == 1 )
  {
    i= i + 1;
    image(img1, 0, 0);
  }
  
  else if (i == 20)
  {
    i= i + 1;
    image(img2, 0, 0);    
  }
  
  else if (i == 40)
  {
    i= i + 1;
    image(img3, 0, 0);    
  }
  
  else if (i == 60)
  {
    i= i + 1;
    image(img4, 0, 0);    
  }
  
  else if (i == 80)
  {
    i= i + 1;
    image(img5, 0, 0);    
  }
  
  else if (i == 100)
  {
    i= i + 1;
    image(img6, 0, 0);    
  }
  
  else if (i == 120)
  {
    i= i + 1;
    image(img7, 0, 0);    
  }
  
  else if (i == 140)
  {
    i= i + 1;
    image(img8, 0, 0);    
  }
  
  else if (i == 160)
  {
    i= i + 1;
    image(img9, 0, 0);    
  }  
  
    else if (i == 180)
  {
    i= i + 1;
    image(img10, 0, 0);    
  }
  
    else if (i == 200)
  {
    i= i + 1;
    image(img11, 0, 0);    
  }
  
    else if (i == 220)
  {
    i= i + 1;
    image(img12, 0, 0);    
  }
  
    else
  {
    i = i + 1;
    
    if ( i == 250)
      {
        i = 1;
      }
  }
  
}

