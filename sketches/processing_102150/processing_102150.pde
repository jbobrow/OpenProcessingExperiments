


//import ddf.minim.*;
Maxim maxim;
AudioPlayer bass;
AudioPlayer snare;
AudioPlayer hihat1;
AudioPlayer hihat2;
int armAngle = 0;
int larmAngle = 0;
int angleChange = 10;
int langleChange = 6;
final int ANGLE_LIMIT = 135;
final int ARM_SPIN = 360;
boolean bassPressed = false;
boolean snarePressed = false;
boolean hihat1Pressed = false;
boolean hihat2Pressed = false;



void setup()
{
 size(300, 600);
 smooth();
 frameRate(30);
//colorMode(HSB);
maxim = new Maxim(this);
bass = maxim.loadFile("Beat15.wav");
bass.setLooping(true);
snare = maxim.loadFile("JustLikeThat.wav");
snare.setLooping(true);
hihat1 = maxim.loadFile("Perc01.wav");
hihat1.setLooping(false);
hihat2 = maxim.loadFile("Hat037.wav");
hihat2.setLooping(false);
}

void draw()
{
  if (hihat2Pressed == true){
  background(255,0,125);
  }else{  
  background(4,20,60);
  }
    int rx = random(0,300);
    int ry = random(0,300);
    int rr = random(0,255);
    int rg = random(0,255);
    int rb = random(0,255);
  float sp = .5, rot = 2;
  int numObs = 50;
  
 for (int i = 0; i < numObs; i++){
    pushMatrix();
    rotate(.1*i*rot);
    translate(sin(sp*i), 0);
    fill(rr,rg,rb);
    //ellipse(rx,ry,11,11);
    rect(rx,ry,11,11);
    popMatrix();
 }
  
  //for (int i = 0; i < 50000; i++){
    
    
    pushMatrix();
//    fill(rr,rg,rb);
//    rect(rx,ry,8,8);
//    translate(rx,ry);
//    ellipse(rx,ry,8,8);
    strokeWeight(2);
    //line(rx,ry, rx,ry);   
    popMatrix();
   
 
  
  
  pushMatrix();
if (bassPressed == true){
  fill(255,255,0);
  //bassPressed = false;
}else{
  fill(255,0,0);
}
rect(0, height/2, width/2, height/4);

////

if (hihat2Pressed == true){
  fill(120,255,120);
  hihat2Pressed = false;
}else{
  fill(0,255,0);
}
rect(width/2, height/2, width/2, height/4);

//

if (snarePressed == true){
  fill(125,255,200);
  //snarePressed = false;
}else{
  fill(0,0,255);
}
rect(0, height/1.333, width/2, height/4);

//

if (hihat1Pressed == true){
  fill(255,255,175);
  //hihat1Pressed = false;
}else{
  fill(125,255,0);
}
rect(width/2, height/1.333, width/2, height/4);
drawRobot();
armAngle += angleChange;
larmAngle += langleChange;

if (armAngle > ANGLE_LIMIT || armAngle < 0)
  {
    angleChange = -angleChange;
    armAngle += angleChange;
  }
  
if (larmAngle > ARM_SPIN)
  {
    //langleChange = 0;
    larmAngle = 0;
    hihat1Pressed = false;
  }
popMatrix();  
}

void drawRobot()
{
   pushMatrix();
   translate(width/3.2, height/6.1);
   scale(1.5);
   
  noStroke();
  fill(38, 150, 255);
  rect(20, 0, 38, 30); // head
  fill(20, 150, 150);
  rect(14, 32, 50, 50); // body

  drawLArm();
  
 
  drawRArm();
  
  
  drawLLeg();
  
  fill(38, 38, 200);
  rect(40, 84, 16, 50); // right leg
  
  fill(222, 222, 249);
  rect(27, 9, 7, 7); // left eye
  rect(45, 9, 7, 7); // right eye
  if (hihat1Pressed == true || bassPressed == true || snarePressed == true){
    fill(200,0,0);
    stroke(255,255,255);
    arc(40, 21, 20, 14, radians(0), radians(180));
  }else{
    pushMatrix();
     stroke(255,255,255);
     line(28, 24, 50, 24);
    popMatrix();
  }
  
  popMatrix();
  
}

void drawRArm(){
  //rect(66, 32, 12, 37); // right arm
  if (bassPressed == true) {
  pushMatrix();
  translate(66, 32);
  rotate(radians(-armAngle));
  fill(100, 100, 200);
  rect(0, 0, 12, 37); // right arm
  popMatrix();
  }else{
  fill(38, 38, 200);
  rect(66, 32, 12, 37); // right arm
  }
}

void drawLLeg(){
  //rect(22, 84, 16, 50); // left leg
  if (snarePressed == true){
    pushMatrix();
    translate(22, 84);
      pushMatrix();
      rotate(radians(armAngle));
      fill(100, 100, 200);
      rect(0, 0, 16, 25);
      popMatrix();
    
       pushMatrix();
       translate(-armAngle/3.5, -armAngle/3.7);  
       rect(0, 25, 16, 25);
       popMatrix();
    popMatrix();  
  
  }else{
  fill(38, 38, 200);
  rect(22, 84, 16, 25);
  rect(22, 109, 16, 25);
  }

}

void drawLArm(){
  //fill(38, 38, 200);
  //rect(0, 32, 12, 37); // left arm
  if (hihat1Pressed == true){
     pushMatrix();
     translate(0, 32);
     rotate(radians(larmAngle));
     fill(100, 100, 200);
     rect(0, 0, 12, 37);
     popMatrix();
  
  }else{
  fill(38, 38, 200);
  rect(0, 32, 12, 37); // left arm
  }

}

void mousePressed()
{
 
  if (mouseY > height/2){
   
    if (mouseY < height/1.333 && mouseX < width/2){
      if (bassPressed == false){
          bass.cue(0);
          //bass.setGain(0.5);
          bass.play(); 
          bassPressed = true;
        }else{
          bass.stop();
          bassPressed = false;
        }
     
    }
    
    if (mouseY > height/1.333 && mouseX > width/2){
      hihat1.cue(0);
      hihat1.stop();
      hihat1.play();
      hihat1Pressed = true;
    }
    
    if (mouseY > height/1.333 && mouseX < width/2){
      if (snarePressed == false){
         snare.cue(0);
         
         snare.play();
         snarePressed = true;
      }else{
        snare.stop();
        snarePressed = false;
      }
    }
    if (mouseY < height/1.333 && mouseX > width/2){
     hihat2.cue(0);
     //hihat2.loop(10);
     hihat2.stop();
     hihat2.play();
     
     
     hihat2Pressed = true;
     
     
    }
  
  }
  
}

//void mouseDragged()
//{
//
//  
//  } 
//}


