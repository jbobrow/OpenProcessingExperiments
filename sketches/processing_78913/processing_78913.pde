
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/30861*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
import fisica.*;
import controlP5.*;

ControlP5 controlP5;

FWorld world;
FBody Hover;
FBody Selected;
FBody Anchor;
Controller s1,s2,s3,s4,s5,s6,s7,s8,s9,s10;

ArrayList Joints;
ArrayList smallCircles;
ArrayList Polygons;

int numCircles = 600;

boolean selected = false;
boolean cont = true;

float rest = 0.1;
float fric = 0.1;
float dens = 1;
float damp = 0.5;
color col;
float xAxis = 0;
float yAxis = 1;


void setup() {
  size(700, 500);

  Fisica.init(this);

  world = new FWorld();
  world.setEdges(200,0,width,height);
  world.setGravity(0,980);
  
  Joints = new ArrayList();
  Polygons = new ArrayList();
  smallCircles = new ArrayList();
  for(int i = 0; i<numCircles; i++){
    FCircle myCircle = new FCircle(12);
    myCircle.setPosition(random(220,width-20), random(height));
    myCircle.setRotation(random(TWO_PI));
    myCircle.setFillColor(color(random(255),random(255),0));
    myCircle.setGroupIndex(0);
    myCircle.setNoStroke();
    myCircle.setGrabbable(false);
    world.add(myCircle);
    smallCircles.add(myCircle);
  }
  

  controlP5 = new ControlP5(this);
  ControlGroup l1 = controlP5.addGroup("Polygons",25,25,150);
  l1.setBackgroundColor(color(100));
  l1.setBackgroundHeight(150);
  Controller b1 = controlP5.addButton("circleButton",0,5,5,40,20);
  b1.setGroup(l1);
  b1.setLabel("Circle");
  Controller b2 = controlP5.addButton("boxButton",0,50,5,40,20);
  b2.setGroup(l1);
  b2.setLabel("Box");
  Controller b3 = controlP5.addButton("polyButton",0,95,5,40,20);
  b3.setGroup(l1);
  b3.setLabel("Poly");
  s2 = controlP5.addSlider("rest",0,1,0.1,5,40,80,15);
  s2.setGroup(l1);
  s2.setLabel("Restitution");
  s3 = controlP5.addSlider("fric",0,10,0.1,5,60,80,15);
  s3.setGroup(l1);
  s3.setLabel("Friction");
  s4 = controlP5.addSlider("dens",1,20,1,5,80,80,15);
  s4.setGroup(l1);
  s4.setLabel("Density");
  s5 = controlP5.addSlider("damp",0,10,0.5,5,100,80,15);
  s5.setGroup(l1);
  s5.setLabel("Damping");
  Controller b4 = controlP5.addButton("removeSelected",0,5,120,80,20);
  b4.setGroup(l1);
  b4.setLabel("Remove Select");
  Controller b5 = controlP5.addButton("clearAll",0,90,120,45,20);
  b5.setGroup(l1);
  b5.setLabel("Clear");
  
  ControlGroup l2 = controlP5.addGroup("Small Circle",25,200,150);
  l2.setBackgroundColor(color(100));
  l2.setBackgroundHeight(30);
  s1 = controlP5.addSlider("numCircles",0,1000,numCircles,5,5,100,10);
  s1.setGroup(l2);
  s1.setLabel("Number");
  
  ControlGroup l3 = controlP5.addGroup("Joints",25,255,150);
  l3.setBackgroundColor(color(100));
  l3.setBackgroundHeight(190);
  Controller b6 = controlP5.addToggle("anchor",false,5,5,20,20);
  controlP5.Label label = b6.captionLabel();
  b6.setLabel("Anchor");
  label.style().marginTop = -15;
  label.style().marginLeft = 25;
  b6.setGroup(l3);
  Controller b7 =controlP5.addButton("distanceJoint",0,5,35,135,20);
  b7.setGroup(l3);
  b7.setLabel("Distance Joint");
  s6 = controlP5.addSlider("distance",50,250,100,5,60,80,10);
  s6.setGroup(l3);
  s6.setLabel("Rest Length");
  s7 = controlP5.addSlider("frequency",0.1,5,1,5,75,80,10);
  s7.setGroup(l3);
  s7.setLabel("Frequency");
  Controller b8 = controlP5.addButton("prismaticJoint",0,5,95,135,20);
  b8.setGroup(l3);
  b8.setLabel("Prismatic Joint");
  s9 = controlP5.addSlider("xAxis",0,1,xAxis,5,120,35,10);
  s9.setGroup(l3);
  s9.setLabel("X Axis");
  s10 = controlP5.addSlider("yAxis",0,1,yAxis,70,120,35,10);
  s10.setGroup(l3);
  s10.setLabel("Y Axis");
  Controller b9 = controlP5.addButton("revoluteJoint",0,5,145,135,20);
  b9.setGroup(l3);
  b9.setLabel("Revolute Joint");
  s8 = controlP5.addSlider("maxTorque",0,15000,2000,5,170,70,10);
  s8.setGroup(l3);
  s8.setLabel("Motor Torque");
  
  ControlGroup l4 = controlP5.addGroup("Contact",25,470,150);
  l4.setBackgroundColor(color(100));
  l4.setBackgroundHeight(25);
  Controller t2 = controlP5.addToggle("cont",cont,5,5,15,15);
  controlP5.Label labelt2 = t2.captionLabel();
  t2.setLabel("Contact");
  labelt2.style().marginTop = -15;
  labelt2.style().marginLeft = 25;
  t2.setGroup(l4);
}

void draw() {
  background(255);
  
  col = color(map(rest,0,1,0,200),map(fric,0,10,0,200),map(damp,0,10,0,200),map(dens,0,20,100,255));
  //removeSmallCircles();
  
  world.step();
  world.draw();
  fill(0);
  rect(0,0,200,height);
}

 
 void contactPersisted(FContact contact) {
   // Draw in blue an ellipse where the contact took place
   if(cont){
     if(contact.getBody1().getGroupIndex() == 1 && contact.getBody2().getGroupIndex() == 1){
       //fill(0, 0, 170);
       stroke(0,0,170);
       noFill();
       ellipse(contact.getX(), contact.getY(), 10, 10);
     }
   }
 }

 

void distanceJoint(){
  if(Anchor != null){
    for(int i = 0; i<Joints.size(); i++){
      FJoint joint = (FJoint)Joints.get(i);
      world.removeJoint(joint);
    }
    Joints.clear();
    
    for(int i = 0; i<world.getBodies().size(); i++){
      FBody b = (FBody)world.getBodies().get(i);
      if(b.getGroupIndex() == 1){
        
        FDistanceJoint j = new FDistanceJoint(Anchor, b);
        j.setLength(100);
        j.setStroke(100);
        j.setFrequency(1);
        world.add(j);
        Joints.add(j);
      }
    }
  }
}

void prismaticJoint(){
  if(Anchor != null){
    for(int i = 0; i<Joints.size(); i++){
      FJoint joint = (FJoint)Joints.get(i);
      world.removeJoint(joint);
    }
    Joints.clear();
    
    for(int i = 0; i<world.getBodies().size(); i++){
      FBody b = (FBody)world.getBodies().get(i);
      if(b.getGroupIndex() == 1){
        FPrismaticJoint j = new FPrismaticJoint(Anchor, b);
        j.setStroke(100);
        j.setAxis(xAxis,yAxis);
        world.add(j);
        Joints.add(j);
      }
    }
  }
}

void revoluteJoint(){
  if(Anchor != null){
    for(int i = 0; i<Joints.size(); i++){
      FJoint joint = (FJoint)Joints.get(i);
      world.removeJoint(joint);
    }
    Joints.clear();
    
    for(int i = 0; i<world.getBodies().size(); i++){
      FBody b = (FBody)world.getBodies().get(i);
      if(b.getGroupIndex() == 1){
        FRevoluteJoint j = new FRevoluteJoint(Anchor, b,Anchor.getX()+(b.getX()-Anchor.getX())*2/3,Anchor.getY()+(b.getY()-Anchor.getY())*2/3);
        j.setStroke(100);
        j.setEnableMotor(true);
        j.setMaxMotorTorque(10000);
        j.setMotorSpeed(100);
        world.add(j);
        Joints.add(j);
      }
    }
  }
}

void anchor(boolean Anch){
  if(Anch){
    Anchor = new FCircle(20);
    Anchor.setPosition(random(250,width-50), random(50,height/3));
    Anchor.setFillColor(color(0));
    Anchor.setGroupIndex(2);
    Anchor.setNoStroke();
    Anchor.setDensity(0);
    world.add(Anchor);
  }else{
    for(int i = 0; i<Joints.size(); i++){
      FJoint joint = (FJoint)Joints.get(i);
      world.removeJoint(joint);
    }
    Joints.clear();
    
    world.removeBody(Anchor);
  }
}

void xAxis(float xAx){
  xAxis = xAx;
  for(int i = 0; i<Joints.size(); i++){
    FPrismaticJoint j = (FPrismaticJoint)Joints.get(i);
    j.removeFromWorld();
    j.setAxis(xAxis,yAxis);
    world.add(j);
  }
}

void yAxis(float yAx){
  yAxis = yAx;
  for(int i = 0; i<Joints.size(); i++){
    FPrismaticJoint j = (FPrismaticJoint)Joints.get(i);
    j.removeFromWorld();
    j.setAxis(xAxis,yAxis);
    world.add(j);
  }
}

void maxTorque(float Torque){
  for(int i = 0; i<Joints.size(); i++){
    FRevoluteJoint j = (FRevoluteJoint)Joints.get(i);
    j.removeFromWorld();
    j.setMaxMotorTorque(Torque);
    world.add(j);
  }
}

void frequency(float Freq){
  for(int i = 0; i<Joints.size(); i++){
    FDistanceJoint j = (FDistanceJoint)Joints.get(i);
    j.removeFromWorld();
    j.setFrequency(Freq);
    world.add(j);
  }
}

void distance(float Distance){
  for(int i = 0; i<Joints.size(); i++){
    FDistanceJoint j = (FDistanceJoint)Joints.get(i);
    j.removeFromWorld();
    j.setLength(Distance);
    world.add(j);
  }
}

void rest(float Rest){
  rest = Rest;
  for(int i = 0; i<world.getBodies().size(); i++){
    FBody b = (FBody)world.getBodies().get(i);
    if(b.getGroupIndex() == 1){
      b.setRestitution(Rest);
      b.setFillColor(col);
    }
  }
}

void damp(float Damp){
  damp = Damp;
  for(int i = 0; i<world.getBodies().size(); i++){
    FBody b = (FBody)world.getBodies().get(i);
    if(b.getGroupIndex() == 1){
      b.setDamping(Damp);
      b.setFillColor(col);
    }
  }
}

void fric(float Fric){
  fric = Fric;
  for(int i = 0; i<world.getBodies().size(); i++){
    FBody b = (FBody)world.getBodies().get(i);
    if(b.getGroupIndex() == 1){
      b.setFriction(Fric);
      b.setFillColor(col);
    }
  }
}

void dens(float Dens){
  dens = Dens;
  for(int i = 0; i<world.getBodies().size(); i++){
    FBody b = (FBody)world.getBodies().get(i);
    if(b.getGroupIndex() == 1){
      b.setDensity(Dens);
      b.setFillColor(col);
    }
  }
}

void circleButton(){
  FCircle myCircle = new FCircle(40);
  myCircle.setPosition(100+width/2, 200);
  myCircle.setRotation(random(TWO_PI));
  myCircle.setVelocity(random(-200,200), -200);
  myCircle.setFillColor(col);
  myCircle.setGroupIndex(1);
  myCircle.setNoStroke();
  myCircle.setRestitution(rest);
  myCircle.setDamping(damp);
  myCircle.setFriction(fric);
  myCircle.setDensity(dens);
  world.add(myCircle);
  Polygons.add(myCircle);
}

void boxButton(){
  FBox myBox = new FBox(40, 40);
  myBox.setPosition(100+width/2, 200);
  myBox.setRotation(random(TWO_PI));
  myBox.setVelocity(random(-200,200), -200);
  myBox.setFillColor(col);
  myBox.setGroupIndex(1);
  myBox.setNoStroke();
  myBox.setRestitution(rest);
  myBox.setDamping(damp);
  myBox.setFriction(fric);
  myBox.setDensity(dens);
  world.add(myBox);
  Polygons.add(myBox);
}

void polyButton(){
  FPoly myPoly = new FPoly();
  myPoly.vertex(20, 20);
  myPoly.vertex(-20, 20);
  myPoly.vertex(0, -20);
  myPoly.setPosition(100+width/2, 200);
  myPoly.setRotation(random(TWO_PI));
  myPoly.setVelocity(random(-200,200), -200);
  myPoly.setFillColor(col);
  myPoly.setGroupIndex(1);
  myPoly.setNoStroke();
  myPoly.setRestitution(rest);
  myPoly.setDamping(damp);
  myPoly.setFriction(fric);
  myPoly.setDensity(dens);
  world.add(myPoly);
  Polygons.add(myPoly);
}

void removeSelected(){
  if(Selected != null){
    for(int i = 0; i<Selected.getJoints().size(); i++){
      FJoint j = (FJoint)Selected.getJoints().get(i);
      for(int n = 0; n<Joints.size(); n++){
        FJoint jn = (FJoint)Joints.get(n);
        if(j == jn){
          Joints.remove(n);
        }
      }
      world.removeJoint(j);
    }
    world.removeBody(Selected);
  }
}

void clearAll(){
  for(int i = 0; i<Joints.size(); i++){
    FJoint joint = (FJoint)Joints.get(i);
    world.removeJoint(joint);
  }
  Joints.clear();
  
  ArrayList removeList = new ArrayList();
  for(int i = 0; i<world.getBodies().size(); i++){
    FBody b = (FBody)world.getBodies().get(i);
    if(b.getGroupIndex() == 1){
      removeList.add(b);
    }
  }
  for(int i = 0; i<removeList.size(); i++){
    FBody b = (FBody)removeList.get(i);
    world.removeBody(b);
  }
}

void mousePressed(){
  FBody selBody = world.getBody(mouseX,mouseY);
  if(Selected != null){
    Selected.setFillColor(col);
  }
  if(selBody != null){
    if(selBody.getGroupIndex() == 1){
      
      Selected = selBody;
      selected = true;
    }
  }else if(mouseX>200){
    Selected = null;
    selected = false;
  }
  if(Selected != null && selected == true){
    Selected.setFillColor(color(100,100,255));
    //s2.setValue(Selected.m_restitution);
  }
}


void mouseMoved(){
  FBody hovered = world.getBody(mouseX,mouseY);
  if(Hover != null && Hover != Selected){
    Hover.setFillColor(col);
  }
  if(hovered != null && hovered != Selected){
    if(hovered.getGroupIndex() == 1){
      hovered.setFillColor(color(255,0,0));
      Hover = hovered;
    }
  }
}


void keyPressed() {
  /*
  try {
    saveFrame("screenshot.png");
  } 
  catch (Exception e) {
  }
  */
}


void numCircles(int Num){
  numCircles = Num;
  if(numCircles != smallCircles.size()){
    while(numCircles<smallCircles.size()){
      FBody smallCircle = (FBody)smallCircles.get(0);
      world.removeBody(smallCircle);
      smallCircles.remove(0);
    }
    while(numCircles>smallCircles.size()){
      FCircle myCircle = new FCircle(12);
      myCircle.setPosition(random(220,width-20), random(height));
      myCircle.setRotation(random(TWO_PI));
      myCircle.setFillColor(color(random(255),random(255),0));
      myCircle.setGroupIndex(0);
      myCircle.setNoStroke();
      myCircle.setGrabbable(false);
      world.add(myCircle);
      smallCircles.add(myCircle);
    }
  }
}
