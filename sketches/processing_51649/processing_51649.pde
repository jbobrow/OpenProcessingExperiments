
void setup()
{
  size(300, 300);
  background(#E0D0DE);
  smooth();
  
  noStroke();
  rect(128,20,55,140);
  fill(#DF00F0,100);
 noStroke();
  rect(128,20,20,140);
  fill(#F0DC00,200);
   noStroke();
  rect(168,20,20,140);
  fill(#F0DC00,100);
  
  pushMatrix();
  // move the origin to the pivot point
  translate(100, 40); 
  
  // then pivot the grid
  rotate(radians(18)); 
  noStroke();
  fill(#0F9FA5);
  polygon(5, 100, 125, 50);
  
  noStroke();
  rectMode(CENTER);
  fill(#FFFFFF,100);
  polygon(5, 100, 125,30 );
  
  
  pushMatrix();
  // move the origin to the pivot point
  translate(100, 40); 
  
  // then pivot the grid
  rotate(radians(20));
  
  
  
}  
 
void polygon(int n, float cx, float cy, float r)
{
  float angle = 360.0 / n;
  beginShape();
  for (int i = 0; i < n; i++)
  {
    vertex(cx + r * cos(radians(angle * i)),
      cy + r * sin(radians(angle * i)));
  }
  endShape(CLOSE);
}


