
import gifAnimation.*;

GifMaker gif = null;
boolean makeGif = false;

ArrayList<Line> lines = new ArrayList<Line>();

int lineRoughness = 5; //for pixel-perfect, use 1
int pointCount = 0;

void setup()
{
  size(500, 500);
  stroke(0, 0, 125);
  //frameRate(10);
}

void mousePressed()
{
  lines.add(new Line(new Point(mouseX, mouseY)));
  pointCount = 1;
}

void keyPressed()
{
  if (!makeGif)
  {
    gif = new GifMaker(this, "gif.gif");
    gif.setRepeat(0); //makes gif repeat
    gif.setDelay(16); //frame lasts 16ms - 60fps rate
    gif.addFrame();

    makeGif = true;
  }
  else
  {
    gif.finish();
    gif = null;

    makeGif = false;
  }
}

void draw()
{
  background(127);

  if (mousePressed)
  {
    Line currentLine = lines.get(lines.size() - 1);

    if (pointCount < lineRoughness)
    {
      currentLine.removeLastPoint(); //ignore some points according to roughness
      pointCount++;
    }
    else pointCount = 1; //reset point count

    currentLine.addPoint(new Point(mouseX, mouseY));
  }

  drawLines();

  if (makeGif)
  {
    gif.setDelay(16); //frame lasts 16ms - 60fps rate
    gif.addFrame();
  }
}

void drawLines()
{
  if (!lines.isEmpty())
  {
    Line line = null;

    for (int i = 0; i < lines.size(); i++)
    {
      line = lines.get(i);
      line.drawLine();
    }
  }
}

class Console
{
  ArrayList<Text> texts = new ArrayList<Text>();
  
  void drawConsole()
  {
    
  }
}
class Line
{
  ArrayList<Point> points = new ArrayList<Point>();

  Line(Point point)
  {
    points.add(point);
  }

  void addPoint(Point point)
  {
    if (points.size() > 1)
    {
      Point lastPoint = points.get(points.size() - 1);

      if (lastPoint.trueX != point.trueX && lastPoint.trueY != point.trueY) //do not add redundant points
        points.add(point);
    }
    else points.add(point);
  }

  void removeLastPoint()
  {
    if (!points.isEmpty())
      points.remove(points.size() - 1);
  }

  void drawLine()
  {
    if (points.size() > 1)
    {
      Point prevPoint = null;
      Point point = points.get(0);

      point.electrify();

      for (int i = 1; i < points.size(); i++)
      {
        prevPoint = point;
        point = points.get(i);

        point.electrify();

        line(prevPoint.drawX, prevPoint.drawY, point.drawX, point.drawY);
      }
    }
  }
}
class Point
{
  int trueX = -1, trueY = -1;
  int drawX = -1, drawY = -1;

  Point(int x, int y)
  {
    trueX = drawX = x;
    trueY = drawY = y;
  }

  void electrify()
  {
    drawX = trueX + (int)random(-10, 10);
    drawY = trueY + (int)random(-10, 10);
  }
}
class Text
{
  String text = null;
  
  color textColor = color(0, 0, 125);
  
  final int timeToShine = 120; //time, in frames, the text will be shwon in full color
  final int timeToBlend = 60; //time, in frames, the text will take to blend with the background
  final int timeToFade = 30; //time, in frames, the text will take to fade (using alpha)
  
  int timeToLive = timeToFade + timeToBlend + timeToShine;

  Text(String text)
  {
    this.text = text;
  }
  
  void drawText(int x, int y)
  {
    fill(textColor);
    text(text, x, y);
    
    drainLife();
  }
  
  void drainLife()
  {
    if(timeToLive <= timeToFade + timeToBlend)
    {
      if(timeToLive > timeToFade)
      {
        /*textColor = color(textColor.red() + 127.0/(float)timeToBlend,
                          textColor.green() + 127.0/(float)timeToBlend,
                          textColor.blue() + 127.0/(float)timeToBlend);*/
      }
      else if(timeToLive > 0)
      {
        
      }
    }
    
    timeToLive--;
  }
}


