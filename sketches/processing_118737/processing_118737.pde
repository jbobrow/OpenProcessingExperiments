
TechnoBall bigBall;

public class TechnoBall
{
  color[] colors;
  int bigR;
  int x = 0;
  int y = 0;
  
  TechnoBall()
  {
    bigR = 1;
    colors = new color[bigR];
  }
  TechnoBall(int inR)
  {
    bigR = inR;
    colors = new color[bigR];
  }
  void setColor(int index, color colorIn)
  {
    colors[index] = colorIn;
  }
  void advance()
  {
    color temp = colors[bigR-1];
    for(int i = bigR-1; i > 0; i--)
    {
      colors[i] = colors[i-1];
    }
    colors[0] = temp;
  }
  
  void run()
  {
    advance();
    drawMe();
  }
  
  
  
  
  void drawMe()
  {
    for(int i = bigR-1; i >= 0; i--)
    {
      noFill();
      strokeWeight(1);
      stroke(colors[i]);
      pushMatrix();
      translate(width/2,height/2);
      //triangle(0,-sqrt(3)/4.0*i,-(.5*i),sqrt(3)/4.0*i,(.5*i), sqrt(3)/4.0*i);
      scale(i);
      triangle(0,-sqrt(3)/4.0,-(.5),sqrt(3)/4.0,(.5), sqrt(3)/4.0);
      
      //ellipse(0,0,2*i,2*i);
      popMatrix();
    }
  }
}
  


void setup()
{
  //noStroke();
  noFill();
  
  background(255);
  size(600,600);
  frameRate(20000);
  colorMode(RGB);
  bigBall = new TechnoBall(425);
  for(int i = 0; i < bigBall.bigR; i++)
  {
    bigBall.setColor(i, color(round(random(255))));
  }
}

void draw()
{
  bigBall.run();
}



