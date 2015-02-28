
float dividor;
float initialDividor;
int loopCount;
int count = 0;
void setup()
{
  size(800, 600);
  rectMode(CENTER);
  ellipseMode(CENTER);
  if (height > width)
  {
    dividor = height;
  }
  else
  {
    dividor = width;
  }
  initialDividor = dividor;
  loopCount = height;
  background(0);
  
}
void draw()
{
  fill(0,0,0,10);
  rect(width/2, height/2, width, height);
  fill(random(255), random(255), random(255), random(200));
  stroke(random(255));
    while(dividor > 1)
    {
       pushMatrix();
       rotate(degrees(random(0,mouseX)));
       rect(width/(dividor/2) + random(0,mouseX), height/(dividor/2) + random(0,mouseX), width/dividor, height/dividor);
       popMatrix();
       dividor = dividor/2;
       count++;
    }
     dividor = initialDividor;
}
            
                
