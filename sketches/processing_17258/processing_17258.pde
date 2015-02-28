
int i = 0;
void setup()
{
size(750,600);
background(0);
frameRate(30);
}

void draw()
{
  smooth();
  noStroke();
  if (keyPressed == true){
  
for(int i=45; i<700; i+= 10)
  { 
    for (int j = 50; j<550; j+= 15)
  {
    smooth();
    fill(random(100,255));
    rect(i,j ,12,8);
    alpha(5);
  }
}
  }
}               
