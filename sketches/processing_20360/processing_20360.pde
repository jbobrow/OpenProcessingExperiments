
//Adam Wilkinson Final.
//3Dcamera reference from http://www.openprocessing.org/portal/?userID=4966


import processing.opengl.*;

import processing.video.*;

import saito.objloader.*;

 PImage img2;
  OBJModel model, model2, model3;
 
 

float eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ;
 //Camera Variables
    float x,y,z;
    float tx,ty,tz;
    float rotX,rotY;
    float mX, mY;
    float frameCounter;
    float xComp, zComp;
    float angle;
 
  //Movement Variables
    int moveX;
    int moveZ;
    float vY;
    boolean canJump;
    boolean moveUP,moveDOWN,moveLEFT,moveRIGHT;
     
 
//Constants
  int ground = 0;
  int totalBoxes = 0;
  int standHeight = 100;
  int dragMotionConstant = 10;
  int pushMotionConstant = 100;
  int movementSpeed = 50;    //Bigger number = slower
  float sensitivity = 15;      //Bigger number = slower
  int stillBox = 0;        //Center of POV, mouse must be stillBox away from center to move
  float camBuffer = 10;
  int cameraDistance = 1000;  //distance from camera to camera target in lookmode... 8?
   
//Options
  int lookMode = 8;
  int spotLightMode = 4;
  int cameraMode = 1;
  int moveMode = 2;
  
 

void setup() {
  size(800,600,OPENGL);
  frameRate(20);
 
img2 = loadImage("snow1.jpg");

   model = new OBJModel(this, "house.obj", "absolute", TRIANGLES);
  model.enableDebug();
  model.scale(500); 
  model.translateToCenter();
 
  model2 = new OBJModel(this, "fence.obj", "absolute", TRIANGLES);
  model2.enableDebug();
  model2.scale(75); 
  model2.translateToCenter();
  
  model3 = new OBJModel(this, "crystal_cluster.obj", "absolute", TRIANGLES);
  model3.enableDebug();
  model3.scale(75); 
  model3.translateToCenter();
  
   x = width/2;
  y = height/2;
    y-= standHeight;
  z = (height/2.0) / tan(PI*60.0 / 360.0);
  tx = width/2;
  ty = height/2;
  tz = 0;
  rotX = 0;
  rotY = 0;
  xComp = tx - x;
  zComp = tz - z;
  angle = 0;
   
  //Movement Initialization
  moveX = 0;
  moveX = 0;
  moveUP = false;
  moveDOWN = false;
  moveLEFT = false;
  moveRIGHT = false; 
  canJump = true;
  vY = 0;

//starting view:
  eyeX=404.0; 
  eyeY=48.0; 
  eyeZ=2185.0; 

  centerX=407.0; 
  centerY=150.0; 
  centerZ=0; 
  upX=0; 
  upY=1; 
  upZ=0;

}
  


void draw(){
  
  //update frame
  background(193,168,168);
  lights();
  directionalLight(255, 255, 255, 0, 1, 0);
  cameraUpdate();
  locationUpdate();
  jumpManager(10);
  
  
//  pushMatrix();
//translate(width/2, height/2, 0);
//rotateX(radians(85));
//bigPlane(1600,img2);
//popMatrix();
//
////___building1
//pushMatrix();
//  translate(250, -150, -650);
////  rotateX(radians(-50));
//  rotateY(radians(500));
////  rotateZ(radians(50));
//  model.draw();
//  popMatrix();
//  
// 
// pushMatrix();
//  translate(0, 250, 1300);
//  rotateX(radians(-5));
//  rotateY(radians(500));
////  rotateZ(radians(50));
//  model2.draw();
//  popMatrix();
//  
//  pushMatrix();
//  translate(1000, 250, 1300);
//  rotateX(radians(-5));
//  rotateY(radians(500));
////  rotateZ(radians(50));
//  model2.draw();
//  popMatrix();

//  if(spotLightMode == 0)
//    lights();
//  else if(spotLightMode == 1)
//    spotLight(255,255,255,x,y-standHeight,z,tx,ty,tz,PI,1);
//  else if(spotLightMode == 2)
//    spotLight(255,255,255,x,y-standHeight-200,z,x+100,y+100,z,frameCounter/10,1);
//  else if(spotLightMode == 3)
//    spotLight(255,255,255,width/2,height/2-1000,0,width/2,height/2,0,PI,1);
//  else if(spotLightMode == 4)
//    pointLight(255,255,255,x,y,z);
    
  
  //Draw Boxes
  for(int x1 = 0; x1 < totalBoxes; x1++){
    for(int z1 = 0; z1 < totalBoxes; z1++){
        pushMatrix();
          translate(width/2+x1*100-(totalBoxes*100/2),height/2,z1*100-(totalBoxes*100/2));
//          translate(width/2,height/2);
//          fill((x1/totalBoxes)*255,255,(z1/totalBoxes)*255,random(250,255));
//          fill(255,255,0);
//          box(90);  
        popMatrix();
    }
  }
  
  cameraUpdate();
  locationUpdate();
  jumpManager(10);
  
  //Camera Mode 1 - Original
  if(cameraMode == 1)
    camera(x,y,z,tx,ty,tz,0,1,0);
  
  //Camera Mode 2 - Matrix'd
  if(cameraMode == 2){
    beginCamera();
      camera();
      translate(x,y,z);
      translate(0,2*-standHeight,0);

      rotateX(rotY/100.0); //This seems to work o.o
      rotateY(-rotX/100.0);
      //rotateX(rotX/100.0);
    endCamera();
  }
  
  frameCounter++;
  pushMatrix();
translate(width/2, height/2, 0);
rotateX(radians(85));
bigPlane(1600,img2);
popMatrix();

//___building1
pushMatrix();
  translate(400, -150, -950);
//  rotateX(radians(-50));
  rotateY(radians(450));
//  rotateZ(radians(50));
  model.draw();
  popMatrix();
  
 
 pushMatrix();
  translate(0, 250, 700);
  rotateX(radians(-5));
  rotateY(radians(475));
//  rotateZ(radians(50));
  model2.draw();
  popMatrix();
  
  pushMatrix();
  translate(1000, 250, 700);
  rotateX(radians(-5));
  rotateY(radians(950));
//  rotateZ(radians(50));
  model2.draw();
  popMatrix();
  
//  pushMatrix();
//translate(width/2, height/2, 0);
//rotateX(radians(10));
//mirror(100,cam);
//popMatrix();

pushMatrix();
  translate(1400, 100, -450);
  rotateX(radians(-5));
  rotateY(radians(450));
//  rotateZ(radians(50));
  model3.draw();
  popMatrix();
  
  pushMatrix();
  translate(-300, 100, 50);
  rotateX(radians(-5));
  rotateY(radians(550));
//  rotateZ(radians(50));
  model3.draw();
  popMatrix();
  
   pushMatrix();
  translate(-500, 50, -1350);
  rotateX(radians(-5));
  rotateY(radians(350));
//  rotateZ(radians(50));
  model3.draw();
  popMatrix();
  
}

public void cameraUpdate(){
  
  //Drag-motion
  if (lookMode == 1){
    if(pmouseX > mouseX)
      tx += dragMotionConstant;
    else if (pmouseX < mouseX)
      tx -= dragMotionConstant; 
    if(pmouseY > mouseY)
      ty -= dragMotionConstant/1.5;
    else if (pmouseY < mouseY)
      ty += dragMotionConstant/1.5;
  }
  
  //Push-motion
  else if (lookMode == 2){
    if (mouseX > (width/2+pushMotionConstant))
      tx += dragMotionConstant;
    else if (mouseX < (width/2-pushMotionConstant))
      tx -= dragMotionConstant;
    if (mouseY > (height/2+pushMotionConstant))
      ty += dragMotionConstant;
    else if (mouseY < (height/2-pushMotionConstant))
      ty -= dragMotionConstant;
  }
  
  //Push-motion V2 (Hopefully improved!)
  else if (lookMode == 3){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
    
    if (abs(diffX) > pushMotionConstant)
      tx += diffX/25;
    if (abs(diffY) > pushMotionConstant)
      ty += diffY/25;
  }
  
  //Push Motion V3 (For Camera-Mode 2)
  else if (lookMode == 4){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
  println(diffX);
  if (abs(diffX) > pushMotionConstant)
      rotX += diffX/100;
    if (abs(diffY) > pushMotionConstant)
      rotY += diffY/100;//diffY/100;
  }
  
  //Push Motion V4.1 (Because it crashed and I lost V4.0 T.T
  //Designed to work in cohesion with movement mode 2
  else if (lookMode == 5){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
    
    if(abs(diffX) > stillBox){
      xComp = tx - x;
      zComp = tz - z;
      angle = degrees(atan(xComp/zComp));
      
      //---------DEBUG STUFF GOES HERE----------
      println("tx:    " + tx);
      println("tz:    " + tz);
      println("xC:    " + xComp);
      println("zC:    " + zComp);
      println("Angle: " +angle);
      //--------------------------------------*/
      
      if (angle < 45 && angle > -45 && zComp < 0)
        tx += diffX/sensitivity;
      else if (angle < 45 && angle > -45 && zComp > 0)
        tx -= diffX/sensitivity;
        
      //Left Sector
      else if (angle > 45 && angle < 90 && xComp < 0 && zComp < 0)
        tz -= diffX/sensitivity;
      else if (angle >-90 && angle <-45 && xComp < 0 && zComp > 0)
        tz -= diffX/sensitivity;
        
      //Right Sector
      else if (angle <-45 && angle >-90)
        tz += diffX/sensitivity;
      else if (angle < 90 && angle > 45 && xComp > 0 && zComp > 0)
        tz += diffX/sensitivity;
    }
           
    if (abs(diffY) > stillBox)
      ty += diffY/(sensitivity/1.5);
  }
  
  //Lookmode 4.2
  //Using a more proper unit circle.
  else if (lookMode == 6){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
    
    if(abs(diffX) > stillBox){
      xComp = tx - x;
      zComp = tz - z;
      angle = correctAngle(xComp,zComp);
        
      //---------DEBUG STUFF GOES HERE----------
      println("tx:    " + tx);
      println("tz:    " + tz);
      println("xC:    " + xComp);
      println("zC:    " + zComp);
      println("Angle: " +angle);
      //--------------------------------------*/
      
      //Looking 'forwards'
      if ((angle >= 0 && angle < 45) || (angle > 315 && angle < 360))
        tx += diffX/sensitivity;
        
      //Looking 'left'
      else if (angle > 45 && angle < 135)
        tz += diffX/sensitivity;
        
      //Looking 'back'
      else if (angle > 135 && angle < 225)
        tx -= diffX/sensitivity;
        
      //Looking 'right'
      else if (angle > 225 && angle < 315)
        tz -= diffX/sensitivity;
       
    }
           
    if (abs(diffY) > stillBox)
      ty += diffY/(sensitivity/1.5);
  }
  
  //Lookmode 7, trying to get rid of the slowdown in the corners with a sorta-buffer thing
  else if (lookMode == 7){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
    
    if(abs(diffX) > stillBox){
      xComp = tx - x;
      zComp = tz - z;
      angle = correctAngle(xComp,zComp);
        
      //---------DEBUG STUFF GOES HERE----------
      println("tx:    " + tx);
      println("tz:    " + tz);
      println("xC:    " + xComp);
      println("zC:    " + zComp);
      println("Angle: " +angle);
      //--------------------------------------*/

      //Looking 'forwards'
      if ((angle >= 0-camBuffer && angle < 45+camBuffer) || (angle > 315-camBuffer && angle < 360+camBuffer))
        tx += diffX/sensitivity;
        
      //Looking 'left'
      else if (angle > 45-camBuffer && angle < 135+camBuffer)
        tz += diffX/sensitivity;
        
      //Looking 'back'
      else if (angle > 135-camBuffer && angle < 225+camBuffer)
        tx -= diffX/sensitivity;
        
      //Looking 'right'
      else if (angle > 225-camBuffer && angle < 315+camBuffer)
        tz -= diffX/sensitivity;
       
    }
           
    if (abs(diffY) > stillBox)
      ty += diffY/(sensitivity/1.5);
  }
  
  else if (lookMode == 8){
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
    
    if(abs(diffX) > stillBox){
      xComp = tx - x;
      zComp = tz - z;
      angle = correctAngle(xComp,zComp);
       
      angle+= diffX/(sensitivity*10);
      
      if(angle < 0)
        angle += 360;
      else if (angle >= 360)
        angle -= 360;
      
      float newXComp = cameraDistance * sin(radians(angle));
      float newZComp = cameraDistance * cos(radians(angle));
      
      tx = newXComp + x;
      tz = -newZComp + z;
    
      //---------DEBUG STUFF GOES HERE----------
      println("tx:    " + tx);
      println("tz:    " + tz);
      println("xC:    " + xComp);
      println("NewXC: " + newXComp);
      println("zC:    " + zComp);
      println("NewZC: " + newZComp);
      println("Angle: " +angle);
      //--------------------------------------*/
       
    }
           
    if (abs(diffY) > stillBox)
      ty += diffY/(sensitivity/1.5);
  }
  
  
}

public void locationUpdate(){
  
  /*Old method==================================
  if(keyPressed){
    if (keyCode == UP || key == 'w'){
      z-=10;
      tz-=10;
    }
    else if (keyCode == DOWN || key == 's'){
      tz+=10;
      z+=10;
    }
    else if (keyCode == LEFT || key == 'a' ){
      tx-=10;
      x-=10;
    }
    else if (keyCode == RIGHT || key == 'd'){
      tx+=10;
      x+=10;
    }
  }
  ============================================*/
  
  //Apply Movement
  if(moveMode == 1){
    z += moveZ;
    tz += moveZ;
    x += moveX;
    tx += moveX;
  }
  else if(moveMode == 2){
    if(moveUP){
      z += zComp/movementSpeed;
      tz+= zComp/movementSpeed;
      x += xComp/movementSpeed;
      tx+= xComp/movementSpeed;
    }
    else if(moveDOWN){
      z -= zComp/movementSpeed;
      tz-= zComp/movementSpeed;
      x -= xComp/movementSpeed;
      tx-= xComp/movementSpeed;
    }
    if (moveRIGHT){
      z += xComp/movementSpeed; 
      tz+= xComp/movementSpeed;
      x -= zComp/movementSpeed;
      tx-= zComp/movementSpeed;
    }
    if (moveLEFT){
      z -= xComp/movementSpeed; 
      tz-= xComp/movementSpeed;
      x += zComp/movementSpeed;
      tx+= zComp/movementSpeed;
    }
       
  }
  //New method also uses keyPressed() and keyReleased()
  // Scroll Down! 
}

public void jumpManager(int magnitude){
  
  if(keyPressed && key == ' ' && canJump){
    vY -= magnitude;
    if(vY < -20)
      canJump = false;
  }
  else if (y < ground+standHeight)
    vY ++;
  else if (y >= ground+standHeight){
    vY = 0;
    y = ground + standHeight;
  }
  
  if((!canJump) && (!keyPressed)){
    println("Jump Reset!");
    canJump = true;
  }
    
  y += vY;
}

public void keyPressed(){
  if(keyCode == UP || key == 'w'){
    moveZ = -10;
    moveUP = true;
  }
  
  else if(keyCode == DOWN || key == 's'){
    moveZ = 10;
    moveDOWN = true;
  }
  
  else if(keyCode == LEFT || key == 'a'){
    moveX = -10;
    moveLEFT = true;
  }
  
  else if(keyCode == RIGHT || key == 'd'){
    moveX = 10;
    moveRIGHT = true;
  }
}

public void keyReleased(){
  if(keyCode == UP || key == 'w'){
    moveUP = false;
    moveZ = 0;
  }
  else if(keyCode == DOWN || key == 's'){
    moveDOWN = false;
    moveZ = 0;
  }
    
  else if(keyCode == LEFT || key == 'a'){
    moveLEFT = false;
    moveX = 0;
  }
  
  else if(keyCode == RIGHT || key == 'd'){
    moveRIGHT = false;
    moveX = 0;
  }
}

public float correctAngle(float xc, float zc){
  float newAngle = -degrees(atan(xc/zc));
  if (xComp > 0 && zComp > 0)
    newAngle = (90 + newAngle)+90;
  else if (xComp < 0 && zComp > 0)
    newAngle = newAngle + 180;
  else if (xComp < 0 && zComp < 0)
    newAngle = (90+ newAngle) + 270;
  return newAngle;
}

void bigPlane(float sz, PImage img) {
  pushMatrix();

  scale(sz,sz,sz);

  beginShape(QUADS);
  texture(img2);

  vertex(-1,1,0,img.height);
  vertex(-1,-1,0,0);
  vertex(1,-1,0,img.width,0);
  vertex(1,1,0,img.width,img.height);

  endShape();

  popMatrix();
 
}

//void mirror(float sz, PImage img) {
//  pushMatrix();
//
//  scale(sz,sz,sz);
//
//  beginShape(QUADS);
//  texture(img2);
//
//  vertex(-1,1,0);
//  vertex(-1,-1,0);
//  vertex(1,-1,00);
//  vertex(1,1,0);
//
//  endShape();
//
//  popMatrix();
// 
//}

void dumpCamProps() {
  println("eyeX="+eyeX+" eyeY="+eyeY+ " eyeZ="+eyeZ);
  println("centerX="+centerX+" centerY="+centerY+ " centerZ="+centerZ);
  println("-----");
}

//camera reference from http://www.openprocessing.org/portal/?userID=4966

