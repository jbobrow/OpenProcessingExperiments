

void setup()
{
  size(600, 600);
  background(255, 255, 255);
  smooth();
  frameRate(60);

}

void draw()
{  
  ellipse(random(600),random(600),random(70),random(90));
  fill(0,random(200),random(200));
  
  
  



if(key==' ')
{
  background(255,255,255);
   ellipse(random(600),random(600),random(70),random(40-90));
  fill(0,random(200),random(200));
  frameRate(10);
}

if(key=='m')
{
  ellipse(random(600),random(600),random(70),random(80));
  fill(220,0,random(255));
}

if(key=='n')
{
 //background(255,255,255);
 ellipse(random(600),random(600),random(70),random(80));
  fill(220,0,random(255),50);
}

if(key=='b')
{
  background(0,255,255);
}
}
