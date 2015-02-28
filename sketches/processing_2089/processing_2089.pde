


void setup()
{
  size(800,500);
  frameRate(30);
  background(175, 238, 238);
  noLoop();
  smooth();
}

public class Cloud
{
  ArrayList cloudDots = new ArrayList();

  public Cloud()
  {
    for(int i = 0; i<35; i++)
    {
      cloudDots.add(new CloudDot());
    }
  }

  public void drawIt()
  {
    for(int i = 0; i < cloudDots.size(); i++)
    {
      CloudDot cd = (CloudDot)cloudDots.get(i);
      cd.drawnow();
    }
  }
}

public class CloudDot
{

  float x;
  float y;
  float xrad;
  float yrad;


  public CloudDot()
  {


    x = random( 100, 500);
    y = random( 100, 350);
    yrad = random(50, 200);
    xrad = random(yrad-15, yrad+15);


  }

  public void drawnow()
  {
    noStroke();
    fill(255,255,255);
    ellipse(x,y,xrad,yrad);
    fill(248,250,243);
    ellipse( x, y+0.1*yrad, xrad-0.05*xrad, yrad-0.1*yrad );

  }

}  



void draw()
{
  for(int i = 0; i<2; i++)
  {
    Cloud cd = new Cloud();

    cd.drawIt();
  }
}



