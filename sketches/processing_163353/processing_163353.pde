
int dropNum = 200; // how many rain drops on your screen??
Rain[] rains = new Rain[dropNum]; 

void setup() 
{
  size(600, 600);
  frameRate(40);
  noStroke();
  for(int i=0; i<dropNum ;i=i+1){
     rains[i]=new Rain(); 
  }
}

void draw() { 
  background(163,180,180);  
    for(int i=0 ; i<dropNum ; i=i+1){
    rains[i].update();
    }
} 
 
class Rain {  //this class setups the shape and movement of raindrop.
 float x = random(0,600);
 float y = random(-1000,0);
 float size = random(3,7); // size of raindrop 
 float speed = random(20,80); // speed range
  void update() 
  { 
    y += speed; 
    fill(185,197,209);
    ellipse(x, y-20, size, size*6); // tail of raindrop
    fill(255-(100-speed));
    ellipse(x, y, size, size*6); //head of raindrop 
    
    if (y> height) //initialize raindrop which arrives bottom.
     { 
       x = random(0,600);
       y = random(-1200,0);
     } 

  } 
} 

