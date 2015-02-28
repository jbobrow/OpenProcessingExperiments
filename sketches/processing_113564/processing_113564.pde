

// Maximal line thickness
int maxThickness=6;

    Line line1;
    Line line2;
    Line line3;
    Line line4;
    Line line5;
    
void setup() {
  size(600, 600);
  stroke(255);
  background(0);
  
  colorMode(HSB, 255);
  
    line1=new Line(height/2, -0.5);
    line2=new Line(height/2, -1.5);
    line3=new Line(height/2, +1);
    line4=new Line(height/2, +2);
    line5=new Line(height/2, -2);
    
  colorMode(HSB, 255);
  
  colorMode(RGB, 255);
}

void draw() {
  
  background(0);
  line1.display();
  line2.display();
  line3.display();
  line4.display();
  line5.display();
}
  


class Line
{
  private float y; // it sotres our (variable) y coordinate
  private float vector; // this stores the direction and speed
  color lineColor;
  int thickness;
  
  public Line(int initY, float initVector)
  {
    y=initY;
    vector=initVector;
    
    lineColor=color( round(random(255)), 200, 255 );
    thickness=1+round(random(maxThickness));
    
    //lineColor=color(255);
  }
  
  public void display()
  {
    stroke(lineColor);
    strokeWeight(thickness);
    line(0, y, width, y);
    y = y + vector;
    if (vector < 0)
    {
      if (y < 0) 
        y = height;
    }
    else
    {
     if (y > height) 
        y = 0; 
    }
  }
}


