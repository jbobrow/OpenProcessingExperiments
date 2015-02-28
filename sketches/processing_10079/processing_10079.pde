
int sterne = 100;
float[] x = new float[sterne];
float[] y = new float[sterne];

void setup()
{
  size ( 600, 600 );
  noCursor();

  
  for (int i = 0; i < sterne; ++i)
  {
    x[i] = random(width);
    y[i] = random(height);
  }
}

void draw()
{
  background(0);
  malesterne();
  maleraumschiff(mouseX, mouseY);
  bewegesterne();
}



void malesterne()
{
  translate(0,0);
  for (int i = 0; i < sterne; ++i)
  {
    point(x[i], y[i]);
  }
}


void bewegesterne()
{
  for (int i = 0; i < sterne; ++i)
  {
    y[i] += 5;
    
    if (y[i] >= height)
    {
      x[i] = random(width);
      y[i] = 0;
    }
  }
}


void maleraumschiff(int x, int y)
{
  translate(x, y);
//Wings
rectMode(CENTER);
fill(200);
rect(0,40, 70, 15 );

//rote Ellemente
fill(255,50,120);
stroke(200.50,120);
ellipse(0, 30,15,70);

triangle(-40,50, -30,20,-30,50 );
triangle(+30,50, +30,20,+40,50 );
line(0,30-40,0,40);

//cockpitt
fill(50,50,255,200);
triangle(-4,40,0,24,0+4,40);
}
  

/*
//Wings
rectMode(CENTER);
fill(200);
rect(width/2, height*0.7, 70, 15 );

//rote Ellemente
fill(255,50,120);
stroke(200.50,120);
ellipse(width/2, height*0.65,15,70);

triangle(width/2-40,height*0.75, width/2-30,height*0.6,width/2-30,height*0.75 );
triangle(width/2+30,height*0.75, width/2+30,height*0.6,width/2+40,height*0.75 );
line(width/2,height*0.65-40,width/2,height*0.7);

//cockpitt
fill(50,50,255,200);
triangle(width/2-4,height*0.7,width/2,height*0.62,width/2+4,height*0.7);
*/


