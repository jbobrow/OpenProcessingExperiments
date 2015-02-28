
//HW6 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 09/15/2011 - CMU

boolean on, letterZ, letterH, letterE;
float wd;
int row, col, mouseRow, mouseCol;
void setup()
{
  size(400, 400);
  background(0);
  smooth();
  on = false;
  wd = 0;
}

void draw()
{
  
  
  //println(mouseRow);
  //println(mouseX);
  background(0);
  if(wd < 30 && on)
  {
    on = true;
    wd++;
  }
  if(wd > -30 && on == false)
  {
    wd--;
  }
  else if(wd == -30)
  {
    on = true;
  }
  else if (wd == 30)
  {
    on = false;
  }
  col = 0;
  while(col <= mouseRow)
  {
     row = 0;
     while(row < mouseCol)
     {
       initials(40 * col, 40 * row, wd + row, 30);
       row++;
     } 
     col++;
  }
  
  /*if(letterZ)
  {
    row = 0;
    while(row < 10)
    {
      initials(40 * row, 0, wd, 30);
      initials(400 - (40 * row), 40 * row, wd, 30);
      initials(40 * row, 360, wd, 30);
      row++;
    }
  }
  
  if(letterH)
  {
    row = 0;
    while(row < 10)
    {
      initials(80, 40 * row, wd, 30);
      initials(320, 40 * row, wd, 30);
      //initials(80 + (40 * row), 200, wd + row, 30);
      row++;
    }
    col = 0;
    while(col < 6)
    {
      println(col);
      initials(80 + (40 * row), 200, wd, 30);
      col++;
    }
  }*/
  
}

void initials(float x, float y, float w, float h)
{
  smooth();
  stroke(255,177,52);
  //strokeWeight(((w + h)/2) / 50);
  fill(255,0,0);
  beginShape();
  
  //ref point
  curveVertex(x , y + .1 * h);
  curveVertex(x , y + .1 * h); 
  curveVertex(x + .15 * w, y + .12 * h);
  curveVertex(x + .3 * w, y + .1 * h);
  curveVertex(x + .4 * w, y + .12 * h);
  curveVertex(x + .3 * w, y + .25 * h);
  curveVertex(x + (1.0 / 6) * w, y + .6 * h);
  curveVertex(x + .11 * w, y + .9 * h);
  curveVertex(x + .40 * w, y + .9 * h);
  curveVertex(x + .42 * w, y + .95 * h);
  curveVertex(x + .40 * w, y + h);
  curveVertex(x + .05 * w , y + h);
  curveVertex(x - .05 * w , y + .92 * h);
  curveVertex(x + .20 * w , y + .25 * h);
  curveVertex(x + (1.0 / 6) * w , y + .22 * h);
  curveVertex(x  , y + .22 * h);
  curveVertex(x , y + .1 * h);
  curveVertex(x , y + .1 * h); 
  
  
  endShape();
  
  //E
  
  fill(255,100,50);
  beginShape();
  
  curveVertex(x + .65 * w , y + .1 * h);
  curveVertex(x + .65 * w , y + .1 * h);
  curveVertex(x + .8 * w , y + .15 * h);
  curveVertex(x + w, y + .1 * h);
  curveVertex(x + 1.05 * w , y + .4 * h);
  curveVertex(x + .8 * w , y + .3 * h);
  curveVertex(x + .8 * w , y + .5 * h);
  curveVertex(x + .9 * w , y + .5 * h);
  curveVertex(x + .95 * w , y + .45 * h);
  curveVertex(x + .95 * w , y + .65 * h);
  curveVertex(x + .8 * w , y + .6 * h);
  curveVertex(x + .8 * w , y + .8 * h);
  curveVertex(x + .8 * w , y + .9 * h);
  curveVertex(x + w , y + .8 * h);
  curveVertex(x + 1.05 * w , y + .9 * h);
  curveVertex(x + w , y + h);
  curveVertex(x + .7 * w , y + h);
  curveVertex(x + .65 * w , y +  .85 * h);
  curveVertex(x + .65 * w , y + .1 * h);
  curveVertex(x + .65 * w , y + .1 * h);
  
  endShape();
  
  //H
  
  fill(255,255,0);
  beginShape();
  
  curveVertex(x + .3 * w , y);
  curveVertex(x + .4 * w , y);
  curveVertex(x + .4 * w , y + .5 * h);
  curveVertex(x + .6 * w , y + .5 * h);
  curveVertex(x + .6 * w , y);
  curveVertex(x + .7 * w , y);
  curveVertex(x + .7 * w , y + h);
  curveVertex(x + .6 * w , y + h);
  curveVertex(x + .6 * w , y + .7 * h);
  curveVertex(x + .4 * w , y + .7 * h);
  curveVertex(x + .4 * w , y + h);
  curveVertex(x + .3 * w , y + h);
  curveVertex(x + .3 * w , y);
  curveVertex(x + .4 * w , y);
  curveVertex(x + .4 * w , y);
  
  
  endShape();
}

void mousePressed()
{
  if(mouseButton == LEFT)
  {
    mouseRow = (int)(mouseX  * 10/ width);
    mouseCol = (int)(mouseY *10 / height);
  }
}

void keyPressed()
{
  if(key == 'z')
  {
    letterZ = true;
    letterH = false;
    letterE = false;
  }
  if(key == 'h')
  {
    letterZ = false;
    letterH = true;
    letterE = false;
  }
  if(key == 'e')
  {
    letterZ = false;
    letterH = false;
    letterE = true;
  }
}


