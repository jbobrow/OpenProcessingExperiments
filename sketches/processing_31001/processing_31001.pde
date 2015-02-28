
//Tron2
//Matt Johnson
//Updated January 26, 2010

PFont introFont;
int rx1,rx2,ry1,ry2,rxChange,ryChange,rspeed;
int gx1,gx2,gy1,gy2,gxChange,gyChange,gspeed;
int bx1,bx2,by1,by2,bxChange,byChange,bspeed;
int ox1,ox2,oy1,oy2,oxChange,oyChange,ospeed;
int gridSpace, strokeThickness, strokeAdjust;
int i, sizeDrop, num;
boolean redPlayer,greenPlayer,bluePlayer,orangePlayer, start, ran, countDown;
color check, gridColor, backgroundColor;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////Setup
void setup()
{
  introFont = loadFont("OCRAExtended-24.vlw");
  textFont(introFont);
  size(600,600);
  backgroundColor = color(0,0,0);
  smooth();
  background(backgroundColor);
  redPlayer = true;
  greenPlayer = true;
  bluePlayer = true;
  orangePlayer = true;
  rx1=0;
  ry1=0;
  rx2=width/2-100;
  ry2=height/2-100;
  rspeed = 2;
  rxChange = -rspeed;
  gx1=0;
  gy1=0;
  gx2=width/2-100;
  gy2=height/2+100;
  gspeed = 2;
  gxChange = -gspeed;
  bx1=0;
  by1=0;
  bx2=width/2+100;
  by2=height/2-100;
  bspeed = 2;
  bxChange = bspeed;
  ox1=0;
  oy1=0;
  ox2=width/2+100;
  oy2=height/2+100;
  ospeed = 2;
  oxChange = ospeed;
  sizeDrop = 0;
  num = 3;
  countDown = false;
  gridColor = color(25,150,250);
  gridSpace = 40;
  stroke(gridColor);
  for (int x = gridSpace; x <= width; x = x+gridSpace)
  {
    line(x,0,x,height);
  }
  for (int y = gridSpace; y <= height; y = y+gridSpace)
  {
    line(0,y,width,y);
  }
  strokeThickness = 4;
  strokeAdjust = 1;
  strokeWeight(strokeThickness);
  start = false;
  ran = false;
  frameRate(30);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Draw
void draw()
{
  if (start == false)
  {
    startingScreen();
  }
  if (countDown == true)
  {
    if (ran == false)
    {
      background(backgroundColor);
      gridColor = color(25,150,250);
      gridSpace = 40;
      stroke(gridColor);
      strokeWeight(1);
      for (int x = gridSpace; x <= width; x = x+gridSpace)
      {
        line(x,0,x,height);
      }
      for (int y = gridSpace; y <= height; y = y+gridSpace)
      {
        line(0,y,width,y);
      }
      strokeThickness = 4;
      strokeAdjust = (strokeThickness /2)+1;
      strokeWeight(strokeThickness);
      ran = true;
    }
    strokeWeight(6);
    if (redPlayer == true)
    {
      stroke(255,0,0);
      point(rx2,ry2);
    }
    if (greenPlayer == true)
    {
      stroke(0,255,0);
      point(gx2,gy2);
    }
    if (bluePlayer == true)
    {
      stroke(0,0,255);
      point(bx2,by2);
    }
    if (orangePlayer == true)
    {
      stroke(250,150,0);
      point(ox2,oy2);
    }
    strokeWeight(strokeThickness);
    fill(gridColor);
    if (num == 3)
    {
      textFont(introFont, 24-sizeDrop);
      text("3", width/2-2,height/2+(sizeDrop-24));
      sizeDrop++;
      if (sizeDrop >= 24)
      {
        sizeDrop = 0;
        num = 2;
      }
    }
    if (num == 2)
    {
      textFont(introFont, 24-sizeDrop);
      text("2", width/2-2,height/2+(sizeDrop-24));
      sizeDrop++;
      if (sizeDrop >= 24)
      {
        sizeDrop = 0;
        num = 1;
      }
    }
    if (num == 1)
    {
      textFont(introFont, 24-sizeDrop);
      text("1", width/2-2,height/2+(sizeDrop-24));
      sizeDrop++;
      if (sizeDrop >= 24)
      {
        sizeDrop = 0;
        countDown = false;
        start = true;
      }
    }
    ran = false;
  }
  if (start == true)
  {
    if (ran == false)
    {
      background(backgroundColor);
      gridColor = color(25,150,250);
      gridSpace = 40;
      stroke(gridColor);
      strokeWeight(1);
      for (int x = gridSpace; x <= width; x = x+gridSpace)
      {
        line(x,0,x,height);
      }
      for (int y = gridSpace; y <= height; y = y+gridSpace)
      {
        line(0,y,width,y);
      }
      strokeThickness = 4;
      strokeAdjust = (strokeThickness /2)+1;
      strokeWeight(strokeThickness);
      ran = true;
    }
    if (redPlayer == true)
    {
      redMove();
      redHitCheck();
    }
    if (greenPlayer == true)
    {
      greenMove();
      greenHitCheck();
    }
    if (bluePlayer == true)
    {
      blueMove();
      blueHitCheck();
    }
    if (orangePlayer == true)
    {
      orangeMove();
      orangeHitCheck();
    }
    winnerCheck(); 
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Key Controls
void keyPressed()
{
  //Red
  if (redPlayer == true)
  {
    if (keyCode == 37)
    {
      if (rxChange != rspeed)
      {
        rxChange = -rspeed;
        ryChange = 0;
      }
    }
    if (keyCode == 38)
    {
      if (ryChange != rspeed)
      {
        ryChange = -rspeed;
        rxChange = 0;
      }
    }
    if (keyCode == 39)
    {
      if (rxChange != -rspeed)
      {
        rxChange = rspeed;
        ryChange = 0;
      }
    }
    if (keyCode == 40)
    {
      if (ryChange != -rspeed)
      {
        ryChange = rspeed;
        rxChange = 0;
      }
    }
  }

  //Green
  if (greenPlayer == true)
  {
    if (key == 'a')
    {
      if (gxChange != gspeed)
      {
        gxChange = -gspeed;
        gyChange = 0;
      }
    }
    if (key == 'w')
    {
      if (gyChange != gspeed)
      {
        gyChange = -gspeed;
        gxChange = 0;
      }
    }
    if (key == 'd')
    {
      if (gxChange != -gspeed)
      {
        gxChange = gspeed;
        gyChange = 0;
      }
    }
    if (key == 's')
    {
      if (gyChange != -gspeed)
      {
        gyChange = gspeed;
        gxChange = 0;
      }
    }
  }

  //Blue
  if (bluePlayer == true)
  {
    if (key == 'j')
    {
      if (bxChange != bspeed)
      {
        bxChange = -bspeed;
        byChange = 0;
      }
    }
    if (key == 'i')
    {
      if (byChange != bspeed)
      {
        byChange = -bspeed;
        bxChange = 0;
      }
    }
    if (key == 'l')
    {
      if (bxChange != -bspeed)
      {
        bxChange = bspeed;
        byChange = 0;
      }
    }
    if (key == 'k')
    {
      if (byChange != -bspeed)
      {
        byChange = bspeed;
        bxChange = 0;
      }
    }
  }

  //Orange
  if (orangePlayer == true)
  {
    if (keyCode == 100)
    {
      if (oxChange != ospeed)
      {
        oxChange = -ospeed;
        oyChange = 0;
      }
    }
    if (keyCode == 104)
    {
      if (oyChange != ospeed)
      {
        oyChange = -ospeed;
        oxChange = 0;
      }
    }
    if (keyCode == 102)
    {
      if (oxChange != -ospeed)
      {
        oxChange = ospeed;
        oyChange = 0;
      }
    }
    if (keyCode == 101)
    {
      if (oyChange != -ospeed)
      {
        oyChange = ospeed;
        oxChange = 0;
      }
    }
  }
} 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Hit checks
void redHitCheck()
{
  if (ryChange >0)
  {
    check = get(rx2,ry2+strokeAdjust);
  }
  if (ryChange <0)
  {
    check = get(rx2,ry2-strokeAdjust);
  }
  if (rxChange >0)
  {
    check = get(rx2+strokeAdjust,ry2);
  }
  if (rxChange <0)
  {
    check = get(rx2-strokeAdjust,ry2);
  }
  if ((check != backgroundColor)&&(check!= gridColor))
  {
    redPlayer = false;
  }
}

void greenHitCheck()
{
  if (gyChange >0)
  {
    check = get(gx2,gy2+strokeAdjust);
  }
  if (gyChange <0)
  {
    check = get(gx2,gy2-strokeAdjust);
  }
  if (gxChange >0)
  {
    check = get(gx2+strokeAdjust,gy2);
  }
  if (gxChange <0)
  {
    check = get(gx2-strokeAdjust,gy2);
  }
  if ((check != backgroundColor)&&(check!= gridColor))
  {
    greenPlayer = false;
  }
}

void blueHitCheck()
{
  if (byChange >0)
  {
    check = get(bx2,by2+strokeAdjust);
  }
  if (byChange <0)
  {
    check = get(bx2,by2-strokeAdjust);
  }
  if (bxChange >0)
  {
    check = get(bx2+strokeAdjust,by2);
  }
  if (bxChange <0)
  {
    check = get(bx2-strokeAdjust,by2);
  }
  if ((check != backgroundColor)&&(check!= gridColor))
  {
    bluePlayer = false;
  }
}

void orangeHitCheck()
{
  if (oyChange >0)
  {
    check = get(ox2,oy2+strokeAdjust);
  }
  if (oyChange <0)
  {
    check = get(ox2,oy2-strokeAdjust);
  }
  if (oxChange >0)
  {
    check = get(ox2+strokeAdjust,oy2);
  }
  if (oxChange <0)
  {
    check = get(ox2-strokeAdjust,oy2);
  }
  if ((check != backgroundColor)&&(check!= gridColor))
  {
    orangePlayer = false;
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Movements
void redMove()
{
  rx1=rx2;
  ry1=ry2;
  rx2=rx1+rxChange;
  ry2=ry1+ryChange;
  stroke(255,0,0);
  if ((rx1 <= 0)||(rx1 >= width))
  {
    redPlayer = false;
  }
  if ((rx2 <= 0)||(rx2 >= width))
  {
    redPlayer = false;
  }
  if ((ry1 <= 0)||(ry1 >= height))
  {
    redPlayer = false;
  }
  if ((ry2 <= 0)||(ry2 >= height))
  {
    redPlayer = false;
  }
  line(rx1,ry1,rx2,ry2);
}

void greenMove()
{
  gx1=gx2;
  gy1=gy2;
  gx2=gx1+gxChange;
  gy2=gy1+gyChange;
  stroke(0,255,0);
  if ((gx1 <= 0)||(gx1 >= width))
  {
    greenPlayer = false;
  }
  if ((gx2 <= 0)||(gx2 >= width))
  {
    greenPlayer = false;
  }
  if ((gy1 <= 0)||(gy1 >= height))
  {
    greenPlayer = false;
  }
  if ((gy2 <= 0)||(gy2 >= height))
  {
    greenPlayer = false;
  }
  line(gx1,gy1,gx2,gy2);
}

void blueMove()
{
  bx1=bx2;
  by1=by2;
  bx2=bx1+bxChange;
  by2=by1+byChange;
  stroke(0,0,255);
  if ((bx1 <= 0)||(bx1 >= width))
  {
    bluePlayer = false;
  }
  if ((bx2 <= 0)||(bx2 >= width))
  {
    bluePlayer = false;
  }
  if ((by1 <= 0)||(by1 >= height))
  {
    bluePlayer = false;
  }
  if ((by2 <= 0)||(by2 >= height))
  {
    bluePlayer = false;
  }
  line(bx1,by1,bx2,by2);
}

void orangeMove()
{
  ox1=ox2;
  oy1=oy2;
  ox2=ox1+oxChange;
  oy2=oy1+oyChange;
  stroke(250,150,0);
  if ((ox1 <= 0)||(ox1 >= width))
  {
    orangePlayer = false;
  }
  if ((ox2 <= 0)||(ox2 >= width))
  {
    orangePlayer = false;
  }
  if ((oy1 <= 0)||(oy1 >= height))
  {
    orangePlayer = false;
  }
  if ((oy2 <= 0)||(oy2 >= height))
  {
    orangePlayer = false;
  }
  line(ox1,oy1,ox2,oy2);
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Player Select
void mouseClicked()
{
  if (start == false)
  {
    if ((mouseX >= width/2-100) && (mouseX <= width/2-75) && (mouseY >= height/2-100) && (mouseY <= height/2-75))
    {
      if (redPlayer == true)
      {
        redPlayer = false;
      }
      else
      {
        redPlayer = true;
      }
    }
    if ((mouseX >= width/2-100) && (mouseX <= width/2-75) && (mouseY >= height/2-50) && (mouseY <= height/2-25))
    {
      if (greenPlayer == true)
      {
        greenPlayer = false;
      }
      else
      {
        greenPlayer = true;
      }
    }
    if ((mouseX >= width/2-100) && (mouseX <= width/2-75) && (mouseY >= height/2) && (mouseY <= height/2+25))
    {
      if (bluePlayer == true)
      {
        bluePlayer = false;
      }
      else
      {
        bluePlayer = true;
      }
    }
    if ((mouseX >= width/2-100) && (mouseX <= width/2-75) && (mouseY >= height/2+50) && (mouseY <= height/2+75))
    {
      if (orangePlayer == true)
      {
        orangePlayer = false;
      }
      else
      {
        orangePlayer = true;
      }
    }
    if ((mouseX >= width/2-50) && (mouseX <= width/2+50) && (mouseY >= height/2+90) && (mouseY <= height/2+120))
    {
      countDown = true;
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Winner Check
void winnerCheck()
{
  if ((greenPlayer == false)&&(bluePlayer==false)&&(orangePlayer==false))
  {
    fill(255,255,255);
    stroke(gridColor);
    rect(width/2-100,height/2-40,width/2+100,height/2+40);
    textFont(introFont, 24);
    fill(255,0,0);
    text("Red Wins!",width/2-65,height/2+10);
    stop();
  }
  if ((redPlayer == false)&&(bluePlayer==false)&&(orangePlayer==false))
  {
    fill(255,255,255);
    stroke(gridColor);
    rect(width/2-100,height/2-40,width/2+100,height/2+40);
    textFont(introFont, 24);
    fill(0,255,0);
    text("Green Wins!",width/2-80,height/2+10);
    stop();
  } 
  if ((greenPlayer == false)&&(redPlayer==false)&&(orangePlayer==false))
  {
    fill(255,255,255);
    stroke(gridColor);
    rect(width/2-100,height/2-40,width/2+100,height/2+40);
    textFont(introFont, 24);
    fill(0,0,255);
    text("Blue Wins!",width/2-72,height/2+10);
    stop();
  } 
  if ((greenPlayer == false)&&(bluePlayer==false)&&(redPlayer==false))
  {
    fill(255,255,255);
    stroke(gridColor);
    rect(width/2-100,height/2-40,width/2+100,height/2+40);
    textFont(introFont, 24);
    fill(250,150,0);
    text("Orange Wins!",width/2-88,height/2+10);
    stop();
  }
}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////Starting Screen
void startingScreen()
{
  fill(255,255,255,25);
  rectMode(CORNERS);
  stroke(gridColor);
  rect(width/2-150,height/2-150,width/2+150,height/2+150);
  rect(width/2-50,height/2+90,width/2+50,height/2+120);
  if ((mousePressed == true)&&(mouseX >= width/2-50) && (mouseX <= width/2+50) && (mouseY >= height/2+90) && (mouseY <= height/2+120))
  {
    stroke(50,50,50);
    line(width/2-52,height/2+122,width/2-52,height/2+88);
    line(width/2-52,height/2+88,width/2+52,height/2+88);
    stroke(200,200,200);
    line(width/2+52,height/2+122,width/2+52,height/2+88);
    line(width/2-52,height/2+122,width/2+52,height/2+122);
  }
  else
  {
    stroke(200,200,200);
    line(width/2-52,height/2+122,width/2-52,height/2+88);
    line(width/2-52,height/2+88,width/2+52,height/2+88);
    stroke(50,50,50);
    line(width/2+52,height/2+122,width/2+52,height/2+88);
    line(width/2-52,height/2+122,width/2+52,height/2+122);
  }
  stroke(gridColor);
  rect(width/2-100,height/2-100,width/2-75,height/2-75);//red player
  if (redPlayer == true)
  {
    line(width/2-100,height/2-100,width/2-75,height/2-75);
    line(width/2-75,height/2-100,width/2-100,height/2-75);
  }
  rect(width/2-100,height/2-50,width/2-75,height/2-25);//green player
  if (greenPlayer == true)
  {
    line(width/2-100,height/2-50,width/2-75,height/2-25);
    line(width/2-75,height/2-50,width/2-100,height/2-25);
  }
  rect(width/2-100,height/2-0,width/2-75,height/2+25);//blue player
  if (bluePlayer == true)
  {
    line(width/2-100,height/2-0,width/2-75,height/2+25);
    line(width/2-75,height/2-0,width/2-100,height/2+25);
  }
  rect(width/2-100,height/2+50,width/2-75,height/2+75);//orange player
  if (orangePlayer == true)
  {
    line(width/2-100,height/2+50,width/2-75,height/2+75);
    line(width/2-75,height/2+50,width/2-100,height/2+75);
  }
  fill(0,150,100);
  textFont(introFont,24);
  text("Who's Playing?", width/2-103, height/2-120);
  text("START",width/2-38,height/2+113);
  textFont(introFont, 14);
  fill(255,0,0);
  text("Red Player (Arrow Keys)", width/2-65, height/2-84);
  fill(0,255,0);
  text("Green Player (WASD)", width/2-65, height/2-34);
  fill(0,0,255);
  text("Blue Player (IJKL)", width/2-65, height/2+17);
  fill(250,150,0);
  text("Orange Player (8456)", width/2-65, height/2+67);
  fill(0,150,100); 
  text("TRON by Matt Johnson  (c) 2010",width/2-132, height/2+140);
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////keyCode numbers
//37 Left
//38 Up
//39 Right
//40 Down

//100 Left
//104 Up
//102 Right
//101 Down

















