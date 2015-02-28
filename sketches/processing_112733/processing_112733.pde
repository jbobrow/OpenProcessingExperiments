
boolean nodeDebug = true;
boolean wingBoneDebug = true;

ArrayList<Node> wingNodes = new ArrayList<Node>();
ArrayList<WingBone> wingBones = new ArrayList <WingBone>();


Node shoulder = new Node(225,250);
Node elbow = new Node(40,-PI/2,"polar");
Node wrist = new Node(110,-PI/2,"polar");

Node backShoulder = new Node(250,250);
Node backElbow = new Node(30,-PI/2,"polar");
Node backWrist = new Node(90,-PI/2,"polar");

Node animationRotationCenter = new Node(50,0);

Wing frontWing;
Wing backWing;

//WingBone forearm = new WingBone(elbow,wrist,animationRotationCenter);
//WingBone upperarm = new WingBone(shoulder,elbow,animationRotationCenter);

void setup()
{
  size(500,500,P2D);
  background(0);
  colorMode(HSB,100);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  
  frontWing = new Wing(shoulder, elbow, wrist, animationRotationCenter);
  backWing = new Wing(backShoulder, backElbow, backWrist, animationRotationCenter);
  
  frontWing.red = color(0,90,100);
  backWing.perspMultiplier=0.5;
  backWing.spinDir=1;
  
  frontWing.init();
  backWing.init();
  

//  wingNodes.add(shoulder);
//  wingNodes.add(elbow);
//  wingNodes.add(wrist);
//  wingBones.add(upperarm);
//  wingBones.add(forearm);
//  shoulder.attachChild(elbow);
//  shoulder.attachChild(animationRotationCenter);
//  elbow.attachChild(wrist);
//  
//  forearm.rotationCenter.pos.x = 50; 
//  forearm.rotationCenter.pos.y = 50;
//  
//  upperarm.rotationCenter.pos.x = 100; 
//  upperarm.rotationCenter.pos.y = 100;
//  
//  color red = color(0,70,100);
//  color orange = color(5,100,100);
//  forearm.newFeatherLayer(14,15,200,red);
//  upperarm.newFeatherLayer(6,20,200,red);
//  upperarm.newFeatherLayer(5,40,100,red);
}

void draw()
{
   background(60,20,100);
   
   backWing.update();
   
   pushMatrix();
   translate(220,250);
   strokeWeight(17);
   stroke(3,100,100);
   fill(3,100,100);
   rotate(-PI/12);
   line(-50,0,30,0);
   noStroke();
   ellipse(0,5,70,30);
   
   fill(3,100,100);
   ellipse(-60,0,130,7);
   
   
   pushMatrix();
   rotate(PI/40);
   fill(3,100,100);
   ellipse(-30,0,120,7);
   popMatrix();
   pushMatrix();
   rotate(-PI/25);
   fill(3,100,100);
   ellipse(-30,0,120,7);
   popMatrix();
   fill(3,0,100);
   ellipse(20,0,3,3);
   fill(8,100,100);
   triangle(38,5,30,12,55,5);
   fill(12,100,100);
   triangle(38,-3,35,5,65,5);
   popMatrix();
   
   frontWing.update();
   
//  
//  
//  wingNodeAnimation(elbow, 0, 400, 0.4,2);
//  wingNodeAnimation(wrist, -100, 400, 0.4,2);
//  
//  
//  if(wingBoneDebug)
//  { 
//    if(elbow.pos.y>0)
//   {
//     wingBones.get(0).update();
//     wingBones.get(1).update();
//   } 
//    else
//   {
//     wingBones.get(1).update();
//     wingBones.get(0).update();
//   }
//  }
//  if(nodeDebug)
//  {
//     wingNodes.get(0).update(); 
//  }
//  
//  //resetMatrix();
//  
//  
//  
//  strokeWeight(20);
//  stroke(0);
//  point(animationRotationCenter.pos.x,animationRotationCenter.pos.y);
//  if(keyPressed)
//  {
//    if(key=='s')
//    {
//      animationRotationCenter.setFullPos(mouseX,mouseY);
//      
//      
//    }
//  }
// //stop();
}
class Feather
{
  WingBone bone;
  float spawnPercentage;
  float thickness;
  float size;
  color tint;
  float angle = 0;
  float dynAngle = 0;
  
  Feather(WingBone wb, float spawnP, float th, float siz, color col, Node lCenter, Node rCenter)
  {
    bone=wb;
    spawnPercentage = spawnP;
    thickness= th;
    tint=col;
    tint=color(hue(col)+random(3),saturation(col),brightness(col));
    PVector spawnPos = new PVector( bone.end.pos.x*spawnPercentage,bone.end.pos.y*spawnPercentage);
    size= siz-dist(bone.lengthCenter.pos.x,bone.lengthCenter.pos.y,spawnPos.x,spawnPos.y);
    angle = atan2(rCenter.pos.y-spawnPos.y , rCenter.pos.x-spawnPos.x);
    println(angle);
  }
  
  void update()
  {
    pushMatrix();
    PVector currentPos = new PVector(bone.end.pos.x*spawnPercentage,bone.end.pos.y*spawnPercentage);
    translate(currentPos.x,currentPos.y);
    dynAngle = PI/2+atan2(bone.animRotCenter.pos.y-currentPos.y, bone.animRotCenter.pos.x-currentPos.x);
    //println(dynAngle/PI);
    rotate(dynAngle*angle);
    fill(tint);
    noStroke();
    arc(0.0,0.0,thickness,size,0,PI);
    popMatrix();
  }
}

class Node
{
  PVector pos = new PVector(0,0);
  color col = color(0,0,0);
  float magnitude = 0;
  float originalMagnitude = 0;
  float angle = 0;
  boolean rotateChildren = false;
  
  Node parent;
  ArrayList<Node> children = new ArrayList<Node>();
  
/////////////////////////////////////////////////////////////////////////////////////////////
// CONSTRUCTORS //  
/////////////////////////////////////////////////////////////////////////////////////////////
  Node()
  {
    pos = new PVector(0,0);
    updatePolarCoordinates();
    updateOriginalMagnitude();
  }
  
  Node(PVector p)
  {
    pos=p;
    updatePolarCoordinates();
    updateOriginalMagnitude();
  }
  
  Node(float x, float y)
  {
    pos = new PVector(x,y);
    angle = 0;
    updatePolarCoordinates();
    updateOriginalMagnitude();
  }
 
  Node(float a, float b, String isPolar)
  {
    if(isPolar == "polar")
    {
    magnitude = a;
    originalMagnitude = a;
    angle = b;
    updateCartesianCoordinates();
    }
    else
    {
      pos = new PVector(a,b);
      updatePolarCoordinates();
      updateOriginalMagnitude();
    }
  }
  
/////////////////////////////////////////////////////////////////////////////////////////////
// GET AND SET PROPERTIES //  
/////////////////////////////////////////////////////////////////////////////////////////////
  
  void setPos(float x, float y)
  {
    pos.x = x;
    pos.y = y;
    updatePolarCoordinates();
  }
  
  void setFullPos(float x, float y)
  {
    pos.x = x;
    pos.y = y;
    if(parent!=null)
    {
      PVector parentPos = parent.getFullPos();
      pos.x -= parentPos.x;
      pos.y -= parentPos.y;
    }
    updatePolarCoordinates();
  }
  
  
  
  PVector getFullPos()
  {
    float fullPosX = pos.x;
    float fullPosY = pos.y;

    if(parent!=null)
    {
      PVector parentPos = parent.getFullPos();
      fullPosX += parentPos.x;
      fullPosY += parentPos.y;
    }
    
    return new PVector(fullPosX,fullPosY);
  }
  
  void setMagnitude(float m)
  {
    magnitude = m;
    updateCartesianCoordinates();
  }
  
  void setAngle(float a)
  {
    angle = a;
    updateCartesianCoordinates();
  }
  
  void adjustMagnitude(float m)
  {
    magnitude += m;
    updateCartesianCoordinates();
  }
  
  void adjustAngle(float a)
  {
    angle += a;
    updateCartesianCoordinates();
    if(rotateChildren)
    {
      for(int i = 0; i<children.size(); i++)
      {
        children.get(i).angle+=a;
        children.get(i).updateCartesianCoordinates();
      }
    }
  }
  
  void restoreMagnitude()
  {
    magnitude=originalMagnitude;
  }
  
  void updateCartesianCoordinates()
  {
    pos.x=magnitude*cos(angle);
    pos.y=magnitude*sin(angle);
  }
  
  void updatePolarCoordinates()
  {
    magnitude = sqrt(sq(pos.x)+sq(pos.y));
    angle = atan2(pos.y,pos.x);
  }
  
  void updateOriginalMagnitude()
  {
    originalMagnitude = sqrt(sq(pos.x)+sq(pos.y));
  }
  
  void attachChild(Node child)
  {
    children.add(child);
    child.parent = this;
  }
  
  
  void update()
  {
    translate(pos.x,pos.y);
    point(0,0);
    
    for(int i = 0;i<children.size();i++)
    {
      children.get(i).update();
    }
  }

} 
class Wing
{
  
  ArrayList<Node> wingNodes = new ArrayList<Node>();
  ArrayList<WingBone> wingBones = new ArrayList <WingBone>();
  
  color red = color(0,70,100);
  color orange = color(10,100,100);
  
  Node shoulder;
  Node elbow;
  Node wrist;
  
  Node animationRotationCenter;
  
  float spinDir = 0;
  
  float perspMultiplier=1;
  
  
  Wing(Node s, Node e, Node w, Node a)
  { 
    shoulder = s;
    elbow = e;
    wrist = w;
    animationRotationCenter = a;
    
    WingBone forearm = new WingBone(elbow,wrist,animationRotationCenter);
    WingBone upperarm = new WingBone(shoulder,elbow,animationRotationCenter);
    
    wingNodes.add(shoulder);
    wingNodes.add(elbow);
    wingNodes.add(wrist);
    wingBones.add(upperarm);
    wingBones.add(forearm);
    shoulder.attachChild(elbow);
    shoulder.attachChild(animationRotationCenter);
    elbow.attachChild(wrist);
    
    
  }
  
  void init()
  {
    wingBones.get(1).rotationCenter.pos.x = 50; 
    wingBones.get(1).rotationCenter.pos.y = 50;
    
    wingBones.get(0).rotationCenter.pos.x = 50; 
    wingBones.get(0).rotationCenter.pos.y = 50;
    
    wingBones.get(1).newFeatherLayer(10,15,140,red);
    wingBones.get(0).newFeatherLayer(4,15,140,red);
    wingBones.get(0).newFeatherLayer(8,15,90,red);
  }
  
  void update()
  {
    pushMatrix();
    
    
    wingNodeAnimation(elbow, 0, 200, 0.2*perspMultiplier,1.5);
    wingNodeAnimation(wrist, -100, 200, 0.5*perspMultiplier,1.5);
    if(wingBoneDebug)
    { 
       if(elbow.pos.y>0)
       {
         wingBones.get(0).update();
         wingBones.get(1).update();
       } 
        else
       {
         wingBones.get(1).update();
         wingBones.get(0).update();
       }
      }
      if(nodeDebug)
      {
         wingNodes.get(0).update(); 
      } 
      
      popMatrix();
    }
    
    void wingNodeAnimation(Node n, float phase, float speed, float perspectiveXRatio, float radius)
    {
      n.restoreMagnitude();
      n.setAngle(PI+PI*spinDir+(spinDir*2-1)*radius*sin((millis()+phase)/speed));
      n.pos.x*=perspectiveXRatio;
    }
    
 }
  
  
class WingBone
{
  Node start;
  Node end;
  
  Node lengthCenter;
  Node rotationCenter;
  
  Node animRotCenter;
  
  ArrayList<Feather> feathers = new ArrayList<Feather>();
  
  WingBone(Node s, Node e, Node aRot)
  {
    start = s;
    end = e;
    animRotCenter = aRot;
    
    lengthCenter = new Node(5,end.pos.y*0.5);
    rotationCenter = new Node(3,end.pos.y);
    
    start.attachChild(lengthCenter);
    start.attachChild(rotationCenter);
    
    
    
  }
  
  void newFeatherLayer(int number, float thickness, float size, color tint)
  {
    for(int i = 0; i<number;i++)
    {
      Feather f = new Feather(this, float(i)/float(number),thickness,size,tint, lengthCenter, rotationCenter );
      feathers.add(f);
    }
  }
  
  void update()
  {
    pushMatrix();
    
    stroke(0);
    strokeWeight(1);
    translate(start.getFullPos().x,start.getFullPos().y);
    
    //line(0,0,end.pos.x,end.pos.y);
    
    stroke(0,100,100);
    strokeWeight(1);
   
    
    //point(lengthCenter.pos.x,lengthCenter.pos.y);
    //point(rotationCenter.pos.x,rotationCenter.pos.y);
    noStroke();
    //point(animRotCenter.pos.x,animRotCenter.pos.y);
    
    
    
    for(int i = 0; i<feathers.size();i++)
    {
      feathers.get(i).update();
    }
    
    popMatrix();
  }
}


