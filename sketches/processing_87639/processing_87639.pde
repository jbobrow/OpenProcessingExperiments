
float bH = random(40,100);
float bW = random(25,50);
float i = 0;
float wH = bH / 10;
float wW = bW / 4;
float floorcount = 0;
color buildcolor;
float starcount = random(1000);
float starcounter = 0;


void setup()
{
  size (800,600);
  background(9,21,47);
  smooth();
}

void draw()
{
  if(starcounter < starcount)
  {
    fill(255);
    ellipse(random(width), random(0,300),1, 1);
    starcounter++;
   }
   if (i<width)
     fill(255);
     drawBuilding();
     i=i+bW;
     bW=random(10,15);
     bH=random(40,150);
     wH=bH/10;
     wW=bW/5;
     floorcount=0;
     
     /*pushMatrix();
     drawBuilding();
     rotate(radians(180));
     filter (BLUR,1);
     popMatrix(); //back to original grid*/
}
 
void drawBuilding()
{
  stroke(1);
  fill(125,125,125);
  noStroke();
  while (floorcount <bH-5)
  {
    fill(random(0,255), random(0,255), random(255));
    rect (i+bW/10, 300-(floorcount+wH+3), wW, wH);
    rect (i+bW/7+3, 300-(floorcount+wH+3), wW, wH);
    rect (i+bW/7+5, 300-(floorcount+wH+3), wW, wH);
    floorcount = floorcount +wH+3;
  }
}

//void drawReflection()
