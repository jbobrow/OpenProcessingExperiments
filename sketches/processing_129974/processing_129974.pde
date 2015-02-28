
PFont font1, font2, font3, font4, font5, scoreF;

int diam = 50;
float arc1 = 0.52, arc2 = 5.76;
int x1 = 650, y1 = 200;
int x21 = 150, x22 = 125, x23 = 175;
int y11 = 150;
int y21 = 200;
int Spac = 10, Sg = 10;
int count1 = 0, count2 = 0;
int scorep = 9, scoreg = 9;

int sx = (int) random(60, 740);
int sy = (int) random(100, 500);

int ballfill = 255;

boolean chase = false, finishC = false, opening = true;
boolean chaseinst = false, raceinst = false, race = false;
boolean finishr = false, co = false;
void setup()
{
  font1 = loadFont("Microsoft-Yi-Baiti-48.vlw");
  font2 = loadFont("MyriadHebrew-BoldIt-48.vlw");
  font3 = loadFont("MinionPro-BoldCnIt-48.vlw");
  font4 = loadFont("NewsGothicMT-48.vlw");
  font5 = loadFont("Webdings-48.vlw");
  scoreF = loadFont("EurostileRegular-48.vlw");

  size(800, 600);
  smooth();
  noStroke();
  ellipseMode(CENTER);
}

void draw()
{
  if (sx % 10 != 0)
  {
    sx = (int) random(60, 740);
    ballfill = 0;
  }
  
  if(sy % 10 != 0)
  {
    sy = (int) random(60, 540);
    ballfill = 0;
  }
  
  else ballfill = 255;

  if(opening)
    opening();

  if(chase)
    chase();
  
  if(chaseinst)
    chaseinst();

  if(raceinst)
    raceinst();
  
  if(race)
    race();
    
  raceFinish();
}

void keyPressed()
{
  if (keyPressed)
  {
    if (key == 'd')
    {
      x21 = x21 + Sg;
      x22 = x22 + Sg;
      x23 = x23 + Sg;
      count1++;
      count2++;
    }

    if (key == 'a')
    {
      x21 = x21 - Sg;
      x22 = x22 - Sg;
      x23 = x23 - Sg;
      count1++;
      count2++;
    }

    if (key == 'w')
    {
      y21 = y21 - Sg;
      count1++;
      count2++;
    }

    if (key == 's')
    {
      y21 = y21 + Sg;
      count1++;
      count2++;
    }

    if (key == CODED)
    {
      if (keyCode == RIGHT)
      {
        x1 = x1 + Spac;
        arc1 = 0.52;
        arc2 = 5.76;
      }

      if (keyCode == DOWN)
      {

        y1 = y1 + Spac;
        arc1 = -4.0;
        arc2 = 1;
      }

      if (keyCode == UP)
      {
        y1 = y1 - Spac;
        arc1 = -.8;
        arc2 = 4.2;
      }

      if (keyCode == LEFT)
      {
        x1 = x1 - Spac;
        arc1 = -2.7;
        arc2 = 2.5;
      }
    }
  }
}

void mousePressed()
{
  if (finishC == true)
  {
    if (mouseX > 585 && mouseX < 745)
    {
      if (mouseY > 400 && mouseY < 480)
      {
        if (chase == false)
        {
          count2 = 0;
          chase = true;
          finishC = false;
          x1 = 650;
          y1 = 200;
          x21 = 150;
          x22 = 125;
          x23 = 175;
          y21 = 200;
        }
      }
    }

    if (mouseX > 60 && mouseX < 220)
    {
      if (mouseY > 400 && mouseY < 480)
      {

        finishC = false;
        opening = true;
        count2 = 0;
        x1 = 650;
        y1 = 200;
        x21 = 150;
        x22 = 125;
        x23 = 175;
        y21 = 200;
      }
    }
  }
  if (opening)
  {
    if (chase == false)
    {
      if (chaseinst == false)
      {
        if (mouseX > 310 && mouseX < 490)
        {
          if (mouseY > 245 && mouseY < 325)
          {
            opening = false;
            background(0);
            chaseinst = true;
            x1 = 650;
            y1 = 200;
            x21 = 150; 
            x22 = 125;
            x23 = 175;
            y11 = 150;
            y21 = 200;
          }
        }
        if (mouseX < 490 && mouseX > 310)
        {
          if (mouseY < 480 && mouseY > 400)
          {
            opening = false;
            background(0);
            raceinst = true;
            x1 = 650;
            y1 = 200;
            x21 = 150; 
            x22 = 125;
            x23 = 175;
            y11 = 150;
            y21 = 200;
          }
        }
      }
    }
  }

  if (race)
  {
    if (mouseX > 645 && mouseX < 775)
    {
      if (mouseY > 520 && mouseY < 580)
      {
        scoreg = 0;
        scorep = 0;
        race = true;
        finishr = false;
        x1 = 650;
        y1 = 200;
        x21 = 150;
        x22 = 125;
        x23 = 175;
        y21 = 200;
        sx = (int) random(60, 740);
        sy = (int) random(100, 500);
      }
    }

    if (mouseX > 25 && mouseX < 155)
    {
      if (mouseY > 520 && mouseY < 580)
      {
        race = false;
        opening = true;
        count2 = 0;
        x1 = 650;
        y1 = 200;
        x21 = 150;
        x22 = 125;
        x23 = 175;
        y21 = 200;
      }
    }
  }

  if (chase)
  {
    if (mouseX > 645 && mouseX < 775)
    {
      if (mouseY > 520 && mouseY < 580)
      {
        count2 = 0;
        chase = true;
        finishC = false;
        x1 = 650;
        y1 = 200;
        x21 = 150;
        x22 = 125;
        x23 = 175;
        y21 = 200;
      }
    }

    if (mouseX > 25 && mouseX < 155)
    {
      if (mouseY > 520 && mouseY < 580)
      {
        chase = false;
        opening = true;
        count2 = 0;
        x1 = 650;
        y1 = 200;
        x21 = 150;
        x22 = 125;
        x23 = 175;
        y21 = 200;
      }
    }
  }

  if(chaseinst)
  {
    if (mouseX > 250 && mouseX < 540)
    {
      if (mouseY > 480 && mouseY < 580)
      {
        chaseinst = false;
        chase = true;
        count2 = 0;
        x1 = 650;
        y1 = 200;
        x21 = 150;
        x22 = 125;
        x23 = 175;
        y21 = 200;
      }
    }
  }

  if(raceinst)
  {
    if (mouseX < 545 && mouseX > 255)
    {
      if (mouseY > 480 && mouseY < 580)
      {
        raceinst = false;
        race = true;
      }
    }
  }
  if (finishr == true)
  {
    if (mouseX > 585 && mouseX < 745)
    {
      if (mouseY > 400 && mouseY < 480)
      {
        if (race == false)
        {
          count2 = 0;
          race = true;
          finishr = false;
          x1 = 650;
          y1 = 200;
          x21 = 150;
          x22 = 125;
          x23 = 175;
          y21 = 200;
          scoreg = 0;
          scorep = 0;
        }
      }
    }

    if (mouseX > 60 && mouseX < 220)
    {
      if (mouseY > 400 && mouseY < 480)
      {

        finishr = false;
        opening = true;
        count2 = 0;
        x1 = 650;
        y1 = 200;
        x21 = 150;
        x22 = 125;
        x23 = 175;
        y21 = 200;
        scoreg = 0;
          scorep = 0;
      }
    }
  }
}

void pacdude()
{

  fill(255, 255, 0);
  arc(x1, y1, diam, diam, arc1, arc2);
}

void ghosty()
{
  fill(0, 255, 0);
  ellipse(x21, y21, diam, diam);
  rect(x22, y21, 50, 30);

  beginShape(TRIANGLES);
  vertex(x22, y21 + 30);
  vertex(x22, y21 + 50);
  vertex(x22 + 13, y21 + 30);
  vertex(x22 + 13, y21 + 30);
  vertex(x21, y21 + 50);
  vertex(x21 + 12, y21 + 30);
  vertex(x21 + 12, y21 + 30);
  vertex(x23, y21 + 50);
  vertex(x23, y21 + 30);
  endShape();
  fill(0);
  ellipse(x21 - 13, y21 - 10, 15, 15);
  ellipse(x21 + 13, y21 - 10, 15, 15);

  if (count1 >= 0 && count1 <= 10)
    ellipse(x21, y21, 8, 20);
  else if (count1 > 10  && count1 <= 20)
    ellipse(x21, y21, 20, 8);
  else
    count1 = 0;
}

void bounce()
{
  if (x1 + diam/2 >= width)
    x1 = width - diam/2;
  if (x1 - diam/2 <= 0)
    x1 = diam/2;
  if (y1 + diam/2 >= height)
    y1 = height - diam/2;
  if (y1 - diam/2 <= 0)
    y1 = diam/2;
  if (x21 - 25 <= 0)
  {
    x21 = x21 + 5;
    x22 = x22 +5;
    x23 = x23 +5;
  }
  if (x23 >= width)
  {
    x21 = x21 - 5;
    x22 = x22 - 5;
    x23 = x23 - 5;
  }
  if (y21 - diam/2 <= 0)
    y21 = 25;
  if (y21 + diam >= height)
    y21 = height - diam;
}

void chase()
{
  background(0);
  counter();
  gamebuttons();
  pacdude();
  ghosty();
  bounce();
  chaseFinish();
}

void chaseFinish()
{
  if (x1 == x21 && y1 == y21)
  {
    opening = false;
    finishC = true;
    chase = false;
    background(50);

    fill(0, 255, 0);
    ellipse(x21, y21, diam, diam);
    rect(x22, y21, 50, 30);
    beginShape(TRIANGLES);
    vertex(x22, y21 + 30);
    vertex(x22, y21 + 50);
    vertex(x22 + 13, y21 + 30);
    vertex(x22 + 13, y21 + 30);
    vertex(x21, y21 + 50);
    vertex(x21 + 12, y21 + 30);
    vertex(x21 + 12, y21 + 30);
    vertex(x23, y21 + 50);
    vertex(x23, y21 + 30);
    endShape();
    fill(0);
    ellipse(x21 - 13, y21 - 10, 15, 15);
    ellipse(x21 + 13, y21 - 10, 15, 15);
    ellipse(x21, y21, 8, 20);
    ellipse(x21, y21, 20, 8);
    fill(255);
    textFont(font1, 200);
    text("BAM!", 200, 175);
    textFont(font1, 100);
    text("You Caught Him", 110, 300);
    text("In", 370, 380);
    text(count2, 320, 460);
    text("Steps!", 300, 540);
    rect(60, 400, 160, 80);
    rect(585, 400, 160, 80);
    fill(255, 0, 0);
    textFont(font2, 60);
    text("Reset", 592, 460);
    text("Menu", 66, 460);
  }
}

void opening()
{
  background(0);
  fill(255);
  textFont(font3, 80);
  text("Ghosty VS PacDude", 50, 100);

  ghosty();
  pacdude();
  bounce();

  fill(255);
  rect(310, 245, 180, 80);
  rect(310, 400, 180, 80);

  fill(255, 255, 0);
  textFont(font4, 40);
  text("Controls:", 580, 300);
  fill(0, 255, 0);
  text("Controls:", 50, 300);
  fill(255, 255, 0);
  textFont(font4, 25);
  text("UP = Up Arrow", 570, 350);
  text("DOWN = Down Arrow", 530, 390);
  text("LEFT = Left Arrow", 555, 430);
  text("RIGHT = Right Arrow", 530, 470);
  fill(0, 255, 0);
  text("UP = 'w'", 80, 350);
  text("DOWN = 's'", 60, 390);
  text("LEFT = 'a'", 67, 430);
  text("RIGHT = 'd'", 60, 470);
  fill(255);
  textFont(font5, 40);
  text("OR", 370, 375);
  fill(255, 0, 0);
  textFont(font5, 50);
  text("CHASE", 320, 300);
  text("RACE", 330, 455);
}

void counter()
{
  fill(255);
  textFont(font5, 80);
  text(count2 + " Steps", 240, 100);
}

void gamebuttons()
{
  rect(25, 520, 130, 60);
  rect(645, 520, 130, 60);
  fill(255, 0, 0);
  textFont(font2, 40);
  text("Reset", 660, 560);
  text("Menu", 40, 560);
}

void chaseinst()
{
  background(0);;
  ghosty();
  pacdude();
  bounce();
  fill(255);
  textFont(font2, 100);
  text("CHASE", 250, 100);

  textFont(font2, 30);
  text("The aim of this game is simple.", 200, 230);
  text("The players controlling 'Ghosty' has", 150, 280);
  text("to chase 'PacDude' and move over him.", 130, 330);
  text("The game will count the steps so you can", 125, 380);
  text("compare scores, Enjoy!", 245, 430);

  rect(250, 480, 290, 100);
  fill(255, 0, 0);
  textFont(font2, 85);
  text("START!", 260, 555);
}

void raceinst()
{
  background(0);

  ghosty();
  pacdude();
  bounce();

  fill(255);
  textFont(font2, 100);
  text("RACE", 270, 100);
  textFont(font2, 30);
  text("The aim of this game is to.", 230, 210);
  text("collect 10 white circles before", 200, 260);
  text(" your opponent. The circles appear randomly", 100, 310);
  text("and only one will be in play at a time.", 150, 360);
  text("Have Fun!", 330, 410);

  rect(255, 480, 290, 100);
  fill(255, 0, 0);
  textFont(font2, 85);
  text("START!", 265, 555);
  scoreg = 0;
  scorep = 0;
}

void race()
{
  background(0);
  scores();
  gamebuttons();
  ball();
  ghosty();
  pacdude();
  bounce();
  
}

void scores()
{
  fill(255);
  textFont(scoreF, 100);
  text(scoreg, 120, 120);
  text(scorep, 620, 120);
}

void ball()
{
  fill(ballfill);
  ellipse(sx, sy, 40, 40);

  if (x21 == sx && y21 == sy)
  {
    sx = (int) random(60, 740);
    sy = (int) random(100, 500);
    scoreg = scoreg + 1;
    ballfill = 0;
  }

  if (x1 == sx && y1 == sy)
  {
    sx = (int) random(60, 740);
    sy = (int) random(100, 500);
    scorep = scorep + 1;
    ballfill = 0;
  }
}

void raceFinish()
{
  if(scoreg == 10 || scorep == 10)
    {
      finishr = true;
      race = false;
      background(0);
      
      if(scorep == 10)
      {
        pacdude();
        x1 = 400;
        y1 = 300;
        fill(255);
        textFont(font2, 100);
        text("PacDude Wins!", 50, 100);
        text("By " + (scorep - scoreg) + " Points!", 100, 200);
        rect(60, 400, 160, 80);
        rect(585, 400, 160, 80);
        fill(255, 0, 0);
        textFont(font2, 60);
        text("Reset", 592, 460);
        text("Menu", 66, 460);
      }
      
      if(scoreg == 10)
      {
        ghosty();
        x21 = 400;
        x22 = 375;
        x23 = 425;
        y21 = 300;
        fill(255);
        textFont(font2, 100);
        text("Ghosty Wins!", 125, 100);
        text("By " + (scoreg - scorep) + " Points!", 150, 200);
        rect(60, 400, 160, 80);
        rect(585, 400, 160, 80);
        fill(255, 0, 0);
        textFont(font2, 60);
        text("Reset", 592, 460);
        text("Menu", 66, 460);
          
     }
  }
}
