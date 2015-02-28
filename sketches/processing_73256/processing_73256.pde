
  float ControlUnoX;
  float ControlUnoY;
  float ControlDosX;
  float ControlDosY;
  
  float FijoUnoX;
  float FijoUnoY;
  float FijoDosX;
  float FijoDosY;

void setup()

{

  size(1000, 400);
  noFill();
  smooth();
  background(255);
  
  frameRate(60);

}

void draw()

{
  
  background(255);
  
  strokeWeight(random(0, 10));
  stroke(random(0, 255), random(0, 255), random(0, 255));
  
  ControlUnoX =  random(0, 1000);
  ControlUnoY =  random(0, 400);
  ControlDosX =  random(0, 1000);
  ControlDosY =  random(0, 400);
  
  FijoUnoX = random(0, 1000);
  FijoUnoY = random(0, 400);;
  FijoDosX = random(0, 1000);
  FijoDosY = random(0, 400);
  

    
    bezier(FijoUnoX, FijoUnoY, ControlUnoX, ControlUnoY, ControlDosX, ControlDosY, FijoDosX, FijoDosY);
  
}


