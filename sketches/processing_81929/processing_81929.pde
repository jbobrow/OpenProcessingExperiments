
float h;

class Line
{
  int numpoints = 400;
  float step;
  Point[] points;

  Line()
  {
    step = float(width)/float(numpoints);

    points = new Point[numpoints];

    for (int i = 0; i < numpoints;i++)
    {
      // println(i*step);
      points[i] = new Point(i*step);
    }
  }
    void update()
    {
       for (int i = 0; i < numpoints;i++)
    {
      points[i].update();
    
    }
      
      
    }
    
    
    void display()
    {
    stroke(255,100);
    noFill();
      beginShape();
     for(int i = 0; i < points.length; i++)
     {
      vertex(points[i].x,points[i].y); 
       
     }
      endShape();
    }
    
    
  }

  class Point
  {
    float x, y;
    float vx, vy;
    Point(float _x)
    {
      x = _x;
      y = height/2;//????
    } 

    void update()
    {

      vy+=  (noise(x*.01, frameCount*.01)-.5);//*.4;
    
    vy*=.7;
    y+=vy;
      if(dist(x,y,mouseX,mouseY) < 30)
      {
        vy+=.51;
      }
    }
    void display()
    {
      point(x, y);
    }
  }


Line l;
  void setup()
  {
    // size(screen.width, scree.height, OPENGL);
    size(500, 500);
    smooth();
    //step = width/numpoints; 
    //println(step);
    l = new Line();
    h = height/2;
  }
  void draw()
  {
  background(0);
  stroke(255);
  noFill();
  stroke(200,random(80,100));
  /*for(int i = 0; i < 100; i+=1.5)
  {
  beginShape();
  vertex(0,height);
  for(int x = 0; x < width; x+=5)
  {
    //noise always return a number between 0,1
   vertex(x,h-i+ (noise(x*.01, (frameCount*.001), i*.01 )*100));
    
  }
  vertex(width, height);
  endShape();
  
  }*/
  
  l.update();
  l.display();
   
  }
