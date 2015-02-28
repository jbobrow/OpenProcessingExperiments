
void setup()
{
  background(255);
  size (800,800);
  smooth();
  noLoop();
  
     stroke(140,220,245);
  noFill();
  rect(0,0,width,height);
  for(int k=0; k<width; k+=80)
      line(k,0,k,height);
  for(int k=0; k<height; k+=80)
      line(0,k,width,k);
}

void draw()
{
   
  for (int i = 0; i <800; i = i + 80)
  {
    for (int j = 0; j<800; j = j + 80)
    {
      int sstroke = int(random(2,10));
      int snowcolor = int(random(20,230));
      int transpar = int(random(100,250));
      float snowscalex = random(0.5,1.5);
      float snowscaley = random(0.5,1.5);
      
    snowflake(i,j,sstroke,snowcolor,transpar,snowscalex,snowscaley);
}
}
}
void snowflake (float x, float y, int snowstroke, int snowblue, 
int transpar, float sx, float sy )
 {
   pushMatrix();
   translate(x,y);
   strokeWeight(snowstroke);
   stroke(0,0,snowblue,transpar);
   scale(sx,sy);

  line (35,20,35,50);
  line (15,35,55,35);
  line (20,5,35,20);
  line (35,20,50,5);
  line (15,35,0,20);
  line (15,35,0,50);
  line (35,50,20,65);
  line (35,50,50,65);
  line (55,35,70,50);
  line (55,35,70,20);
  popMatrix();
 
  }



