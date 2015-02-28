

int[] targetx = new int[3];
int[] targety = new int[3];

int[] steps = new int[3];

boolean[] hit = new boolean[3];

void setup()
{
  size (600,600);

  targetx[0] = 150;
  targetx[1] = 300;
  targetx[2] = 450;

  targety[0] = 300;
  targety[1] = 300;
  targety[2] = 300;

  hit[0] = false;
  hit[1] = false;
  hit[2] = false;
}

void draw()
{
  background (255);
  fill (0,255,0);
  noStroke();
  smooth();
  rectMode (CENTER);
  textAlign (CENTER);
  textFont (createFont ("Verdana",16));

  for (int i = 0; i < targetx.length; i++)  {
    if (!hit[i])  {
      ellipse (targetx[i],targety[i],30,30);
    }
    stroke (0,255,0);
    ex (targetx[i],targety[i],steps[i]);
    noStroke();
    if (hit[i])  {
      steps[i] = steps[i] + 5;
    }
    if (steps[i] >= 50)  {
      hit[i] = false;
      steps[i] = 0;
    } 
  }

  text ("ENTER to restart",300,50);
}

void ex (int x, int y, int step)  {
  line (x,y-step,x,y-10-step);
  line (x+step,y-step,x+8+step,y-8-step);
  line (x+step,y,x+10+step,y);
  line (x+step,y+step,x+8+step,y+8+step);
  line (x,y+step,x,y+10+step);
  line (x-step,y+step,x-8-step,y+8+step);
  line (x-step,y,x-10-step,y);
  line (x-step,y-step,x-8-step,y-8-step);
}

void mousePressed()
{
  for (int i = 0; i < targetx.length; i++)  {
    if (mouseX >= targetx[i] - 15 && mouseX <= targetx[i] + 15 && mouseY >= targety[i] - 15 && mouseY <= targety[i] + 15)  {
      hit[i] = true;
    }
  }
}

void keyPressed()
{
  for (int i = 0; i < targetx.length; i++)  {
    if (keyCode == ENTER)  {
      hit[i] = false;
      steps[i] = 0;
    } 
  }
}












