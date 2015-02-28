
//Araiza Barajas Francico Javier
int t,p;
void setup()
{
  size(550,550);
}
 
void draw()
{
  if (mousePressed )
  {
   if ( mouseButton == LEFT) 
   {
      rect(mouseX-25, mouseY-25, 50, 50);
   }
   if ( mouseButton == RIGHT ) 
   {
      ellipse(mouseX, mouseY, 50, 50);
    }
  }
  background(200);
  noFill();
  strokeWeight(8);
  smooth();
  stroke(0);
  strokeWeight(8);
  ellipse(350,150,100,100);
  stroke(0,0,255);
  strokeWeight(8);
  ellipse(241,150,100,100);
  t=int(random(500));
  p=int(random(400));
  if((t!=459) && (p!=150))
  {
  stroke(255,0,0);
  strokeWeight(8);
  ellipse(t,p,100,100);
  }
  else{
    stroke(255,0,0);
    strokeWeight(8);
    ellipse(459,150,100,100);
    noLoop();
  }
     
  stroke(255,255,0);
  strokeWeight(8);
  ellipse(294,200,100,100);
  stroke(0,255,0);
  strokeWeight(8);
  ellipse(404,200,100,100);
}

   


