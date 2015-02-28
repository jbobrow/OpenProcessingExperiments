
float ba = 200;
float bb = 175;
 
void setup()
{
  size(300, 400);
  frameRate(1);
noStroke();
  background(#FFFFFF);
  noFill();
}
 
void draw()
{
  background(#FFFFFF);
  fill(115, 195, 235);
  rect(30, 30, width-60, height-60);
  strokeWeight(0);
  fill(194, 24, 63);
  for (int i = 30; i < (width-30); i++)
  {
  rect(i, 30, 1, (ba-2) + random(4));
  ba = (ba -2)+ random(4);
  }
    fill(248, 211, 88);
  for (int i = 30; i < (width-30); i++)
  {
  rect(i, 30, 1, (bb-2) + random(4));
  bb = (bb -2)+ random(4);
  }
  if (ba - bb < 0 ) {
    bb = bb - 15;
  }
  if (bb - ba < 0 ) {
    ba = ba - 15;
     
  }
  if (bb + ba < 150) {
    bb = bb + 30;
    ba = ba + 50;
  }
 
   
   
   
}
