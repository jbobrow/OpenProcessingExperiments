
MyShape myShape;

float angleView = 0;
float distance = 20;

float lengthRatio = 1.0;
float angleSplit = PI/3;
float splits = 2.0;
int branchDepth = 3;

int startTime = 0;
float timeForLastFrame = 0;

void setup(){
  size(1000,1000,P3D);
  rectMode(CENTER);
  
  myShape = new MyShape(0,0,0,0,0,0,10,30,0);
}

void draw(){
  startTime = millis();
    
  background(50);
  
  translate(width/2,height*0.9);
  scale(4);
  rotateY(angleView);
  
  myShape.drawIt();

  
  angleView += 0.00005 * timeForLastFrame;
  
  timeForLastFrame = millis() - startTime;
}

void keyPressed(){
  if(key == CODED){
   if(keyCode == UP){
     splits++;
     if(splits > 5){
       splits = 5;
     }
     myShape = new MyShape(0,0,0,0,0,0,10,30,0);
   }
   else if(keyCode == DOWN){
     splits--;
     if(splits < 1){
       splits = 1;
     }
     myShape = new MyShape(0,0,0,0,0,0,10,30,0);
   }
   else if(keyCode == LEFT){
     angleSplit-= 0.05;
     if(angleSplit < -PI/2){
       angleSplit = -PI/2;
     }
     myShape.updateAngle(0,0,0);
   }
   else if(keyCode == RIGHT){
     angleSplit+= 0.05;
     if(angleSplit > PI/2){
       angleSplit = PI/2;
     }
     myShape.updateAngle(0,0,0);
   }
   
  } 
  else if(key == '1'){
    branchDepth = 0;
    myShape = new MyShape(0,0,0,0,0,0,10,30,0);
  } 
  else if(key == '2'){
    branchDepth = 1;
    myShape = new MyShape(0,0,0,0,0,0,10,30,0);
  }
  else if(key == '3'){
    branchDepth = 2;
    myShape = new MyShape(0,0,0,0,0,0,10,30,0);
  } 
  else if(key == '4'){
    branchDepth = 3;
    myShape = new MyShape(0,0,0,0,0,0,10,30,0);
  }
  else if(key == '5'){
    branchDepth = 4;
    myShape = new MyShape(0,0,0,0,0,0,10,30,0);
  }
  else if(key == '6'){
    branchDepth = 5;
    myShape = new MyShape(0,0,0,0,0,0,10,30,0);
  }
}
class MyShape{
  
  MyShape[] nextShape;

  PVector[] points = new PVector[8];
 
  float baseWidth = 10;
  float topWidth;
  float tall = 30;
  
  PVector startP;
  PVector endP;
  
  PVector xyzAngles;
  
  int numberDepth;
  
  MyShape(float tX, float tY, float tZ, float tAx, float tAy, float tAz, float tBW, float tT, int tN){
 
    xyzAngles = new PVector(tAx,tAy,tAz);
    
    numberDepth = tN;
    
    startP = new PVector(tX, tY, tZ);
    endP = new PVector(tX, tY - tT, tZ);
    
    baseWidth = tBW;
    topWidth = baseWidth / 2;
    tall = tT;
    
    points[0] = new PVector(-baseWidth/2.0, 0,  baseWidth/2.0);
    points[1] = new PVector( baseWidth/2.0, 0,  baseWidth/2.0);
    points[2] = new PVector( baseWidth/2.0, 0, -baseWidth/2.0);
    points[3] = new PVector(-baseWidth/2.0, 0, -baseWidth/2.0);
    
    points[4] = new PVector(-topWidth/2.0, -tall,  topWidth/2.0);
    points[5] = new PVector( topWidth/2.0, -tall,  topWidth/2.0);
    points[6] = new PVector( topWidth/2.0, -tall, -topWidth/2.0);
    points[7] = new PVector(-topWidth/2.0, -tall, -topWidth/2.0);
    
    if(numberDepth < branchDepth){
      nextShape = new MyShape[(int)splits];
      
      for(int i = 0; i < splits; i++){
        float angleShift = i * ((2*PI) / splits);
        float angleRot = (2*PI) / (splits * 2);
        nextShape[i] = new MyShape(endP.x,endP.y,endP.z,angleSplit,angleRot,xyzAngles.z + angleShift,topWidth,tall*lengthRatio,numberDepth+1);
      }
    }

  }
  
  void updateAngle(float tAx, float tAy, float tAz){
    
    xyzAngles = new PVector(tAx,tAy,tAz);
    
    if(numberDepth < branchDepth){
      for(int i = 0; i < splits; i++){
        float angleShift = i * ((2*PI) / splits);
        float angleRot = (2*PI) / (splits * 2);
        nextShape[i].updateAngle(angleSplit,angleRot,xyzAngles.z + angleShift);
      }
    }
  }
  
  void drawIt(){    
    translate(startP.x,startP.y,startP.z);
    
    rotateZ(xyzAngles.z); 
    rotateX(xyzAngles.x);
    
    
    // bottom
    beginShape();
    vertex(points[0].x,points[0].y,points[0].z);
    vertex(points[1].x,points[1].y,points[1].z);
    vertex(points[2].x,points[2].y,points[2].z);
    vertex(points[3].x,points[3].y,points[3].z);
    endShape(CLOSE);
    
    // top
    beginShape();
    vertex(points[4].x,points[4].y,points[4].z);
    vertex(points[5].x,points[5].y,points[5].z);
    vertex(points[6].x,points[6].y,points[6].z);
    vertex(points[7].x,points[7].y,points[7].z);
    endShape(CLOSE);

    for(int i = 0; i < 4; i++){
      rotateY((2*PI)/4);
      // side          
      beginShape();
      vertex(points[0].x,points[0].y,points[0].z);
      vertex(points[4].x,points[4].y,points[4].z);
      vertex(points[7].x,points[7].y,points[7].z);
      vertex(points[3].x,points[3].y,points[3].z);
      endShape(CLOSE);
    }
    
    
    float temp = map(mouseX,0,width,0,4);
    
    //rotateY(map(mouseX,0,width,0,2*PI)); // control twist here
    rotateY(xyzAngles.y);
    translate(0,-tall,-tall * (numberDepth+1));
    
    rotateX(-PI/2); 
    
    if(numberDepth < branchDepth){
      for(int i = 0; i < nextShape.length; i++){
        if(nextShape[i] != null){
          nextShape[i].drawIt();
        }
      }
    }
        
    rotateX(PI/2);
    
    translate(0,tall,tall* (numberDepth+1));
    
    rotateY(-xyzAngles.y);
    //rotateY(-map(mouseX,0,width,0,2*PI)); // control twist here
    
    rotateX(-xyzAngles.x);
    rotateZ(-xyzAngles.z);
     
    translate(-startP.x,-startP.y,-startP.z);
    
  }
}


