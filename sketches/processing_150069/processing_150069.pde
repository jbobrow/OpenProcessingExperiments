
// DEFINIZIONE DELLA CLASSE

class Bot 
{
  PVector pos;
  PVector vel = new PVector();
  int r, g, b;
  color c;
  int size;



  Bot (PVector startPos) {
    pos = startPos;
    
  }



  void update() {
    
    pos.add(vel);
    color nc = color(r,g,b);
    c = nc;
    
    if(abs(vel.x)>2){vel.x = .1;size++;}
    if(abs(vel.y)>2){vel.y = .1;size++;}
    
    if(r<=b){
    int xR = random(2);
    int yR = random(2);
    vel.x = vel.x + (r/1000)*(xR - 1);
    vel.y = vel.y + (r/1000)*(yR - 1);
     
    } else {
    float newDist = 100.0;
    float oldDist = 10.0;
    int target = 0;
   
    
    
    
    }
    
    
    if(pos.x < 10){vel.x = .1;}
    if(pos.x > 490){vel.x = -.1;}
    if(pos.y < 10){vel.y = .1;}
    if(pos.y > 490){vel.y = -.1;}
  }
  
  void display() {
  fill(c); 
  ellipse(pos.x,pos.y,size,size);
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
   
    color c = color(r,g,240);
    bots[i].c = c;
    
    bots[i].r = r;
    bots[i].g = g;
    bots[i].b = 240;
    
    bots[i].size = 3;
    
  }
}

void draw() {
  background(0);
  
  
  for(int i = 0;i<bots.length;i++){
          
          bots[i].update();
          bots[i].display();
      }
}

