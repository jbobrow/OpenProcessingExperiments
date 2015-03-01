
// DEFINIZIONE DELLA CLASSE

class Bot 
{
  PVector pos;
  PVector vel = new PVector();
  color c;



  Bot (PVector startPos) {
    pos = startPos;
    
  }



  void update() {
    
    pos.add(vel);
    int xR = random(2);
    int yR = random(2);
    vel.x = vel.x + .1*(xR - 1);
    vel.y = vel.y + .1*(yR - 1); 
    
    if(pos.x < 10){vel.x = .1;}
    if(pos.x > 490){vel.x = -.1;}
    if(pos.y < 10){vel.y = .1;}
    if(pos.y > 490){vel.y = -.1;}
  }
  
  void display() {
  fill(c); 
  ellipse(pos.x,pos.y,2,2);
  }
}

// USO DELLA CLASSE





Bot[] bots = new Bot[300];


void setup() {
  int height = 500;
  int width = 500;
  size (height,width);
  noStroke();
  
  //Bot setup in array bots
  for (int i=0; i<bots.length; i++) {
    float x = random(width);
    float y = random(height);
    bots[i] = new Bot( new PVector(x,y) );
    
    float r = random(255);
    float g = random(255);
    float b = random(255);
   
    color c = color(r,g,255);
    bots[i].c = c;
    
  }
}

void draw() {
  background(0);
  
  
  for(int i = 0;i<bots.length;i++){
          
          bots[i].update();
          bots[i].display();
      }
}

