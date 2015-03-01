
//MAXWIDTH
//MAXHEIGHT

void setup()
{
  size(600, 600);
}

void draw()
{
}

void mousePressed()
{
  int rndW = (int)random(10,50);
  int rndH = (int)random(10,50);
  color rndCol = color ( random(0,255),   //R
                         random(0,255),   //G
                         random(0,255) ); //B
  fill(rndCol);
  ellipse(mouseX, mouseY, rndW, rndH);
}


