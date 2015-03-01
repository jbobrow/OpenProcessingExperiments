
Branch branch;

int depth = 13;
float startLength = 200;
float lengthMultiplied = 0.5; // at least 2?
float theAngle = PI/2.5;

void setup(){
  size(700,700);
  
  branch = new Branch(width/2,height,startLength,PI/2, 0); // x y l a
}

void draw(){
  background(255);
  branch.drawBranch();
  
  theAngle = map(mouseY,height,0,0,PI);  
  lengthMultiplied = map(mouseX,0,width,0,1);

  branch.updateBranches(width/2,height,startLength,PI/2);
    
}

class Branch{
  
  float l;
  float sX;
  float sY;
  float eX;
  float eY;
  float angle;
  
  int number;
  
  Branch firstBranch;
  Branch secondBranch;
  
  Branch(float tX, float tY, float tL, float tA, int tNumber){
    number = tNumber;
    
    sX = tX;
    sY = tY;
    l = tL;
    angle = tA;
    
    eY = sY - sin(angle) * l;
    eX = sX + cos(angle) * l;
    
    if(number < depth){
      nextBranches();
    }
  }
  
  
  void drawBranch(){   
    float lineWidth = depth;
    
    for(int i = 0; i < number; i++){
      lineWidth/=1.5;
    }
    
    strokeWeight(lineWidth);
    
    line(sX,sY,eX,eY);
    
    if(firstBranch != null){
      firstBranch.drawBranch();
    }
    if(secondBranch != null){
      secondBranch.drawBranch();
    }
  }
  
  void nextBranches(){
    firstBranch =  new Branch(eX, eY, l*lengthMultiplied, angle+theAngle, number+1);
    secondBranch = new Branch(eX, eY, l*lengthMultiplied, angle-theAngle, number+1);  
  }
  
  void updateBranches(float tX, float tY, float tL, float tA){
    if(number != 0){
      // change angle
      sX = tX;
      sY = tY;
      l = tL;
      angle = tA;
      
      eY = sY - sin(angle) * l;
      eX = sX + cos(angle) * l;
    }
    
    // update next
    if(number < depth){
      firstBranch.updateBranches(eX, eY, l*lengthMultiplied, angle+theAngle);
      secondBranch.updateBranches(eX, eY, l*lengthMultiplied, angle-theAngle);
    }
  }
}


