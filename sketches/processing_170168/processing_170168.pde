
void setup()
{
  size(800,800);
  background(255);
}
 
void draw()
{
  background(255);
  float sekunde = map(millis(), 0,70,0,2*PI);
   
   int rndColorR, rndColorG, rndColorB, rndX, rndY;
  rndColorR = int(random(255));
  rndColorG = int(random(255));
  rndColorB = int(random(255));
   
  translate(width/2,height/2);
  for (float i = 0; i < 500; i++) {
    rotate(sekunde/800.0);
     
    fill(rndColorR, rndColorG, rndColorB);
    noStroke();
     
    triangle(i,0,10,10,5,5);
  }
}



