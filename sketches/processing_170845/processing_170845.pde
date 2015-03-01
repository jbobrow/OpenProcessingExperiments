
/*
Heein Park
24 boxes interface
Each 24 boxes means an hour. If they are all filled up, it represents
that a day is passed.

http://processing.org/examples/clock.html
http://processing.org/examples/embeddediteration.html
http://processing.org/examples/button.html
http://processing.org/examples/blur.html
*/

PImage plus;
PImage minus;
PFont font;
PFont font1;
PFont font2;
PGraphics pg;
PGraphics main;
PGraphics clock;
int gridSize = 44;
boolean menu;
boolean[] hbox;
int[] hboxx;
int[] hboxy;
boolean[] rectOver;
boolean plusOver;
boolean exOver;
boolean numeric;

void setup()
{
  size(214,296);
  
  //Graphics Setup
  pg = createGraphics(184, 270);
  main = createGraphics(214, 296);
  clock = createGraphics(214, 296);
  
  //Font Setup
  font = loadFont("AdobeGothicStd-Bold-20.vlw");
  font1 = loadFont("AdobeGothicStd-Bold-100.vlw");
  font2 = loadFont("AdobeGothicStd-Bold-30.vlw");
  
  //Image Setup
  plus = loadImage("+.png");
  minus = loadImage("-.png");
  
  //Array Boolean Setup
  rectOver = new boolean[24];
  hbox = new boolean[24];
  hboxx = new int[24];
  hboxy = new int[24];
  
  
  // Reseting all boolean values
  for (int i = 0; i < 24; i++)
  {
    rectOver[i] = false;
  }
  
  plusOver = false;
  exOver = false;
  numeric = false;
  
  // Setting each boxes' positions
  
  for (int a = 0;a <= 5;a++)
  {
    hboxx[4*a] = 29;
    hboxx[4*a+1] = 29 + gridSize;
    hboxx[4*a+2] = 29 + gridSize*2;
    hboxx[4*a+3] = 29 + gridSize*3;
  }
  
  for (int b = 0;b <= 3;b++)
  {
    hboxy[b] = 25;
    hboxy[4+b] = 25 + gridSize;
    hboxy[8+b] = 25 + gridSize*2;
    hboxy[12+b] = 25 + gridSize*3;
    hboxy[16+b] = 25 + gridSize*4;
    hboxy[20+b] = 25 + gridSize*5;
  }
}

void draw()
{
  background(0);
  update(mouseX, mouseY);

  // Creating a main screen
  
  main.beginDraw();
  
  main.background(0);
  
  //Minute Calculation
  
  int mbox = floor(minute()/15);
  
  // Main Menu
  // Creating Empty Boxes
  
  /*
  for (int x = 30; x <= width - 36; x += gridSize)
  {
    for (int y = 26; y <= height - 36; y += gridSize)
    {
      main.stroke(255);
      main.strokeWeight(3.0);
      main.noFill();
      main.rect(x-1, y-1, 24, 24);
    }
  }
  */
  
  for (int i = 0; i < 24; i++)
  {
    main.stroke(255);
    main.strokeWeight(3.0);
    main.noFill();
    main.rect(hboxx[i], hboxy[i], 24, 24);
  }
  
  // Creating Lines above and beneath the Boxes
  // This lines may indicate menus for monthly schedule and option.
  //stroke(255);
  //strokeCap(PROJECT);
  //line(36, height - 20, width - 36, height - 20);
  
  // Filling Boxes when an hour passed
  
  for (int i = 0; i < hour(); i++)
  {
    if (hbox[i] = true)
    {
      main.fill(255);
      main.rect(hboxx[i], hboxy[i], 24, 24);
      main.rect(hboxx[i+1], hboxy[i+1], 5*mbox, 24);
    }
  }
  
  // If it's on 12 o'clock, it will count minute separately.
  
  if( hour() == 0)
  {
    main.fill(255);
    main.rect(hboxx[0], hboxy[0], 5*mbox, 24);
  }
  
  main.endDraw();
  
  if (numeric == true)
  {
    tint(255, 100);
  } else
  {
    tint(255, 255);
  }
  image(main, 0, 0);
  
  //If menus are poped up the boxes are blurred
  if(menu == true || numeric == true)
  {
  filter(BLUR, 10);
  }
  
    // Creating a numeric digital clock if boolean numeric is true
  // In other words, pressing spacebar to open the digital clock
  
  if (numeric == true)
  {
    clock.beginDraw();
    clock.background(0, 0);
    
    // Hour and minute
    clock.textFont(font1, 100);
    clock.text(hour(), 53, 115);
    clock.text(minute(), 53, 225);
    
    // Month and Day
    clock.textFont(font2, 30);
    clock.text(day(), 117, 274);
    clock.text(month(), 77, 274);
    
    // Line between hour and minute
    clock.stroke(255);
    clock.strokeCap(SQUARE);
    clock.strokeWeight(3);
    clock.noFill();
    //clock.line(35, 132, 179, 132);
    //clock.rect(34, 28, 146, 210);
    
    clock.endDraw();
    tint(255, 255);
    image(clock, 0, 0);
  }
  
  // Creating daily schedule popup windows
  
  if(menu == true)
  {
  pg.beginDraw();
    
  // Background(Transparent)
  pg.background(0, 0);
    
  // Window
  pg.strokeWeight(2);
  pg.stroke(255);
  pg.fill(80, 80);
  pg.rect(0, 0, 184, 270, 10);
    
  // Exit Buttons
  pg.textFont(font, 20);
  if (exOver)
  {
    pg.fill(200);
  }else
  {
    pg.fill(255);
  }
  pg.text("back", 70, 260);
  
  // Plus Button
  pg.smooth();
  if (plusOver)
  {
    pg.tint(255, 0, 0);
  }else
  {
    pg.tint(255, 255, 255);
  }
  pg.image(plus, 10, 10, 26, 26);
    
  pg.endDraw();
  image(pg, 15, 13);
  }
}

// If an user clicks one of the icons, it will pop up a window. 

void mousePressed()
{
  for(int i = 0; i < 24; i++)
  {
    if (numeric == false)
    {
      if (menu == false)
      {
        if (rectOver[i])
        {
          menu = true;
        }
      } else
      if (menu == true)
      {
        if (exOver)
        {
          menu = false;
      } /*else
      if (plusOver[i])
      {
        if (Redbox[i] == false)
        {
          Redbox[i] = true;
        }else if (Redbox[i] == true)
        {
          Redbox[i] = false;
        }
      }*/
      }
    }
  }
}

void update(int x, int y)
{
  for(int i = 0; i < 24; i++)
    if ( overRect(hboxx[i], hboxy[i]) && menu == false)
    {
      exOver = false;
      plusOver = false;
      rectOver[i] = true;
    } else
    if ( overEx(85, 260) &&  menu == true)
    {
      exOver = true;
      plusOver = false;
      rectOver[i] = false;
    }else
    if ( overPlus(25, 23) &&  menu == true)
    {
      exOver = false;
      plusOver = true;
      rectOver[i] = false;
    }else
    {
      rectOver[i] = exOver = plusOver = false;
    }
}

boolean overRect(int x, int y)
{
    if (mouseX >= x && mouseX <= x+24 && 
        mouseY >= y && mouseY <= y+24)
    {
      return true;
    } else
    {
      return false;
    }
}

boolean overEx(int x, int y)
{
    if (mouseX >= x && mouseX <= x+44 && 
        mouseY >= y && mouseY <= y+20)
    {
      return true;
    } else
    {
      return false;
    }
}

boolean overPlus(int x, int y)
{
    if (mouseX >= x && mouseX <= x+30 && 
        mouseY >= y && mouseY <= y+30)
    {
      return true;
    } else
    {
      return false;
    }
}

void keyPressed() 
{
  if (key == ' ') 
  {
    if (menu == false)
    {
      if (numeric == false)
      {
        numeric = true;
      }else if(numeric == true)
      {
        numeric = false;
      }
    }
  }
}


