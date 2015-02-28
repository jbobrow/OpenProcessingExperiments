
/*
Press the left moouse button to draw.
Have Fun.
*/
float pre2shape;
float preshape;
int shap;
float siz;
PFont font;


void setup()
{
  size(600, 600);
  background(255);
  preshape = 1;
  smooth();
  noStroke();
}



void draw()
{
  pre2shape=random(3, 5);
  preshape=round(pre2shape);
  preshape=random(3);
  shap=round(preshape);
  siz=random(10, 50);

  fill(random(0, 255), random(0, 255), random(0, 255));
  if (mousePressed==true)
  {

    if (shap==1)
    {
      ellipse(mouseX, mouseY, siz, siz);
    }
    if (shap==2)
    {
      rect(mouseX-siz/2, mouseY-siz/2, siz, siz);
    }
    if (shap==3)
    {
      triangle(mouseX, mouseY-siz/2, mouseX+siz/2, mouseY+siz/2, mouseX-siz/2, mouseY+siz/2);
    }
  }
  fill(0, 255, 0);
  rect(250, 550, 100, 50);
  fill(255);
  font = loadFont ("BrushScriptMT-48.vlw");
  textFont(font, 40);
  text("Clear", 260, 550, 100, 50);
}

void mouseClicked()
{
  if (mouseX <350 && mouseX > 250)
  {
    if (mouseY>550)
    {

      fill(255);
      rect(0, 0, width, height);
      background(random(0, 255), random(0, 255), random(0, 255));
    }
  }
}



