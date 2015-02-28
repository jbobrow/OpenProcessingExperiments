
/*
  Controls:
    •You control the green square. Click to fire a ball of mass towards the mouse
      *Via neuton's third law, this will act as prepultion
    •Use the z and x keys to change the speed you throw the ball at.
      *the speed will apear in cyan in the upper left hand corner
    •Use the , and . keys to change the frame-rate
      *the framerate will also apear in cyan in the upper left hand corner.
    •Use the a key to make the satellite fire away from the mouse instead of towards it.
    •Use the q key to draw a line between the center of mass and satellite
*/

import ddf.minim.*;
Minim minim;
AudioPlayer player;
ArrayList<Mover> Particles;
int centerX;
int centerY;
int started = 0;
float startSpeed = 1.7;
boolean towards = true;
boolean drawLine = false;
boolean zoomOut = false;
int frame = 30;
void setup(){
  //audio
  minim = new Minim(this);
  //player = minim.loadFile("ftl.mp3");
  if(started == 0){
  //player.play();
   started = 1;
  }
  background(0);
  size(900, 900);
  Particles  = new ArrayList<Mover>();
    //creates center particle
    Particles.add(new Mover(450,450, 0, 0, 20, 0,false));
    //creates satellite
    Particles.add(new Mover(250,450, 90, 7 , 5, 100,true));

  ellipseMode(CENTER);
}
//called every frame
//calls every particle's function tick(), and also adds gravity.
void tick(){
  //find every pair of particles
  for(int i=0; i<Particles.size();i++){
    for(int j=0; j<Particles.size();j++){
      if(i!=j){
      Particles.get(i).tick(); 
      //set up a gravity vector between thenm
      float angleX=-Particles.get(i).x+Particles.get(j).x;
      float angleY=Particles.get(i).y-Particles.get(j).y;
      float massExtended = 600*Particles.get(j).mass;
      float distance = sq(dist(Particles.get(i).x,Particles.get(i).y,Particles.get(j).x,Particles.get(j).y));
      PVector toAdd = new PVector(1,0,0);
      toAdd.setMag(massExtended/distance);
      toAdd.rotate(-atan2(angleY,angleX));
      //force of gravity
      Particles.get(i).motion=PVector.add(toAdd,Particles.get(i).motion);
       }
  }
  
}
  
}

void draw(){
  if(zoomOut){
   scale(0.01); 
  }
  else{
   scale(1); 
  }
  if(drawLine){
  line(Particles.get(0).x,Particles.get(0).y, Particles.get(1).x, Particles.get(1).y);
  }
     float distance = dist(Particles.get(0).x,Particles.get(0).y,Particles.get(1).x,Particles.get(1).y);
   float velSquared = sq(Particles.get(1).motion.mag());
   //draw hud
  textSize(20);
  fill(120,255,255);
   text(startSpeed, 10, 30); 
     fill(120,255,255);
   text(round(frameRate), 90, 30);
  fill(150,255,255);
   if(towards){
   text("towards", 10, 50); 
   }
   else{
     text("away", 10, 50);
   }
    
   float kineticE =  distance*velSquared;
  float potentialE = 1200*Particles.get(0).mass;
  if(kineticE>potentialE){
    fill(0,255,255);
   text("escapes", 10, 90); 
  }
  else{
    fill(100,255,255);
    text("doesn't escape", 10, 90);
  }
   
  Particles.get(0).motion.setMag(0);
  frameRate(frame);
  colorMode(RGB);
  fill(0,0,0,50);
  rectMode(CORNER);
  stroke(0);
  rect(0,0,width,height);
  fill(255,0,0);
  tick();
  //finds every satellite 
  for(int i=0; i<Particles.size();i++){
    if(Particles.get(i).isControllable){
      //draws the line showing where the satellite's rocket is aiming
      float mouseX2 = mouseX;
      float mouseY2 = mouseY;
      float startX = Particles.get(i).x+cos(atan2(mouseY-Particles.get(i).y,mouseX-Particles.get(i).x))*25;
      float startY = Particles.get(i).y+sin(atan2(mouseY-Particles.get(i).y,mouseX-Particles.get(i).x))*25;
       if(!towards){
      startX = Particles.get(i).x+cos(atan2(mouseY-Particles.get(i).y,mouseX-Particles.get(i).x))*-30;
      startY = Particles.get(i).y+sin(atan2(mouseY-Particles.get(i).y,mouseX-Particles.get(i).x))*-30;
      }
      stroke(255);
      line(Particles.get(i).x, Particles.get(i).y, startX, startY);
    }
    }
}

 void keyPressed(){
   if(key == 'z'){
    startSpeed -= 0.1;
   } 
   if(key == 'x'){
     startSpeed += 0.1;
   }
   if(key == ' '){
     setup();
   }
   if(key == 'a'){
     towards=!towards;
   }
      if(key == 'q'){
     drawLine=!drawLine;
   }
   if(key == '.'){
     frame++;
   }
      if(key == ','){
     frame--;
   }
         if(key == 's'){
     zoomOut=!zoomOut;
   }
   
 }

void mousePressed(){
  for(int i=0; i<Particles.size();i++){
    if(Particles.get(i).isControllable){
      float startX = Particles.get(i).x+cos(atan2(mouseY-Particles.get(i).y,mouseX-Particles.get(i).x))*30;
      float startY = Particles.get(i).y+sin(atan2(mouseY-Particles.get(i).y,mouseX-Particles.get(i).x))*30;
      float startDirection = degrees(-atan2(mouseY-Particles.get(i).y,mouseX-Particles.get(i).x));
      if(!towards){
      startX = Particles.get(i).x+cos(atan2(mouseY-Particles.get(i).y,mouseX-Particles.get(i).x))*-30;
      startY = Particles.get(i).y+sin(atan2(mouseY-Particles.get(i).y,mouseX-Particles.get(i).x))*-30;
      startDirection = degrees(-atan2(mouseY-Particles.get(i).y,mouseX-Particles.get(i).x))+180;
      }
      float startMass = 2;
      int startColor = round(random(255));
       Particles.add(new Mover(startX, startY,startDirection, startSpeed*5, startMass, startColor, false));
       PVector toAddShot=new PVector(1,0,0);
       Particles.get(Particles.size()-1).motion=PVector.add(Particles.get(Particles.size()-1).motion,Particles.get(i).motion);
       PVector toAdd=new PVector(1,0,0);
       toAdd.setMag(-startSpeed);
       toAdd.rotate(radians(-startDirection));
       //alastic force
     Particles.get(i).motion= PVector.add(Particles.get(i).motion,toAdd);
    } 
  }
}

class Mover{
 boolean isControllable;
 int pColor;
 float mass;
 float x;
 float y; 
 PVector motion;
  void tick(){
    if(isControllable){
     textSize(20);
     fill(40,255,255);
     text(motion.mag(), 10, 70);
     stroke(100,255,255);
     PVector motionToDraw = new PVector(motion.x, motion.y);
     motionToDraw.setMag(19);
     line(50,115,motionToDraw.x+50,motionToDraw.y+115);
     noFill();
     ellipse(50,115,40,40);
     stroke(255);
    }
    stroke(255);
   x=x+motion.x;
   y=y+motion.y;
   colorMode(HSB);
   fill(pColor, 255,255);
   if(isControllable){
     rectMode(CENTER);
     rect(x,y,mass*2,mass*2);
   }
   else{
   ellipse(x,y,mass*2,mass*2);
   }
  }

  Mover(float tempX,float tempY,float tempDirection,float tempSpeed, float tempMass, int tempColor, boolean tempCont){
    x=tempX;
    y=tempY;
    motion = new PVector(1,0,0);
    motion.setMag(tempSpeed);
    motion.rotate(-radians(tempDirection));
    mass=tempMass;
    pColor = tempColor;
    isControllable = tempCont;
  }
}


