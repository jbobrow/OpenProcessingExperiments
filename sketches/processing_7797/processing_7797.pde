
int screen = 0;

PImage intro;
PImage s;
PImage y;
PImage n;
PImage img1;
PImage img2; 
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;

void setup()
{
  size(640,480);
  intro = loadImage("intro.png");
  s = loadImage("start.png");
  y = loadImage("y.png");
  n = loadImage("n.png");
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("6.png");
  img7 = loadImage("7.png");
}

void draw()
{
  background(255);
  smooth();
  
  //screen 0
  if(screen == 0)
  {
    image(intro, 0,0);
    if((keyPressed == true) && (key == 'c'))
    {
      screen = 1;
    }
  }
  //screen 1
  else if(screen == 1)
  {
    image(s, 0,0); 
    
    if((keyPressed == true) && (key == 'y'))
    {
      screen = 2;
    }
    else if((keyPressed == true) && (key == 'n'))
    {
      screen = 3;
    }
  }
  
  
  //screen 2
  else if(screen == 2)
  {
    image(y, 0,0);
  
    if((keyPressed == true) && (key == 'a'))
    {
      screen = 4;
    }
    else if((keyPressed == true) && (key == 'r'))
    {
      screen = 5;
    }
  }
    
  //screen 3
  else if(screen == 3)
  {
    image(n, 0,0);
  
    if((keyPressed == true) && (key == 'c'))
    {
      screen = 1;
    }
    if((keyPressed == true) && (key == 'r'))
    {
      screen = 5;
    }
  }
    
  
  //screen 4
  else if(screen == 4)
  {
    image(img1, 0,0);
  
    if((keyPressed == true) && (key == 'o'))
    {
      screen = 6;
    }
    else if((keyPressed == true) && (key == 'w'))
    {
      screen = 7;
    }
    else if((keyPressed == true) && (key == 'e'))
    {
      screen = 8;
    } 
  }
  
  //Screen 5
  else if(screen == 5)
  {
    image(img2, 0,0);
  
    if((keyPressed == true) && (key == 's'))
    {
      screen = 0;
    }
  }
    
  //Screen 6
  else if(screen == 6)
  {
    image(img3, 0,0);
  
    if((keyPressed == true) && (key == 'w'))
    {
      screen = 7;
    }
    else if((keyPressed == true) && (key == 'h'))
    {
      screen = 9;
    }
  }
    
    
  //Screen 7
  else if(screen == 7)
  {
    image(img4, 0,0);
  
    if((keyPressed == true) && (key == 'p'))
    {
      screen = 10;
    }
    else if((keyPressed == true) && (key == 'r'))
    {
      screen = 5;
    }
  }
    
  //Screen 8
  else if(screen == 8)
  {
    image(img5, 0,0);
  
    if((keyPressed == true) && (key == 's'))
    {
      screen = 0;
    }
  }
  
  //Screen 9
  else if(screen == 9)
  {
    image(img6, 0,0);
  
    if((keyPressed == true) && (key == 's'))
    {
      screen = 0;
    }
  }
    
  //Screen 10
  else if(screen == 10)
  {
    image(img7, 0,0);
  
    if((keyPressed == true) && (key == 's'))
    {
      screen = 0;
    }
  }
    
println(screen);
}


