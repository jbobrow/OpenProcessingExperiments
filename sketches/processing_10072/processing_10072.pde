
Cell cell;

void setup()
{
  size(800,600);
  background(200);
  //smooth();
  initialize();

  
}
void initialize()
{
  cell = new Cell(width/2,height/2,random(TWO_PI),0,1); 
}
void draw()
{
  if(!cell.divided)
  {
    cell.update();
    cell.display();
  }
  cell.updateChildren();
}
void mousePressed()
{
  background(200);
  initialize();
}


class Cell
{
  float x,y;
  float px,py;
  float ang;
  float angvel;
  float time;
  float inittime;
  float maxgen;
  int generation;
  float speed;
  float angrand;
  color col;
  boolean divided;
  
  Cell cell1;
  Cell cell2;
  Cell(float tempx,float tempy,float tempang,float tempangvel,int tempgeneration)
  {
    x = tempx;
    y = tempy;
    ang = tempang;
    angvel = tempangvel;
    generation = tempgeneration;
    
    time = int(random(100))+1;
    inittime = time;
    angrand = random(0.5)+0.5;
    speed = random(20);
    maxgen = int(random(10))+7;
    divided = false;
    col = color(127.+127.*sin(generation/3.+PI/3.),127.+127.*sin(generation/4.),10);
  }
  void update()
  {
    time -= 1;
    ang += angvel;
    px = x;
    py = y;
    x += cos(ang)*speed;
    y += sin(ang)*speed;
    angvel += random(angrand)-angrand/2.;
    if(x < 0)
    {
      x = 1;
      ang = PI-ang;
    }
    if(x > width)
    {
      x = width-1;
      ang = PI-ang;
    }
    if(y < 0)
    {
      y = 1;
      ang = TWO_PI-ang;
    }
    if(y > height)
    {
      y = height-1;
      ang = TWO_PI-ang;
    }
      if(time == 0)
      {
        divide();
        divided = true;
      }
      
    //}
  }
  void updateChildren()
  {
    if(generation < maxgen)
    {
      if(divided)
      {
        cell1.updateChildren();
        if(!cell1.divided)
        {
          cell1.update();
          cell1.display();
        }
        cell2.updateChildren();
        if(!cell2.divided)
        {
          cell2.update();
          cell2.display();
        }
      }
    }
  }
  void display()
  {
    stroke(col);
    strokeWeight(70./generation);
    if(generation > maxgen-1)
    {
      strokeWeight(70./generation/inittime*time);
    }
    line(px,py,x,y);
  }
  void divide()
  {
    cell1 = new Cell(x,y,ang,angvel,generation+1);
    cell2 = new Cell(x,y,ang,angvel,generation+1);
  }
  
}

