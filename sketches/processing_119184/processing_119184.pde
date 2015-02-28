
void setup()
{
size(500,500);
background (255);
noStroke();

}

void draw()
{
  background(255);
   fill(200,0,0);
  noStroke();
  rect(50,50,100,100);
  
  fill(200,0,0);
  noStroke();
  rect(200,50,100,100);
  
  fill(200,0,0);
  noStroke();
  rect(350,50,100,100);
  
  fill(0);
  noStroke();
  rect(50,350,100,100);
  
  fill(0);
  noStroke();
  rect(200,350,100,100);
  
  fill(0);
  noStroke();
  rect(350,350,100,100);
  
 translate(0,-mouseY/10);
 pushMatrix();
 
 fill(0);
  noStroke();
  rect(50,200,100,100);
  
  fill(200,0,0);
  noStroke();
  rect(200,200,100,100);
  
  fill(0);
  noStroke();
  rect(350,200,100,100);
   popMatrix();
  resetMatrix();
  
  pushMatrix();
  translate(0,mouseY/10);
  fill(0);
  noStroke();
  rect(50,200,100,100);
  
  fill(0);
  noStroke();
  rect(200,200,100,100);
  
  fill(0);
  noStroke();
  rect(350,200,100,100);
  popMatrix();
  resetMatrix();
  
}
