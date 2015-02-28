
void setup()
{
size(500,500);
background (0);
noStroke();

}

void draw()
{
  background(0);
   fill(80);
  noStroke();
  rect(50,50,100,100);
  
  fill(80);
  noStroke();
  rect(200,50,100,100);
  
  fill(80);
  noStroke();
  rect(350,50,100,100);
  
  fill(255);
  noStroke();
  rect(50,350,100,100);
  
  fill(255);
  noStroke();
  rect(200,350,100,100);
  
  fill(255);
  noStroke();
  rect(350,350,100,100);
  
 translate(0,-mouseY/10);
 pushMatrix();
 
 fill(255);
  noStroke();
  rect(50,200,100,100);
  
  fill(80);
  noStroke();
  rect(200,200,100,100);
  
  fill(255);
  noStroke();
  rect(350,200,100,100);
   popMatrix();
  resetMatrix();
  
  pushMatrix();
  translate(0,mouseY/10);
  fill(255);
  noStroke();
  rect(50,200,100,100);
  
  fill(255);
  noStroke();
  rect(200,200,100,100);
  
  fill(255);
  noStroke();
  rect(350,200,100,100);
  popMatrix();
  resetMatrix();
  
}
