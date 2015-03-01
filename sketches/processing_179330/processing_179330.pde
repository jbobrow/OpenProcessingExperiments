
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
int countdown = 120;

void setup()
{
  
  size(800, 600);
  frameRate(60);

  colorMode(HSB, 360, 100, 100);
  background(0, 0, 100);  
  
  rectMode(CENTER);
  
  agent = new Agent(width/2, height/2);
  
}


void draw()
{
  noStroke();
 
  int distanceX = abs(agent.posX - mouseX);
  int distanceY = abs(agent.posY - mouseY);
  int distance;
  if (distanceX > distanceY) {
    distance = distanceX; 
  } else {
    distance = distanceY;  
  }
  fill(map(distance, 0, 400, 0, 360), 100, 100);
  
  agent.size = (int) map(distance, 0, width, 1, 50);
  
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
    ellipse(agent.posX, agent.posY, agent.size, agent.size);    
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


