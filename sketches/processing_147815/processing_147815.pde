
float [] x = {50,50,50,150,150,150,250,250,250,350,350,450,450,500,500,500,550,550};
float [] y = {100,200,300,380,200,100,130,350,300,100,150,200,300,250,200,130,100,300};
float dim = 5;
float growDim1 = 5;
float growDim2 = 5;
float growDim3 = 5;
float deltaDim1 = .1;
float deltaDim2 = .1;
float deltaDim3 = .1;
float [] dy = {-1,1,-1,1,-1,1,-1,1,-1,-1,1,-1,1,-1,1,-1,1,-1};
float easing = .05;
color [] col = {color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255)),
                color(random(255),random(255),random(255))};

void setup()
{
  size(600,400);
  ellipseMode(CENTER);
  frameRate(24);
}

void draw()
{
  drawFigures();
  moveFigures();
  growFigures();
  drawLines();
}

void drawFigures()
{
  background(0);
  for(int i=0; i < x.length; i++)
  {
    fill(col[i]);
    ellipse(x[i],y[i],dim,dim);
  }
}

void drawLines()
{
  for(int i=0; i < x.length; i++)
  {
    if(i%2 == 1)
    {
      fill(col[i],20);
      triangle(x[i],y[i],0,200,300,200);
      stroke(col[i],50);
      line(x[i],y[i],0,200);
    }
    if(i%2== 0)
    {
      fill(col[i],20);
      triangle(x[i],y[i],600,200,300,200);
      stroke(col[i],50);
      line(x[i],y[i],300,200);
    }
  }
}
  
void moveFigures()
{
  for(int i=0; i < y.length; i++)
  {
    y[i] += dy[i];
    if(y[i] >= height)
    {
      dy[i] = -dy[i];
    }
    else if(y[i] <= 0)
    {
      dy[i] = -dy[i];
    }
  }
}

void growFigures()
{
  for(int i=0; i < y.length; i++)
  {
    fill(col[i],40);
    noStroke();
    ellipseMode(CENTER);
    
    ellipse(x[i],y[i],growDim1,growDim1);
    growDim1 += deltaDim1;
    if(growDim1 >= 40)
    {
      deltaDim1 = -deltaDim1;
    }
    else if(growDim1 <= 5)
    {
      deltaDim1 = -deltaDim1;
    }
    
    ellipse(x[i],y[i],growDim2,growDim2);
    growDim2 += deltaDim2;
    if(growDim2 >= 20)
    {
      deltaDim2 = -deltaDim2;
    }
    else if(growDim2 <= 5)
    {
      deltaDim2 = -deltaDim2;
    }
  }
}


