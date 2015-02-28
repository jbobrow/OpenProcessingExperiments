
int spiralX, spiralY; 
float spiralXInc, spiralYInc, f = 0, leng, strokeAlpha = 0, fillAlpha = 0; 

void setup()
{
  size(500,500);
  colorMode(HSB);
  rectMode(CENTER);
  smooth();
  leng = sqrt(pow(width,2)+pow(height,2))/500;
}

void draw()
{
  draw5Innerds(width,height,0,0,30,5);
  draw5Innerds(0,0,0,0,30,5);
  draw5Innerds(0,height,0,0,30,5);
  draw5Innerds(width,0,0,0,30,5);
  draw5Innerds(spiralX,spiralY,1,10,(int)strokeAlpha,(int)fillAlpha);
  strokeAlpha-=.01;
  fillAlpha-=.01;
  spiralX+=spiralXInc;
  spiralY+=spiralYInc;
}

void mouseDragged()
{
  spiralX = mouseX;
  spiralY = mouseY;
  spiralXInc = mouseX - pmouseX;
  spiralYInc = mouseY - pmouseY;
  spiralXInc = spiralXInc + spiralXInc * noise(f/100);
  spiralYInc = spiralYInc + spiralYInc * noise(f/100);
  strokeAlpha = 30;
  fillAlpha = 5;
  scale(.5);
}

void mouseReleased()
{
  scale(2);
  strokeAlpha = 25;
}
void mousePressed()
{
  mouseDragged();
}

void mouseClicked()
{
  spiralX = mouseX+(int)noise(f/100);
  spiralY = mouseY;
  strokeAlpha = 20;
  fillAlpha = 5;
}

void draw5Innerds(int rx, int ry, int r2x, int r2y, int lineAlpha, int fillAlpha)
{  
  pushMatrix();
  translate(noise(f)*10+rx,noise(f)*10+ry);
  rotate(f);
  for(int x=0; x< width; x+=5)
  {
    rotate(radians(x%360));
    stroke(255,lineAlpha);
    fill(0,fillAlpha);
    rect(x,0,width-(rx),x*noise(x/10)/2);
    translate(r2x, r2y);
  }
  f+=.001;
  popMatrix();
}

