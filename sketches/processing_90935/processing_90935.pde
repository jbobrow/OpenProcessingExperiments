
void setup()
{
  size(200,200);
  noStroke();

}
void draw()
{
  background (255);
  if (mouseX>20&&mouseX;<180&&mouseY;<180)
  {
  float [] col={random(255),random(255),random(255),random(255),random(255)};
  fill(col[4],col[2],col[0]);
  rect(30,90,20,20);
  fill(col[2],col[0],col[4]);
  ellipse(70,100,20,20);
  fill(col[1],col[4],col[3]);
  rect(90,90,20,20);
  fill(col[0],col[3],col[4]);
  ellipse(130,100,20,20);
  fill(col[4],col[2],col[3]);
  rect(150,90,20,20);
  }
  else 
  {
  float [] col={255,255,255,255,255};
 
  
  
  fill(col[0]);
  rect(30,90,20,20);
  fill(col[1]);
  ellipse(70,100,20,20);
  fill(col[2]);
  rect(90,90,20,20);
  fill(col[3]);
  ellipse(130,100,20,20);
  fill(col[4]);
  rect(150,90,20,20);
  
  
  
  }
}
