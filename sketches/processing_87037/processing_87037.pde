
boolean mode = false;
int i = 0;
float startx = 450;
float starty = 190;
float endx = startx + random(-30, 30);
float endy = starty + random(5, 10);
float sky = 0;
float sun = -100;
float grass = 650;
float tree = 600;
float flower1 = 600;
float flower2 = 600;
float flower3 = 600;
float flower4 = 600;

void setup()
{
  size(900, 650);
  noStroke();
}
void draw()
{
  if (mode == true)
  {
    happy();
  }
  else
  {
    if (i == 0)
    {
      background(0);
      fill(130);
      ellipse(450, 0, 900, 200);
      ellipse(60, 0, 200, 200);
      ellipse(115, 60, 100, 100);
      ellipse(170, 80, 150, 150);
      ellipse(270, 105, 170, 170);
      ellipse(350, 130, 100, 100);
      ellipse(400, 150, 120, 120);
      ellipse(470, 130, 130, 130);
      ellipse(570, 115, 140, 140);
      ellipse(640, 120, 100, 100);
      ellipse(730, 90, 130, 130);
      ellipse(810, 60, 110, 110);
      ellipse(860, 20, 100, 100);
      fill(59, 144, 3);
      rect(0, 620, 900, 30);
      triangle(0, 570, 250, 570, 125, 375);
      triangle(25, 450, 225, 450, 125, 300);
      triangle(50, 345, 200, 345, 125, 240);
      fill(155, 91, 8);
      rect(100, 570, 50, 50);
      i = i + 1;
    }
    if (mousePressed == true && mouseButton == LEFT)
    {
      float r = random(0, 255);
      float g = random(0, 255);
      float b = random(0, 255);
      stroke(r, g, b);
      strokeWeight(10);
      line(startx, starty, endx, endy);
      startx = endx;
      starty = endy;
      endx = startx + random(-30, 30);
      endy = starty + random(5, 10);
      noStroke();
    }
    if (endy >= 650)
    {      
      fill(0);
      rect(0, 0, 900, 620);
      fill(130);
      ellipse(450, 0, 900, 200);
      ellipse(60, 0, 200, 200);
      ellipse(115, 60, 100, 100);
      ellipse(170, 80, 150, 150);
      ellipse(270, 105, 170, 170);
      ellipse(350, 130, 100, 100);
      ellipse(400, 150, 120, 120);
      ellipse(470, 130, 130, 130);
      ellipse(570, 115, 140, 140);
      ellipse(640, 120, 100, 100);
      ellipse(730, 90, 130, 130);
      ellipse(810, 60, 110, 110);
      ellipse(860, 20, 100, 100);
      fill(59, 144, 3);
      triangle(0, 570, 250, 570, 125, 375);
      triangle(25, 450, 225, 450, 125, 300);
      triangle(50, 345, 200, 345, 125, 240);
      fill(155, 91, 8);
      rect(100, 570, 50, 50);
      startx = 450;
      starty = 190;
      endx = startx + random(-30, 30);
      endy = starty + random(5, 10);
    }
  }
}

void happy()
{
  if (sky <= 25)
  {  
    fill(0, 159, 255, 3);
    rect(0, 0, 900, 650);
    sky = sky + 0.3;
  }
  if (sky >= 25)
  {
    if (sun < 0)
    {
      fill(255, 207, 10);
      ellipse(900, sun, 400, 400);
      sun = sun + 2;
    }
    if (sun == 0)
    {
      noFill();
      stroke(255, 207, 10);
      strokeWeight(7);
      beginShape();
      curveVertex(660, 45);
      curveVertex(660, 45);
      curveVertex(640, 40);
      curveVertex(620, 60);
      curveVertex(600, 55);
      curveVertex(600, 55);
      endShape();

      beginShape();
      curveVertex(685, 108);
      curveVertex(685, 108);
      curveVertex(665, 110);
      curveVertex(654, 132);
      curveVertex(632, 133);
      curveVertex(632, 133);
      endShape();

      beginShape();
      curveVertex(730, 170);
      curveVertex(730, 170);
      curveVertex(710, 174);
      curveVertex(703, 197);
      curveVertex(684, 202);
      curveVertex(684, 202);
      endShape();

      beginShape();
      curveVertex(790, 213);
      curveVertex(790, 213);
      curveVertex(773, 223);
      curveVertex(775, 246);
      curveVertex(758, 255);
      curveVertex(758, 255);
      endShape();

      beginShape();
      curveVertex(853, 233);
      curveVertex(853, 233);
      curveVertex(839, 249);
      curveVertex(849, 269);
      curveVertex(838, 281);
      curveVertex(838, 281);
      endShape();

      noStroke();
    }
    if (tree >= 151)
    {
      noStroke();
      fill(160, 102, 10);
      rect(120, tree, 70, 450);
      tree = tree - 4;
    }
    if (grass >= 600)
    {
      fill(0, 180, 49);
      rect(0, grass, 900, 50);
      grass = grass - 2;
    }
    if (grass == 598)
    {
      fill(0, 180, 49);
      rect(0, 600, 900, 50);
    }
  }
  if (tree <= 150)
  {
    fill(0, 180, 49); //light green

    fill(0, 160, 25); //green
    ellipse(160, 300, 100, 100);
    fill(0, 131, 20); //dark green
    ellipse(250, 215, 200, 200);
    fill(0, 160, 25); //green
    ellipse(300, 140, 100, 100);
    fill(0, 131, 20); //dark green
    ellipse(280, 80, 100, 100);
    fill(0, 160, 25); //green
    ellipse(220, 60, 150, 150);
    fill(0, 131, 20); //dark green
    ellipse(160, 40, 120, 120);
    fill(0, 160, 25); //green
    ellipse(80, 55, 140, 140);
    fill(0, 131, 20); //dark green
    ellipse(40, 150, 180, 180);
    fill(0, 160, 25); //green
    ellipse(70, 240, 120, 120);
    fill(0, 131, 20); //dark green
    ellipse(110, 280, 70, 70);

    fill(27, 167, 49); //lighter green
    ellipse(160, 221, 120, 120);
    fill(4, 118, 5);
    ellipse(200, 160, 150, 150);
    fill(27, 167, 49);
    ellipse(140, 130, 100, 100);
    fill(4, 118, 5);
    ellipse(110, 180, 120, 120);

    fill(0, 131, 20); //dark green
    ellipse(160, 185, 110, 110);

    if (flower1 >= 520)
    {
      fill(0, 180, 49);
      rect(300, flower1, 10, 80);
      flower1 = flower1 - 2;
    }
    if (flower1 == 518)
    {
      fill(207, 5, 234); //purple
      ellipse(305, 500, 40, 35);
      ellipse(305, 540, 40, 35);
      ellipse(305-20, 520, 35, 40);
      ellipse(325, 520, 35, 40);
      fill(255, 217, 0); //center
      ellipse(305, 520, 30, 30);

      if (flower2 >= 520)
      {
        fill(0, 180, 49);
        rect(450, flower2, 10, 80);
        flower2 = flower2 - 2;
      }
      if (flower2 == 518)
      {
        fill(255, 149, 10);
        ellipse(455, 500, 40, 35);
        ellipse(455, 540, 40, 35);
        ellipse(455-20, 520, 35, 40);
        ellipse(475, 520, 35, 40);
        fill(255, 217, 0); //center
        ellipse(455, 520, 30, 30);

        if (flower3 >= 520)
        {
          fill(0, 180, 49);
          rect(600, flower3, 10, 80);
          flower3 = flower3 - 2;
        }
        if (flower3 == 518)
        {
          fill(207, 5, 234); //purple
          ellipse(455+150, 500, 40, 35);
          ellipse(455+150, 540, 40, 35);
          ellipse(455-20+150, 520, 35, 40);
          ellipse(475+150, 520, 35, 40);
          fill(255, 217, 0); //center
          ellipse(455+150, 520, 30, 30);

          if (flower4 >= 520)
          {
            fill(0, 180, 49);
            rect(750, flower4, 10, 80);
            flower4 = flower4 - 2;
          }
          if (flower4 == 518)
          {
            fill(255, 149, 10);
            ellipse(755, 500, 40, 35);
            ellipse(755, 540, 40, 35);
            ellipse(755-20, 520, 35, 40);
            ellipse(775, 520, 35, 40);
            fill(255, 217, 0); //center
            ellipse(755, 520, 30, 30);
            
            fill(7,27,147);
            textSize(50);
            text("Happy (belated) birthday! You're old! c(:", 375, 200, 400, 400);
          }
        }
      }
    }
  }
}

void mouseClicked()
{
  if (mouseButton == RIGHT)
  {
    background(255);
    i = 0;
    startx = 450;
    starty = 190;
    endx = startx + random(-30, 30);
    endy = starty + random(5, 10);
    sky = 0;
    sun = -100;
    grass = 650;
    tree = 600;
    flower1 = 600;
    flower2 = 600;
    flower3 = 600;
    flower4 = 600;
    mode = !mode;
  }
}


