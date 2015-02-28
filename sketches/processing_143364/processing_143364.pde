

//Camera Variables
float x, y, z;
float tx, ty, tz;
float rotX, rotY;
float mX, mY;
float frameCounter;
float xComp, zComp;
float angle;

//Movement Variables
int moveX;
int moveZ;
float vY;
boolean canJump;
boolean moveUP, moveDOWN, moveLEFT, moveRIGHT;


//check input
int m =0;

//Constants
int ground = 0;
int totalBoxes = 100;
int standHeight = 100;
int dragMotionConstant = 10;
int pushMotionConstant = 100;
int movementSpeed = 50;    //Bigger number = slower
float sensitivity = 15;      //Bigger number = slower
int stillBox = 100;        //Center of POV, mouse must be stillBox away from center to move
float camBuffer = 10;
int cameraDistance = 1000;  //distance from camera to camera target in lookmode... 8?

//Options
int lookMode = 8;
int spotLightMode = 4;
int cameraMode = 1;
int moveMode = 2;

void setup() {
  size(800, 600, P3D);
  noStroke(); 
  //dwa(#EDEDE8);

  //Camera Initialization

  //default
  x = -28;
  y = height/2;
  y-= standHeight;
  z = -4830;
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
}


void draw() {
  if (z<-5000)
    z=-5000;

  if (z>9700)
    z=9700;



  //println(x,y,z ,mouseX , mouseY ,tx ,ty,tz);
  //update frame
  background(0);
  lights();


  if (m==1)
  {
    //rotateY(0.5);
    fill(#EAFF0F);
    textSize(50);
    text("menu", x-100, y, z+300); 

    // rotateY(0.5);

    //the point
    pushMatrix();     
    fill(#FC1919);
    translate(-28, 300, 4000);
    box(10, 20000, -10);
    popMatrix();   
    //the point
  }



  if (spotLightMode == 0)
    lights();
  else if (spotLightMode == 1)
    spotLight(255, 255, 255, x, y-standHeight, z, tx, ty, tz, PI, 1);
  else if (spotLightMode == 2)
    spotLight(255, 255, 255, x, y-standHeight-200, z, x+100, y+100, z, frameCounter/10, 1);
  else if (spotLightMode == 3)
    spotLight(255, 255, 255, width/2, height/2-1000, 0, width/2, height/2, 0, PI, 1);
  else if (spotLightMode == 4)
  {
    pointLight(255, 255, 255, x, y, z);
  }

  /*
    for(int i=1;i<=7;i++)
   {
   spotLight(255, 255, 255, -28, 2000, -5500+i*1875, 1, 1, 1, 360, 1);
   }*/
  //-5500 9500s



  //back wall
  pushMatrix();     
  fill(255);
  translate(-28, 300, -5500);
  box(15000, 5000, -100);
  popMatrix();
  //back wall

  //fount wall
  pushMatrix();     
  fill(255);
  translate(-28, 300, 10500);
  box(15000, 5000, -100);
  popMatrix();
  //fount wall


  //L1
  bookshielf(800, -4000, 7, 1);
  bookshielf(1000, -4000, 7, 1);
  bookshielf(1200, -4000, 7, 1);
  bookshielf(1400, -4000, 7, 1);


  bookshielf(800, -3885, 7, 2);
  bookshielf(1000, -3885, 7, 2);
  bookshielf(1200, -3885, 7, 2);
  bookshielf(1400, -3885, 7, 2);
  //L1

 

 

  cameraUpdate();
  locationUpdate();
  jumpManager(10);



  //Camera Mode 1 - Original
  if (cameraMode == 1)
    camera(x, y, z, tx, ty, tz, 0, 1, 0);

  //Camera Mode 2 - Matrix'd
  /* if(cameraMode == 2){
   beginCamera();
   camera();
   translate(x,y,z);
   translate(0,2*-standHeight,0);
   
   rotateX(rotY/100.0); //This seems to work o.o
   rotateY(-rotX/100.0);
   //rotateX(rotX/100.0);
   endCamera();
   }*/

  //frameCounter++;
}


void cylinder(float w, float h, int sides)
{
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];
  translate(0, 100, -500);
  //get the x and z position on a circle for all the sides
  for (int i=0; i < x.length; i++) {
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * w;
    z[i] = cos(angle) * w;
  }

  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN);

  vertex(0, -h/2, 0);

  for (int i=0; i < x.length; i++) {
    vertex(x[i], -h/2, z[i]);
  }

  endShape();

  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 

  for (int i=0; i < x.length; i++) {
    vertex(x[i], -h/2, z[i]);
    vertex(x[i], h/2, z[i]);
  }

  endShape();

  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN); 

  vertex(0, h/2, 0);

  for (int i=0; i < x.length; i++) {
    vertex(x[i], h/2, z[i]);
  }

  endShape();
}

public void bookshielf(int thex, int thez, int theheight, int therotate)
{
  fill(#938056);

  if (theheight==7)
  {
    if (therotate==1)
    {
      //left
      pushMatrix();
      translate(thex, 0, thez);
      box(20, 500, -100);
      popMatrix();

      //right
      pushMatrix();
      translate(thex-200, 0, thez);
      box(20, 500, -100);
      popMatrix();

      //back
      pushMatrix();     
      translate(thex-100, 0, thez+40);
      box(220, 500, -30);
      popMatrix();

      //middle side
      for (int i=1;i<7;i++)
      {
        pushMatrix();     
        translate(thex-100, -250+71.5*i, thez-10);
        box(220, 5, -100);
        popMatrix();
      }

      //top
      pushMatrix();     
      translate(thex-100, 250, thez);
      box(220, 10, -100);
      popMatrix();

      //block
      pushMatrix();     
      translate(thex-100, -250, thez);
      box(220, 10, -100);
      popMatrix();
    }

    if (therotate==2)
    {
      //left
      pushMatrix();
      translate(thex, 0, thez);
      box(20, 500, -100);
      popMatrix();

      //right
      pushMatrix();
      translate(thex-200, 0, thez);
      box(20, 500, -100);
      popMatrix();

      //back
      pushMatrix();     
      translate(thex-100, 0, thez-40);
      box(220, 500, -30);
      popMatrix();

      //middle side
      for (int i=1;i<7;i++)
      {
        pushMatrix();     
        translate(thex-100, -250+71.5*i, thez+10);
        box(220, 5, -100);
        popMatrix();
      }

      //top
      pushMatrix();     
      translate(thex-100, 250, thez);
      box(220, 10, -100);
      popMatrix();

      //block
      pushMatrix();     
      translate(thex-100, -250, thez);
      box(220, 10, -100);
      popMatrix();
    }
  }
}



public void cameraUpdate() {
  ty=constrain(dragMotionConstant, -100000, 500000);
  //Drag-motion
  if (lookMode == 1) {
    if (pmouseX > mouseX)
      tx += dragMotionConstant;
    else if (pmouseX < mouseX)
      tx -= dragMotionConstant; 
    if (pmouseY > mouseY)
      ty -= dragMotionConstant/1.5;
    else if (pmouseY < mouseY)
      ty += dragMotionConstant/1.5;
  }


  //Push-motion
  else if (lookMode == 2) {
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
  else if (lookMode == 3) {
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;

    if (abs(diffX) > pushMotionConstant)
      tx += diffX/25;
    if (abs(diffY) > pushMotionConstant)
      ty += diffY/25;
  }

  //Push Motion V3 (For Camera-Mode 2)
  else if (lookMode == 4) {
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;
    //println(diffX);
    if (abs(diffX) > pushMotionConstant)
      rotX += diffX/100;
    if (abs(diffY) > pushMotionConstant)
      rotY += diffY/100;//diffY/100;
  }

  //Push Motion V4.1 (Because it crashed and I lost V4.0 T.T
  //Designed to work in cohesion with movement mode 2
  else if (lookMode == 5) {
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;

    if (abs(diffX) > stillBox) {
      xComp = tx - x;
      zComp = tz - z;
      angle = degrees(atan(xComp/zComp));

      //---------DEBUG STUFF GOES HERE----------
      //println("tx:    " + tx);
      //println("tz:    " + tz);
      // println("xC:    " + xComp);
      // println("zC:    " + zComp);
      // println("Angle: " +angle);
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
  else if (lookMode == 6) {
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;

    if (abs(diffX) > stillBox) {
      xComp = tx - x;
      zComp = tz - z;
      angle = correctAngle(xComp, zComp);

      //---------DEBUG STUFF GOES HERE----------
      // println("tx:    " + tx);
      // println("tz:    " + tz);
      // println("xC:    " + xComp);
      /// println("zC:    " + zComp);
      /// println("Angle: " +angle);
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
  else if (lookMode == 7) {
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;

    if (abs(diffX) > stillBox) {
      xComp = tx - x;
      zComp = tz - z;
      angle = correctAngle(xComp, zComp);

      //---------DEBUG STUFF GOES HERE----------
      // println("tx:    " + tx);
      // println("tz:    " + tz);
      // println("xC:    " + xComp);
      // println("zC:    " + zComp);
      // println("Angle: " +angle);
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

  else if (lookMode == 8) {
    int diffX = mouseX - width/2;
    int diffY = mouseY - width/2;

    if (abs(diffX) > stillBox) {
      xComp = tx - x;
      zComp = tz - z;
      angle = correctAngle(xComp, zComp);

      angle+= diffX/(sensitivity*10);

      if (angle < 0)
        angle += 360;
      else if (angle >= 360)
        angle -= 360;

      float newXComp = cameraDistance * sin(radians(angle));
      float newZComp = cameraDistance * cos(radians(angle));

      tx = newXComp + x;
      tz = -newZComp + z;

      //---------DEBUG STUFF GOES HERE----------
      /*println("tx:    " + tx);
       println("tz:    " + tz);
       println("xC:    " + xComp);
       println("NewXC: " + newXComp);
       println("zC:    " + zComp);
       println("NewZC: " + newZComp);
       println("Angle: " +angle);*/
      //--------------------------------------*/
    }

    if (abs(diffY) > stillBox)
      ty += diffY/(sensitivity/1.5);
  }
}

public void locationUpdate() {

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
  if (moveMode == 1) {
    z += moveZ;
    tz += moveZ;
    x += moveX;
    tx += moveX;
  }
  else if (moveMode == 2) {
    if (moveUP) {
      z += zComp/movementSpeed;
      tz+= zComp/movementSpeed;
      x += xComp/movementSpeed;
      tx+= xComp/movementSpeed;
    }
    else if (moveDOWN) {
      z -= zComp/movementSpeed;
      tz-= zComp/movementSpeed;
      x -= xComp/movementSpeed;
      tx-= xComp/movementSpeed;
    }
    if (moveRIGHT) {
      z += xComp/movementSpeed; 
      tz+= xComp/movementSpeed;
      x -= zComp/movementSpeed;
      tx-= zComp/movementSpeed;
    }
    if (moveLEFT) {
      z -= xComp/movementSpeed; 
      tz-= xComp/movementSpeed;
      x += zComp/movementSpeed;
      tx+= zComp/movementSpeed;
    }
  }
  //New method also uses keyPressed() and keyReleased()
  // Scroll Down!
}

public void jumpManager(int magnitude) {
  /*
  if(keyPressed && key == ' ' && canJump){
   vY -= magnitude;
   if(vY < -20)
   canJump = false;
   }
   else*/  if (y < ground+standHeight)
    vY ++;
  else if (y >= ground+standHeight) {
    vY = 0;
    y = ground + standHeight;
  }

  if ((!canJump) && (!keyPressed)) {
    //println("Jump Reset!");
    canJump = true;
  }

  y += vY;
}





public void keyPressed() {
  if (keyCode == UP || key == 'w') {
    moveZ = -10;
    moveUP = true;
  }

  else if (keyCode == DOWN || key == 's') {
    moveZ = 10;
    moveDOWN = true;
  }

  else if (keyCode == LEFT || key == 'a') {
    moveX = -10;
    moveLEFT = true;
  }

  else if (keyCode == RIGHT || key == 'd') {
    moveX = 10;
    moveRIGHT = true;
  }

  if (key == 'm' && m==1) {

    m=0;
  }
  else if (key == 'm' && m==0) {

    if (key == '1')

    {
    }
    rotateY(180);
    fill(#EAFF0F);
    textSize(50);
    text("menu", x-100, y, z+300); 
    m=1;
  }
}

public void keyReleased() {
  if (keyCode == UP || key == 'w') {
    moveUP = false;
    moveZ = 0;
  }
  else if (keyCode == DOWN || key == 's') {
    moveDOWN = false;
    moveZ = 0;
  }

  else if (keyCode == LEFT || key == 'a') {
    moveLEFT = false;
    moveX = 0;
  }

  else if (keyCode == RIGHT || key == 'd') {
    moveRIGHT = false;
    moveX = 0;
  }
}

void mousePressed()
{
}




public float correctAngle(float xc, float zc) {
  float newAngle = -degrees(atan(xc/zc));
  if (xComp > 0 && zComp > 0)
    newAngle = (90 + newAngle)+90;
  else if (xComp < 0 && zComp > 0)
    newAngle = newAngle + 180;
  else if (xComp < 0 && zComp < 0)
    newAngle = (90+ newAngle) + 270;
  return newAngle;
}

