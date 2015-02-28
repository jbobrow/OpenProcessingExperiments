
void setup ()
{
  size (500,500);
  smooth();
  background(300);
  noFill();
}
void draw()
{
   translate(width/2,height/2);
  for (int i=0;i<200;i+=10)
  {
    rotate(radians(60));
    //ellipse
    stroke(50);
    strokeWeight(10);
    ellipse(0,0,50,200);
  
   // ellipse2
    stroke(50);
    strokeWeight(10);
    ellipse(20,20,80,350);
 
//ellipse3
 stroke(50);
 strokeWeight(10);
 ellipse(0,0,200,200);
   
  }
  noLoop();
}


