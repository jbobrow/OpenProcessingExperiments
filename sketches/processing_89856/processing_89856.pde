
float r;
float g;
float b;
float rx;
float ry;

void setup()
{
  size(200,200);
  background(255);
  frameRate(20);
  
}

void draw()
{
  drawShape(100,100);
}

void drawShape(float a, float b)
{
  
   if(mouseX < a + 10 && mouseX > a - 10 && mouseY < a + 10 && mouseY > a - 10) 
    {
     fill(r,g,b);
     ellipse(a,b,100,100);
     rectMode(CENTER);  
     fill(g,b,r);
     triangle(b,a - 50,b - 25,a + 44,b + 25,a + 44);
     fill(b,r,g);
     rect(b,a,20,20);
    }
    else
    {
      r = random(255);
      g = random(255);
      b = random(255);
      rx = random(width);
      ry = random(width);
      fill(r,g,b);
      ellipse(rx,ry,100,100);
    }
   
}


