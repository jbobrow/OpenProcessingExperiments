
float triColorR[] = {0,255};
float triColorG[] = {0,255};
float triColorB[] = {0,255};
float triXA[] ={0,100};
float triYA[] ={0,100};
float triXB[] ={0,100};
float triYB[] ={0,100};
float triXC[] ={0,100};
float triYC[] ={0,100};

 
triAngle myTriAngle1;   
triAngle myTriAngle2;   
triAngle myTriAngle3;   

 
void setup(){
  background(0);
  frameRate(3);
  size(100,100);
}
 
void draw(){
  background(
    random(triColorR[0],triColorR[1]),
    random(triColorG[0],triColorG[1]),
    random(triColorB[0],triColorB[1])
  );
myTriAngle1 = new triAngle(
    random(triColorR[0],triColorR[1]),
    random(triColorG[0],triColorG[1]),
    random(triColorB[0],triColorB[1]),
    random(triXA[0],triXA[1]),
    random(triXB[0],triXB[1]),
    random(triXC[0],triXC[1]),
    random(triYA[0],triYA[1]),
    random(triYB[0],triYB[1]),
    random(triYC[0],triYC[1])
    );
  myTriAngle1.run(); 

myTriAngle2 = new triAngle(
    random(triColorR[0],triColorR[1]),
    random(triColorG[0],triColorG[1]),
    random(triColorB[0],triColorB[1]),
    random(triXA[0],triXA[1]),
    random(triXB[0],triXB[1]),
    random(triXC[0],triXC[1]),
    random(triYA[0],triYA[1]),
    random(triYB[0],triYB[1]),
    random(triYC[0],triYC[1])
    );
  myTriAngle2.run(); 

myTriAngle3 = new triAngle(
    random(triColorR[0],triColorR[1]),
    random(triColorG[0],triColorG[1]),
    random(triColorB[0],triColorB[1]),
    random(triXA[0],triXA[1]),
    random(triXB[0],triXB[1]),
    random(triXC[0],triXC[1]),
    random(triYA[0],triYA[1]),
    random(triYB[0],triYB[1]),
    random(triYC[0],triYC[1])
    );
  myTriAngle3.run(); 
}
 
class triAngle{
  float triColorR; 
  float triColorG; 
  float triColorB; 
  float triXA;
  float triYA;
  float triXB;
  float triYB;
  float triXC;
  float triYC;

 
  triAngle(float _triColorR, float _triColorG, float _triColorB, float _triXA, float _triYA, float _triXB, float _triYB, float _triXC, float _triYC)
  {
  triColorR = _triColorR;
  triColorG = _triColorG;
  triColorB = _triColorB;
  triXA = _triXA;
  triYA = _triYA;
  triXB = _triXB;
  triYB = _triYB;
  triXC = _triXC;
  triYC = _triYC;
  
}
   
  void run(){
    display();
  }
 
void display(){
    noStroke();
    fill(triColorR,triColorG,triColorB);
    pushMatrix();
    
    // triangle
    fill(triColorR, triColorG, triColorB);
    triangle(triXA, triYA, triXB, triYB, triXC, triYC);
    popMatrix();
  }
}


