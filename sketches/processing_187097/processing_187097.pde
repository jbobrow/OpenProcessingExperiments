

void setup(){
size(600,400);
frameRate(10);
}

void draw(){
  noStroke();
for (int y = 0; y <=height; y = y +30)
{
  for(int x = 0; x <= width; x = x +30)
    {
      rect(x,y,50,50);
      fill(random(255), random(255), random(255));
    }
    
}
}
