
float textX = 400;
float textY = height;
float size = 100;

void setup()
{
  size(800,700);
  background(0);
  frameRate(15);
}

void draw()
{
  background(0);
  fill(255);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
   fill(255,255,0);
   ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
    ellipse(random(width),random(height),3,3);
  textAlign(CENTER);
  textSize((height/size)*10);
  fill((255),(255),0);
  text("STAR WARS",textX,textY);
  fill(255,0,0);
  text("Revenge of the Sith",textX,textY+40);
  fill(255,255,0);
  text("A long, long time ago",textX,textY+80);
  text(" in a galaxy far far away.",textX,textY+120);
  
  textY = textY-6;
  size++;
  
  if(textY<0)
  {
    frameCount=0;
    textY=height;
    size=100;
  }
}
