
float ba = 100;
float bb = 75;
  
void setup()
{
  size(300, 200);
  frameRate(1);
noStroke();
  background(#FFFFFF);
  noFill();
}
  
void draw()
{
  background(#FFFFFF);
  fill(115, 195, 235);
  rect(0, 0, width, height);
  strokeWeight(0);
  fill(194, 24, 63);
  for (int i = 0; i < (width); i++)
  {
  rect(i, 0, 1, (ba-2) + random(4));
  ba = (ba -2)+ random(4);
  }
    fill(248, 211, 88);
  for (int i = 0; i < (width); i++)
  {
  rect(i, 0, 1, (bb-2) + random(4));
  bb = (bb -2)+ random(4);
  }
  if (ba - bb < 0 ) {
    bb = bb - 15;
  }
  if (bb - ba < 0 ) {
    ba = ba - 15;
      
  }
  if (bb + ba < 100) {
    bb = bb + 30;
    ba = ba + 50;
  }
  
    
    
    
}
