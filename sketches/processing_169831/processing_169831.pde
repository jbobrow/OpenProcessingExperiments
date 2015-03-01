
void setup()
{
  size(500,500);
  background(0);
}

void draw()
{
  background(0);
  float sekunde = map(millis(), 0,59,0,1*PI);
  
   int rndColorR, rndColorG, rndColorB, rndX, rndY;
  rndColorR = int(random(255));
  rndColorG = int(random(255));
  rndColorB = int(random(255));
  
  translate(width/2,height/2);
  for (float i = 0; i < 200; i++) {
    rotate(sekunde/1000.0);
    
    fill(rndColorR, rndColorG, rndColorB);
    noStroke();
    
    ellipse(i,0,10,10);
  }
}
