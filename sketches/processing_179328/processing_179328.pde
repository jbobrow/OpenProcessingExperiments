
class Agent {
   
  int posX;
  int posY;
  int size;
   
  Agent(int posX, int posY) {
    this.posX = posX;
    this.posY = posY; 
  }
   
}
 
 
Agent agent;
int countdown = 300;
 
 
void setup()
{
   
  size(800, 600);
  frameRate(120);
 
  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100); 
   
  rectMode(CENTER);
   
  agent = new Agent(width/2, height/2);
  agent.size = 20; 
}
 
 
void draw()
{
   
  fill(map(mouseY, 0, height, 0, 360), 100, 100);
  stroke(map(mouseX, 0, width, 0, 360), 100, 100);
   
  
  if (countdown != 0) {
    background(0, 0, 100);
    text("loading...", width/2, height/2);
    countdown--;
    if (countdown == 0) {
      background(0, 0, 100);
      agent.posX = width/2;
      agent.posY = height/2;  
    }  
  } else {
    rect(agent.posX, agent.posY, agent.size, agent.size);       
  }
  
   
  if(mouseX < agent.posX) {
    agent.posX--; 
  } else {
    agent.posX++; 
  }
   
  if(mouseY < agent.posY) {
    agent.posY--;
  } else {
    agent.posY++; 
  }
   
}


