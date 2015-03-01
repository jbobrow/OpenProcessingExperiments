
//Paint

//Buttons
boolean pointButton=false;
boolean lineButton=false;
boolean circleButton=false;
boolean rectButton=false;
boolean eraserButton=false;

//Colors
color current=color(#FFFFFF);//white

//Img
PImage img;

void setup()
{
  size(900, 600);
  background (255);

  //define palette
  stroke(220);
  fill(255);
  rect(140, 100, 575, 390);
  
}

void draw()
{
  smooth();
  if (keyPressed)
  {
    if (key == 'c' || key == 'C')
    {
      background (255);
      fill(255);
      rect(140, 100, 575, 390);
    }
  }
  draw_buttons();
  draw_colors();
  draw_paint();
}

void draw_buttons()
{
  draw_buttons_point();
  draw_buttons_line();
  draw_buttons_circle();
  draw_buttons_rect();
  draw_buttons_eraser();
}

void draw_buttons_point()
{
  //point button
  if (pointButton) fill(0);
  else fill(50);

  rect(140, 520, 90, 60);
  fill(255);
  ellipse(185, 550, 10, 10);
}

void draw_buttons_line()
{
  //line button
  if (lineButton) fill(0);
  else fill(50);

  rect(260, 520, 90, 60);
  stroke(255, 255, 255);
  strokeWeight(10);
  line(290, 565, 320, 535);
  //reset
  stroke(255);
  strokeWeight(0);
}

void draw_buttons_circle()
{
  //circle button
  if (circleButton) fill(0);
  else fill(50);

  rect(380, 520, 90, 60);
  fill(255);
  ellipse(425, 550, 30, 30);
}

void draw_buttons_rect()
{
  //rect button
  if (rectButton) fill(0);
  else fill(50);

  rect(500, 520, 90, 60);
  fill(255);
  rect(530, 540, 30, 20);
}

void draw_buttons_eraser()
{
  //eraser button
  if (eraserButton) fill(0);
  else fill(50);

  rect(625, 520, 90, 60);
  fill(255);
  rect(650, 540, 7, 20);
  rect(660, 540, 30, 20);
}

void draw_colors()
{
  stroke(0);
  fill(#FFFFFF);//white
  rect(730, 100, 40, 20);

  fill(#C0C0C0);//silver
  rect(730, 120, 40, 20);

  fill(#808080);//gray
  rect(730, 140, 40, 20);

  fill(#000000);//black
  rect(730, 160, 40, 20);

  fill(#FF0000);//red
  rect(730, 180, 40, 20);

  fill(#800000);//maroon
  rect(730, 200, 40, 20);

  fill(#FFFF00);//yellow
  rect(730, 220, 40, 20);

  fill(#808000);//olive
  rect(730, 240, 40, 20);

  fill(#00FF00);//lime
  rect(730, 260, 40, 20);

  fill(#008000);//green
  rect(730, 280, 40, 20);

  fill(#00FFFF);//aqua
  rect(730, 300, 40, 20);

  fill(#008080);//teal
  rect(730, 320, 40, 20);

  fill(#0000FF);//blue
  rect(730, 340, 40, 20);

  fill(#000080);//navy
  rect(730, 360, 40, 20);

  fill(#FF00FF);//fushia
  rect(730, 380, 40, 20);

  fill(#800080);//purple
  rect(730, 400, 40, 20);

  fill(current);//current
  rect(730, 450, 40, 40);
}

void draw_paint()
{
  if (mouseX > 140 && mouseX < 715 && mouseY > 100 && mouseY < 490 && mousePressed)
  {
    noStroke();
    if (lineButton)
    {
      ellipse(mouseX, mouseY, 10, 10);
    }

    if (eraserButton)
    {
      fill(color(#FFFFFF));
      ellipse(mouseX, mouseY, 10, 10);
    }
  }
}

void mousePressed()
{
  //point button
  if (mouseX > 140 && mouseX < 230 && mouseY > 520 && mouseY < 580)
  {
    pointButton=true;
    lineButton=false;
    circleButton=false;
    rectButton=false;
    eraserButton=false;
  }

  //line button
  if (mouseX > 260 && mouseX < 350 && mouseY > 520 && mouseY < 580)
  {
    pointButton=false;
    lineButton=true;
    circleButton=false;
    rectButton=false;
    eraserButton=false;
  }

  //circle button
  if (mouseX > 380 && mouseX < 470 && mouseY > 520 && mouseY < 580)
  {
    pointButton=false;
    lineButton=false;
    circleButton=true;
    rectButton=false;
    eraserButton=false;
  }

  //rect button
  if (mouseX > 500 && mouseX < 590 && mouseY > 520 && mouseY < 580)
  {
    pointButton=false;
    lineButton=false;
    circleButton=false;
    rectButton=true;
    eraserButton=false;
  }

  //rect button
  if (mouseX > 625 && mouseX < 715 && mouseY > 520 && mouseY < 580)
  {
    pointButton=false;
    lineButton=false;
    circleButton=false;
    rectButton=false;
    eraserButton=true;
  }

  //-----------------------------COLORS--------------------------------

  //white
  if (mouseX > 730 && mouseX < 770 && mouseY > 100 && mouseY < 120)
  {
    current=color(#FFFFFF);
  }

  //silver
  if (mouseX > 730 && mouseX < 770 && mouseY > 120 && mouseY < 140)
  {
    current=color(#C0C0C0);
  } 

  //gray
  if (mouseX > 730 && mouseX < 770 && mouseY > 140 && mouseY < 160)
  {
    current=color(#808080);
  }   

  //black
  if (mouseX > 730 && mouseX < 770 && mouseY > 160 && mouseY < 180)
  {
    current=color(#000000);
  }   

  //red
  if (mouseX > 730 && mouseX < 770 && mouseY > 180 && mouseY < 200)
  {
    current=color(#FF0000);
  }   

  //maroon
  if (mouseX > 730 && mouseX < 770 && mouseY > 200 && mouseY < 220)
  {
    current=color(#800000);
  }   

  //yellow
  if (mouseX > 730 && mouseX < 770 && mouseY > 220 && mouseY < 240)
  {
    current=color(#FFFF00);
  }   

  //olive
  if (mouseX > 730 && mouseX < 770 && mouseY > 240 && mouseY < 260)
  {
    current=color(#808000);
  }   

  //lime
  if (mouseX > 730 && mouseX < 770 && mouseY > 260 && mouseY < 280)
  {
    current=color(#00FF00);
  }

  //green
  if (mouseX > 730 && mouseX < 770 && mouseY > 280 && mouseY < 300)
  {
    current=color(#008000);
  }

  //aqua
  if (mouseX > 730 && mouseX < 770 && mouseY > 300 && mouseY < 320)
  {
    current=color(#00FFFF);
  }

  //teal
  if (mouseX > 730 && mouseX < 770 && mouseY > 320 && mouseY < 340)
  {
    current=color(#008080);
  }  

  //blue
  if (mouseX > 730 && mouseX < 770 && mouseY > 340 && mouseY < 360)
  {
    current=color(#0000FF);
  }  

  //navy
  if (mouseX > 730 && mouseX < 770 && mouseY > 360 && mouseY < 380)
  {
    current=color(#000080);
  }  

  //fushia
  if (mouseX > 730 && mouseX < 770 && mouseY > 380 && mouseY < 400)
  {
    current=color(#FF00FF);
  }  

  //purple
  if (mouseX > 730 && mouseX < 770 && mouseY > 400 && mouseY < 420)
  {
    current=color(#800080);
  }  

  //-----------------------------DRAW----------------------------

  //define palet
  if (mouseX > 140 && mouseX < 715 && mouseY > 100 && mouseY < 490)
  {
    noStroke();
    if (pointButton)
    {
      ellipse(mouseX, mouseY, 10, 10);
    }

    if (circleButton)
    {
      ellipse(mouseX, mouseY, 50, 50);
    }

    if (rectButton)
    {
      rectMode(CENTER);
      rect(mouseX, mouseY, 50, 50);
      rectMode(CORNER);
    }
  }
}


