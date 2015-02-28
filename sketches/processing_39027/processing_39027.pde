
int[] blob;
float r, x, y;

void setup()
{

  blob=new int[1000];
  int n=0;
  while (n<1000)
  {
    blob[n]=int (random (0, 400));
    n=n+1;
  }
  size(400, 400);
  background (255);
  r=30;
  x=width/2;
  y=height/2;
}

void draw()
{
  if (millis() < 5000)
  {

    for (int i = 0; i < 1000; i=i+3) 
    {
      strokeWeight(3);
      stroke (64,random (200,255),142, 30);
      point(random(0, 400), blob[i]);
    }
  }
  if (millis() >= 5000)
  {
     for (int i = 0; i < 1000; i=i+3) 
    {
      strokeWeight(3);
      stroke (random(255), 30);
      point(random(0, 400), blob[i]);
    }
   if (r<400)
    {
      r=r+3;
    }
  
    noStroke();
    triangle(100, 0, 300, 0, 200, r);
    triangle(0, 100, 0, 300, r, 200);

   fill (64,random (150,255),142, 30);
  ellipse ( width/2, height/2,30,30);

    //arc
     
    
    strokeWeight(1);
    stroke(64,random (200,255),142);
    noFill();
    arc(x, y, random(100, 500), random(100, 500), 0, PI/2);
    arc(x, y, random(100, 500), random(100, 500), PI/2, PI);
    arc(x, y, random(100, 500), random(100, 500), PI, TWO_PI-PI/2);
    arc(x, y, random(100, 500), random(100, 500), TWO_PI-PI/2, TWO_PI);

    //arc
    noStroke();
    fill(random (200,255), random(10, 50));
    arc(x, y, random(100, 500), random(100, 500), 0, PI/2);
    arc(x, y, random(100, 500), random(100, 500), PI/2, PI);
    arc(x, y, random(100, 500), random(100, 500), PI, TWO_PI-PI/2);
    arc(x, y, random(100, 500), random(100, 500), TWO_PI-PI/2, TWO_PI);
  }
}

                
