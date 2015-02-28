
float centrumX = 250;
float centrumY = 250;
float diameterVertikal = 50;
float diameterHorisontal = 50;
float afstandTilMus = 0;
int miss = 0;
int point = 0;
int level = 1;

void setup()
{
  size(700, 700);
}

void draw()
{
  background(0, 0, 0);
  stroke(255, 255, 255);
  fill(255, 255, 255);
  ellipse(centrumX, centrumY, diameterHorisontal, diameterVertikal);


  afstandTilMus = sqrt((mouseX-centrumX)*(mouseX-centrumX)+(mouseY-centrumY)*(mouseY-centrumY));

  if (afstandTilMus<=30+level-1)
  {
    centrumX = random(60, 650); 
    centrumY = random(60, 650); 
    miss +=1;
    
   
   
   
  if (afstandTilMus<=25)
    {
      point =+ 1;
      level +=1;
   
    }
  }
  text("musX="+mouseX, 20, 40);
  text("musY="+mouseY, 20, 60);
  text("Miss"+""+miss, 20, 80);
 text("Point"+""+point, 20, 100);
 text("Level"+""+level,20,120);
}
