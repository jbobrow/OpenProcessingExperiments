
PolarTool polarTool;

void setup()
{
  size(800, 600);
  polarTool = new PolarTool(width/2,height/3,60,180);
}

void draw()
{
  background(181,252,255);
  polarTool.update(mouseX,mouseY);
  polarTool.draw();
}

void mousePressed()
{
  polarTool.pressed();
}

void mouseReleased()
{
  polarTool.released();
}



import java.util.Arrays;
import java.util.Collections;
class PolarTool
{
  //  interface related arraylists
  ArrayList<PVector> lines = new ArrayList<PVector>();
  ArrayList<PVector> sects = new ArrayList<PVector>();
  ArrayList<PVector> center_polarpoints = new ArrayList<PVector>();
  ArrayList<PVector> edge_polarpoints = new ArrayList<PVector>();

  //  the useful values from the interface
  ArrayList<Float> values = new ArrayList<Float>();  

  boolean down;
  float r_center;
  float r_edge;
  float theta;
  int cx,cy;
  float mx, my;

  //  number of values stored in the graph (360 for degrees of a full circle)
  int NUM_VALUES = 360;                    
  int[] indexes = new int[NUM_VALUES];                   
  ArrayList<Integer> tmpIndexes = new ArrayList<Integer>();
  boolean overlap = false;
  
  PolarTool(int _centerx, int _centery, int _centercircleradius, int _edgecircleradius)
  {
    down = false;
    r_center = _centercircleradius;
    r_edge = _edgecircleradius;
    cx = _centerx;
    cy = _centery;
    
    for (int i=0; i<NUM_VALUES; i++)
    {
      //populate values with default -1s
      values.add(-1f);

      theta = radians(i-90);

      //  small circle
      float x_center = r_center * cos(theta) + cx;
      float y_center = r_center * sin(theta) + cy;
      center_polarpoints.add(new PVector(x_center, y_center));
    
      //  large circle
      float x_edge = r_edge * cos(theta) + cx;
      float y_edge = r_edge * sin(theta) + cy;
      edge_polarpoints.add(new PVector(x_edge, y_edge));
    }
  }
  
  void update(float _mx, float _my)
  {
    mx = _mx;
    my = _my;
    
    interact();
  }
  
  void draw()
  {
    drawArea();
    drawSegments();
    drawInput();
    drawValues();
    drawMiddle();
  }
  
  void pressed()
  {
    lines.clear();
    sects.clear();
    for(int i=0; i<indexes.length;i++) indexes[i]=0;
    for (int i=0; i<values.size (); i++)values.set(i, -1f);
    down = true;
  }
  
  void released()
  {
    down = false;
    calcIntersects();
  }
  
  void interact()
  {
    //  if inside useful area, interact
    if (down)
    {
      if (dist(mx, my, cx, cy)<dist(edge_polarpoints.get(0).x, edge_polarpoints.get(0).y, cx, cy))
      {
        if (dist(mx, my, cx, cy)>dist(center_polarpoints.get(0).x, center_polarpoints.get(0).y, cx, cy))
        {
          lines.add(new PVector(mx, my));
        } else
        {
          float a = atan2(my-cy, mx-cx);
          float d = dist(cx, cy, center_polarpoints.get(0).x, center_polarpoints.get(0).y);
          float x = d * cos(a);
          float y = d * sin(a);
          lines.add(new PVector(x+cx, y+cy));
        }
      } else
      {
        float a = atan2(my-cy, mx-cx);
        float d = dist(cx, cy, edge_polarpoints.get(0).x, edge_polarpoints.get(0).y);
        float x = d * cos(a);
        float y = d * sin(a);
        lines.add(new PVector(x+cx, y+cy));
      }
    }
  }

  void drawInput()
  {
    stroke(255, 0, 0);
    for (int i=0; i< sects.size ()-1; i++)  
    {
      if (sects.get(i)!=null && sects.get(i+1)!=null)
      {  
        if (i<NUM_VALUES)
        {
          ellipse(sects.get(i).x, sects.get(i).y, 3, 3);

          if (i<sects.size())
          {
            line(sects.get(i).x, sects.get(i).y, cx,cy);
          }
        }
      }
    }
  }

  void drawMiddle()
  {
    fill(255);
    noStroke();
    ellipse(cx,cy,r_center*2,r_center*2);
  }

  void drawValues()
  {
    stroke(200);
    line(cx-values.size()/2,height-50,cx-values.size()/2,height);
    line(cx+values.size()/2,height-50,cx+values.size()/2,height);
    stroke(255,0,0);
    for (int i=0; i< values.size()-1; i++)
    {
      if(values.get(i+1)==-1)
      {
        values.set(i+1,values.get(i));
      }
      line(i + (cx-values.size()/2),height-values.get(i),i+1+(cx-values.size()/2),height-values.get(i+1));
    }
  }

  void drawArea()
  {
    stroke(200);
    fill(0);
    for (int i = 0; i < center_polarpoints.size (); i++)
    {
      ellipse(center_polarpoints.get(i).x, center_polarpoints.get(i).y, 2, 2);
      ellipse(edge_polarpoints.get(i).x, edge_polarpoints.get(i).y, 2, 2);
      line(center_polarpoints.get(i).x, center_polarpoints.get(i).y, edge_polarpoints.get(i).x, edge_polarpoints.get(i).y);
    }
  }

  void calcIntersects()
  {
    tmpIndexes.clear();
    for (int i=0; i<lines.size()-1; i++)
    {
      for (int j=0; j< center_polarpoints.size ()-1; j++)
      {
        if (segIntersection(lines.get(i).x, lines.get(i).y, lines.get(i+1).x, lines.get(i+1).y, cx, cy, edge_polarpoints.get(j).x, edge_polarpoints.get(j).y)!=null)
        {
          sects.add(segIntersection(lines.get(i).x, lines.get(i).y, lines.get(i+1).x, lines.get(i+1).y, center_polarpoints.get(j).x, center_polarpoints.get(j).y, edge_polarpoints.get(j).x, edge_polarpoints.get(j).y));
        
          int index = int(getIndexbasedOnAngle(cx,cy,lines.get(i).x, lines.get(i).y));
          if(index>=0)
          {
            indexes[index]=index;
            values.set(index,dist(lines.get(i).x,lines.get(i).y,center_polarpoints.get(j).x,center_polarpoints.get(j).y));
            
            if(indexes[index]>0) tmpIndexes.add(indexes[index]);
          }
        } 
      }
    }
    if(tmpIndexes.size()>0)
    {
      if(tmpIndexes.get(tmpIndexes.size()-1)>tmpIndexes.get(0))
      {
        
        for(int i=0; i< tmpIndexes.size()-1;i++)
        {
          println(abs((tmpIndexes.get(i+1)-tmpIndexes.get(i))));
          if(abs((tmpIndexes.get(i+1)-tmpIndexes.get(i))) > 180) 
          {
            overlap = true; 
            break;
          }
          else
          {
            overlap = false;
          }
        }
        
        if(overlap)
        { 
            println("backwards, overlap");
            values.set(tmpIndexes.get(0),0f);
        }
        else
        {
            println("normal");
            values.set(tmpIndexes.get(tmpIndexes.size()-1),0f);
        }
      }
      else
      {
        println("backwards or normal overlap");  
        values.set(tmpIndexes.get(tmpIndexes.size()-1),0f);
        //int m = Collections.max(tmpIndexes);
        values.set(tmpIndexes.get(0),0f);
        //println(m);
      }
    }
    println(tmpIndexes);
  }
  
  float getIndexbasedOnAngle(float p1x, float p1y, float p2x, float p2y)
  {
    float tmpresult = degrees(atan2(p1y-p2y, p1x-p2x));
    if (tmpresult>0)  
    {
      float result = tmpresult;
      if(result-90<0)
      {
        return result+270;
      }
      else
      {
        return result - 90;
      }
    } else if (tmpresult<0)
    {
      float result = 180+tmpresult+180;
      return result - 90;
    }
    else
    {
      return -1;
    }
  }

  void drawSegments()
  {
    for (int i=0; i<lines.size ()-1; i++)
    {
      stroke(0);
      line(lines.get(i).x, lines.get(i).y, lines.get(i+1).x, lines.get(i+1).y);
    }
  }

  PVector segIntersection(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) 
  { 
    float bx = x2 - x1; 
    float by = y2 - y1; 
    float dx = x4 - x3; 
    float dy = y4 - y3;
    float b_dot_d_perp = bx * dy - by * dx;
    if (b_dot_d_perp == 0) 
    {
      return null;
    }
    float cx = x3 - x1;
    float cy = y3 - y1;
    float t = (cx * dy - cy * dx) / b_dot_d_perp;
    if (t < 0 || t > 1) 
    {
      return null;
    }
    float u = (cx * by - cy * bx) / b_dot_d_perp;
    if (u < 0 || u > 1) 
    { 
      return null;
    }
    return new PVector(x1+t*bx, y1+t*by);
  }
}


