
void setup(){
  size(800, 600);
  float noiseValue = noise(random(255), random(255));
  background(noiseValue*random(255), noiseValue*random(255), noiseValue*random(255), noiseValue*random(255));
 
  int numberOfStartingObjects = int(random(457)); 
  for(int i = 0; i < numberOfStartingObjects; i++){
    int shpe = (int)random(i)%4;
    if(shpe % random(25) == 0){
      float xPos = random(width/random(2));
      float yPos = random(height/random(2));
      float xSize= random(height/random(4)*width/random(4));
      float ySize= random(height/random(height));
      fill(random(255), random(255), random(255));
      rect(xPos, yPos, xSize, ySize);
      i--;
    }
    if(shpe % random(25) == 3){
      float xPos = random(random(0,2)*random(0,width));
      float yPos = random(random(0,4)*random(0, height));
      fill(random(255), random(255), random(255), random(255));
      quad(random(xPos),random(yPos),random(xPos),random(yPos),random(xPos),random(yPos),random(yPos),random(xPos));
      i=i+((int)random(17) * (int)random(2,6));
    }
    if(shpe % 3 == 0){
      float xSize = random(height/4)*.90;
      float ySize = random(width/4);
      fill(random(255), random(255), random(255), random(255));
      ellipse(random(width), random(height), xSize, ySize);
      i=i+((int)random(5) * (int)random(1,3));
    }
    fill(255,255,255);
  }
}



