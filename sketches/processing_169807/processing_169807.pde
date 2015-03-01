

void setup()
{

  size(500, 500);
  background(255);
  smooth();
 rectMode(CENTER);
 rect(width/2-150,height/2,120,120);
 rect(width/2,height/2,120,120);
  rect(width/2+150,height/2,120,120);
}

void draw()
{
  
  background(204);
  int sekunde1 = second(); 
  int minute1 = minute(); 
  int stunde1 = hour();    
  ellipseMode(CENTER);

  stroke(80, 0, 0);
  strokeWeight(2);
  fill(255);
 ellipse(width/2-150, height/2, sekunde1*2, sekunde1*2);
  ellipse(width/2, height/2, minute1*2, minute1*2);
  ellipse(width/2+150, height/2, stunde1*5, stunde1*5);
  
   rectMode(CENTER);
   noFill();
 rect(width/2-150,height/2,120,120);
 rect(width/2,height/2,120,120);
  rect(width/2+150,height/2,120,120);

  }


