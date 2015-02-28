
float f1, f2, f3, f4, f5, f6, f7;
float p1, p2, p3, p4, p5, p6, p7;
float s;
float px = 250;
float gamemode = 0;

void setup()
{
  size(500, 500); 
}

void draw()
{
  background(0);
  fill(255, 0, 0);
  
  pushMatrix();
  if(f1 >= 500 - s/2)
  {
    f1 = 0;
  }
  p1 = 40;
  f1 += 3;
  s = 30;
  ellipse(p1, f1, s, s);
  popMatrix();
  
  pushMatrix();
    if(f2 >= 500 - s/2)
  {
    f2 = 0;
  }
  p2 = 80;
  f2 += 4;
  s = 30;
  ellipse(p2, f2, s, s);
  popMatrix();
  
  pushMatrix();
    if(f3 >= 500 - s/2)
  {
    f3 = 0;
  }
  p3 = 160;
  f3 += 3.2;
  s = 30;
  ellipse(p3, f3, s, s);
  popMatrix();
  
  pushMatrix();
    if(f4 >= 500 - s/2)
  {
    f4 = 0;
  }
  p4 = 220;
  f4 += 2.8;
  s = 30;
  ellipse(p4, f4, s, s);
  popMatrix();
  
  pushMatrix();
    if(f5 >= 500 - s/2)
  {
    f5 = 0;
  }
  p5 = 300;
  f5 += 4.2;
  s = 30;
  ellipse(p5, f5, s, s);
  popMatrix();
  
  pushMatrix();
    if(f6 >= 500 - s/2)
  {
    f6 = 0;
  }
  p6 = 380;
  f6 += 3.6;
  s = 30;
  ellipse(p6, f6, s, s);
  popMatrix();
  
  pushMatrix();
    if(f7 >= 500 - s/2)
  {
    f7 = 0;
  }
  p7 = 460;
  f7 += 3.8;
  s = 30;
  ellipse(p7, f7, s, s);
  popMatrix();
  
  //--------------------------------------------
  fill(255, 255, 0);
  ellipse(px, 480, 50, 25);
  
  if(p7 >= px - 25 && p7 <= px + 25)
  {
    if(f7 >= 480)
    {
      gamemode = gamemode + 1;
    }
  }
  
    if(p6 >= px - 25 && p6 <= px + 25)
  {
    if(f6 >= 480)
    {
      gamemode = gamemode + 1;
    }
  }
  
    if(p5 >= px - 25 && p5 <= px + 25)
  {
    if(f5 >= 480)
    {
      gamemode = gamemode + 1;
    }
  }
  
    if(p4 >= px - 25 && p4 <= px + 25)
  {
    if(f4 >= 480)
    {
      gamemode = gamemode + 1;
    }
  }
  
    if(p3 >= px - 25 && p3 <= px + 25)
  {
    if(f3 >= 480)
    {
      gamemode = gamemode + 1;
    }
  }
  
    if(p2 >= px - 25 && p2 <= px + 25)
  {
    if(f2 >= 480)
    {
      gamemode = gamemode + 1;
    }
  }
  
    if(p1 >= px - 25 && p1 <= px + 25)
  {
    if(f1 >= 480)
    {
      gamemode = gamemode + 1;
    }
  }
  
  if (gamemode >= 1)
  {
    text("GameOver", width/2, height/2);
  }
  
  
  if(keyPressed == true)
  {
    if (keyCode == LEFT)
    {
      px -= 1.5;
    }
    
    if (keyCode == RIGHT)
    {
      px += 1.5;
    }
  }
}




