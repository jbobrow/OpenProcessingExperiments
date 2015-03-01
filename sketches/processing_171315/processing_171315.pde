
void setup()
{
  size(500,500);
  rectMode(CENTER);  
}

void draw()
{
  translate(width/2, height/2);
  background(0);
  noFill();
  strokeWeight(5);
  stroke(10,21,139);
  rect(0,0,50,50);
  
  float hr = map(hour(),0,12,0,2*PI);
  rotate(hr);
  for (int s=0;s<360;s=s+90)
  { 
  pushMatrix();
  noFill();
  stroke(10,158,201);
  rotate(radians(s));
  rect(0,150,50,50);
  popMatrix();
  }
  
  float sek = map(second(),0,60,0,2*PI);
  
  rotate(sek);
  
  for (int s=0;s<360;s=s+30)
  {
  pushMatrix();
  fill(255,140,0);
  noStroke();
  rotate(radians(s));
  rect(0,150,20,20);
  popMatrix();
  }
  
  float mil = map(millis(),0,60,0,2*PI);
  
  rotate(mil*0.005);
  pushMatrix();
  fill(127,159,165);
  noStroke();
  rect(0,200,20,20);
  popMatrix();
  

}
