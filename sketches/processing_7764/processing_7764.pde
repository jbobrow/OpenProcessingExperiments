
import peasy.*;

int numBuildings=15;
PeasyCam cam;
Building[] buildings;
float redline=5;
float radius=160;
float faceX=width/2;
float faceY=height/2;


void setup() {
  size(300,300,P3D);
  cam=new PeasyCam(this,width/2,height/2,0,400);
  faceX=width/2;
  faceY=height/2;
  buildings = new Building[numBuildings];
  for(int i=0;i<numBuildings;i++) {
    buildings[i]=new Building(random(10,30),random(10,30),random(10,30),radius*cos(i*0.5)+0,radius*sin(i*0.5)+0,-20,faceX,faceY,i);
  
  
  }


}

void draw() {
  background(0);
  lights();
  for(int i=0;i<numBuildings;i++) {
    pushMatrix();
    translate(width/2,height/2);
    buildings[i].display();
    buildings[i].move(); 
    popMatrix();
  }
}

class Building {
  float sizX, sizY, sizZ, posX, posY, posZ, velX, velY, velZ, accX, accY, accZ, dir;
  int id;
  Circle circle;
  
  Building(float SizX, float SizY, float SizZ, float PosX, float PosY, float PosZ,float FaceX,float FaceY, int ID) {
    sizX=SizX;
    sizY=SizY;
    sizZ=SizZ;
    posX=PosX;
    posY=PosY;
    posZ=PosZ;
    id=ID;
  }
  
  void jiggle() {
    accX=random(-1,1);
    accY=random(-1,1);
    accZ=random(-1,1);
  }
  
  void accto(float toX,float toY,float toZ) {
    accX=toX-posX;
    accY=toY-posY;
    accZ=toZ-posZ;
    accX=accX*0.005;
    accY=accY*0.005;
    accZ=accZ*0.005;
  }
    
  void move() {
    velX=constrain(velX+accX,-redline,redline);    
    velY=constrain(velY+accY,-redline,redline);    
    velZ=constrain(velZ+accZ,-redline,redline);
    if(posZ>0||posZ<-200) {velZ=-velZ;}
    posX=posX+velX;
    posY=posY+velY;
    posZ=posZ+velZ;
  
  }
  
  void makering() {
    pushMatrix();
    translate(posX,posY,posZ);
    
  
  }
  
  void display() {
    pushMatrix();
    translate(posX,posY,posZ);
    float dir1 = atan2(0-posY,0-posX);
    rotate(dir1);
    rotateY(sin(frameCount*0.1+id));
    fill(sizX%255+100,sizY%255+100,sizZ%255+100);
    box(sizX,sizY,sizZ);
    for(int i=0;i<5;i++) {
      pushMatrix();
      float dir2 = atan2(0-radius*0.1/sin(i),0-radius*0.1/cos(i));
      translate(radius*0.5*sin(frameCount*0.01)*cos(i),0,radius*0.5*sin(frameCount*0.01)*sin(i));
      rotateY(dir2); 
      rotateX(frameCount*0.01);
      box(10,10,10);
      for(int j=0;j<5;j++) {
        pushMatrix();
        float dir3 = atan2(0-radius*0.1*sin(j),0-radius*0.1*cos(j));
        translate(0,radius*0.1*cos(frameCount*0.3+i)*cos(j),radius*0.1*cos(frameCount*0.3+i)*sin(j));
        rotateY(frameCount*0.01);
        box(5,5,5);
        popMatrix();
      }
      popMatrix();
    }
    popMatrix();
  }
}

class Circle {
  float posX, posY, posZ;
  int numrings;
  Building[] circle;
  Circle(float PosX, float PosY, float PosZ, int Numrings) {
    posX=PosX;
    posY=PosY;
    posZ=PosZ;
    numrings=Numrings;
    circle=new Building[numrings];
    for(int i=0;i<numrings;i++) {
    }
  }

  void ring(float radius) {
    for(int i=0;i<numrings;i++) {
      circle[i].display();
    }
  }
}

