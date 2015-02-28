
void setup()
{
size(500, 500);
background(0);
}

int grad = 0;

void draw()
{
background(0);

  float eckt = map(mouseY, 500, 90, 0, 100);
  rectMode(CENTER);
  rect(150, 150, 200, 200, eckt);
  
  float kreist = map(mouseY, 0, 10, 0, 10);
  rectMode(CENTER);
  rect(150, 350, 200, 200, kreist);
  
  float eckt2 = map(mouseY, 500, 90, 0, 100);
  rectMode(CENTER);
  rect(350, 350, 200, 200, eckt2);
  
  float kreist2 = map(mouseY, 0, 10, 0, 10);
  rectMode(CENTER);
  rect(350, 150, 200, 200, kreist2);
  
  

 

}
