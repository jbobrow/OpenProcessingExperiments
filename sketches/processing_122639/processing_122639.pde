
void setup()
{
  size(500, 500);
}
void draw()
{
  background(80);
  
  translate(width/2,height/2);
  float stunden = map(hour(),0,12,0,360);
  float minuten = map(minute(),0,60,0,360);
   
  {int s = second()*4;
   noStroke();
  fill(200,200,200,180);
  ellipse(0,0,s,s);
  
 
  pushMatrix();
  noStroke();
  fill(250);
  rotate(radians(minuten));
  ellipse(0,-75,10,10);
  popMatrix();
  
  
  pushMatrix();
  noStroke();
  fill(135,219,159);
  rotate(radians(stunden));
  ellipse(0,-100,30,30);
  popMatrix();
  
  }

  }
   

