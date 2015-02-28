
void setup()
{
  size(500,500);
  background(0);
}
void draw()
{
  background(0);
  noStroke();
  rect(25,55,50,50);
  rect(125,55,50,50);
  fill(0,255,0);
  rect(225,55,50,50);
  fill(255);
  rect(325,55,50,50);
  rect(425,55,50,50);
  
  translate(25,-mouseY/10);
  pushMatrix();
  noStroke();
  rect(0,150,50,50);
  rect(100,150,50,50);
  fill(0,255,0);
  rect(200,150,50,50);
  fill(255);
  rect(300,150,50,50);
  rect(400,150,50,50);
  
  popMatrix();
  resetMatrix();
  
  pushMatrix();
  translate(25,-mouseY/20);
 noStroke(); 
  rect(0,250,50,50);
  rect(100,250,50,50);
  fill(0,255,0);
  rect(200,250,50,50);
  fill(255);
  rect(300,250,50,50);
  rect(400,250,50,50);
  popMatrix();
  resetMatrix();
  
  rect(25,300,50,50);
  rect(125,300,50,50);
  fill(0,255,0);
  rect(225,300,50,50);
  fill(255);
  rect(325,300,50,50);
  rect(425,300,50,50);
  

  
  
  
}
