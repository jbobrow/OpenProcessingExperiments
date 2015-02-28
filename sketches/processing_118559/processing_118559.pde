
class Line
{
    PVector point, direction;
    
    void Draw()
    {
        line(point.x - direction.x * 1000, point.y - direction.y * 1000, point.x + direction.x * 1000, point.y + direction.y * 1000);
    }
}

Line[] getTwoLines(Circle c1, Circle c2)
{
    if(c2.radius > c1.radius)
    {
        c = c2;
        c2 = c1;
        c1 = c;
    }
    
    d = c1.center.dist(c2.center);
    sina = (c1.radius - c2.radius) / d;
    if(sina > 1)
        return null;
    
    cosa = sqrt(1 - sina * sina);
        
    x = d * c1.radius / (c1.radius - c2.radius);
    centerDir = PVector.sub(c2.center, c1.center);
    centerDir.normalize();
    crossPoint = PVector.add(c1.center, PVector.mult(centerDir, x));
    
    res = new Line[2];
    res[0] = new Line();
    res[0].point = crossPoint;
    res[0].direction = new PVector(centerDir.x * cosa - centerDir.y * sina,
       centerDir.x * sina + centerDir.y * cosa);
       
    res[1] = new Line();
    res[1].point = crossPoint;
    res[1].direction = new PVector(centerDir.x * cosa + centerDir.y * sina,
       -centerDir.x * sina + centerDir.y * cosa);       
        
    return res;
}

class Circle
{
    PVector center;
    float radius;
    
    void Draw()
    {
        ellipse(center.x, center.y, radius * 2, radius * 2);
    }
    
    bool IsIn(PVector point)
    {
        return point.dist(center) < radius;
    }
}

Circle first = new Circle();
Circle second = new Circle();

void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  fill(100,100,100,50);
  first.center = new PVector(width/2, height/2);
  first.radius = 40;
  second.center = new PVector(width/3, height/2); 
  second.radius = 15;
}

void draw() {  //draw function loops 
  background(220);
  fill(100,100,100,50);
  text("Круги можно перетаскивать мышью.", 10, 30);  
  
  if(mousePressed == true)
  {
    m = new PVector(mouseX, mouseY);
    if(second.IsIn(m))
        second.center = m;
    else if(first.IsIn(m))
        first.center = m;
  }
    
  first.Draw();
  second.Draw();
  lines = getTwoLines(first, second);
  if(lines == null)
  {
     fill(0, 100, 200);
     text("Общих касательных нет", 10, 10);  
  }
  else
  {
      lines[0].Draw();
      lines[1].Draw();      
  }
}
