
FlyingDot[] fdots;
FlyingDot fdot;
int count;

void setup(){
  background(255);
  size(800,800);
  fdots = new FlyingDot[4];
  count = 0;
}


void draw(){
  if(mousePressed){
    point(mouseX, mouseY);
    fdot = new FlyingDot(mouseX, mouseY);
    
   //if(count<4){
   // fdots[count] = fdot;
   // count++;
   // }else{
   //   count=0;
   //   fdots[0].spill();
   //   fdots[count] = fdot;
  //}
}
}

void mouseReleased(){
 fdot.fly();
 fdot.display(); 
}
class FlyingDot{
  int x;
  int y;
  int randomR, randomG, randomB, randomX, randomY, randomRad;
  
  FlyingDot(int x, int y){
    this.x = x;
    this.y = y;
  }
  
  void fly(){
    randomR = (int)random(255);
    randomG = (int)random(255);
    randomB = (int)random(255);
    randomX = (int)random(800);
    randomY = (int)random(800);
    randomRad = (int)random(10);
  }
  
  void spill(){
    randomR = (int)random(255);
    randomG = (int)random(255);
    randomB = (int)random(255);
    randomX = (int)random(800);
    randomY = (int)random(800);
    randomRad = (int)random(10);
    fill(randomR, randomG, randomB);
    ellipse(randomX,randomY,randomR,randomR);
  }
  
  void display(){
    stroke(randomR, randomG, randomB);
    ellipse(randomX,randomY,randomR,randomR);
  }
}


