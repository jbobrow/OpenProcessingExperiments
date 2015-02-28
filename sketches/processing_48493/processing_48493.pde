
//Nathan Trevino  
//December 2011
// for Jim Roberts.
// Description:
//    This code took me A LOT of learning. I went onto the processing API, browsed the OpenProcessing site
//    through classrooms and collections to help me find what people before me had done. 
//    Overall the code is very complex and took me quite a bit of time to create. While I do understand
//    how everything works in this code, I do not know how it would react outside of this particular
//    program and build because I specially learned all of this just for this piece. 
// Special Thanks to OpenProcessing examples such as Ryan D's Moving Camera,and his Moving Boxes 3D 2; they really helped
//             me to get on track. I had all of the code for it but his code helped me to know where to go. also he had a 
//             really great idea for a "floor" (which I totaly stole because it is a great way to trace motion)
//             and very good varriable names that helped me classify all of mine. Thanks again Ryan!
//                               
//
//                                      Also Thanks to:
//                        Julio E. P. K.'s Relative movementwith uniform rotation 3D;
//                               Marc Fleming's SOM EMBEDDED IN 3D SPACE;
//                              and cyphunk's Accelerometer 3d visualization;




//And finally here is the code. it is an initializaion of a 3D environment in 3D space.

int Wd = 600;
int Ht = 600;
int boxsize;

//Camera Variables.
float camEyeX, camEyeY, camEyeZ;
//float camEyeXChange, camEyeYChange, camEyeZChange; // delta's of the motion? to check for debug//
float rotationX, rotationY;
float camCenterX, camCenterY, camCenterZ;
float camUpX, camUpY, camUpZ;
float frameKeeper;
float xDifference, zDifference;
float myAngle;

//Movement Variables
float deltaX, deltaY;
float walkX, walkY, walkZ;
float variableY;
boolean moveUP, moveDOWN, moveLEFT, moveRIGHT;


//constants for the boxes.
int totalBoxes = 50;

int headHeight = 100; //tallness
int dragMotion= 10; //moving the screen across 
int pushMotion = 100; //moving the screen back across and forward
int velocity = 50;     // speed of movement
int blocky = 10; //??// i dont know if i need this. its for the edges of the screen?
float touch = 15;  //higher number slows movement of cam/body
int POVcenter = 100;  //this is the center of the point of view. the mouse must be this far away from the center to move
float cameraTotalDistance = 1000; // in final look mode it should use this.
//EDIT: in Ryan D's code this is right! i was right! fuck yes!

//modes..
int lookMode = 8; //running through different perspectives of looking.
int cameraMode = 1; // running through different camera angles
int moveMode = 2; // running through the different movement vectors.




void setup()
{
  size(600, 600, P3D);
  background(255);

  // camera stuff
  camEyeX = width/2;
  camEyeY = height/2; 
  camEyeZ = (height/2.0) / tan(PI*60 /360);
  camCenterX = width/2; 
  camCenterY = height/2;
  camCenterZ = 0;
  camUpX = 0;
  camUpY = 1.0;
  camUpZ = 0;

  //"movement" of cam and body together
  rotationX = 0;
  rotationY = 0;
  myAngle = 0;


  // moving deltas and constants
  deltaX = 0;
  deltaY = 0;
  moveUP = false;
  moveDOWN = false;
  moveLEFT = false;
  moveRIGHT = false;
  walkX = 0;
  walkY = 0;
  walkZ = 0;
}


void draw()
{
  background(255);


  // here I isolate the drawn image so that anything that I do that may 'damage' the 
  // placement of the objects in space does not hurt them.

  environment();
  camerapoop();
  movements();



  //setup the camera and camera modes.
  if (cameraMode == 1)
    camera(camEyeX, camEyeY, camEyeZ, camCenterX, camCenterY, camCenterZ, 0, 1, 0);

  if (cameraMode == 2)
  { 
    beginCamera();
    camera();
    translate(camEyeX, camEyeY, camEyeZ);
    translate(0, 2*-headHeight, 0);

    rotateX(rotationY/100);
    rotateY(-rotationX/100);
    endCamera();
  }





  frameKeeper++;
}



void environment()
{
  fill(255, 130, 70, 100);
  stroke(150);
  pushMatrix();
  translate(walkY, walkZ, walkX);
  pushMatrix();
  translate(0, 0, -200);
  box(100);
  translate(0, -150, 0);
  sphere(100);
  translate(0, 150, -300);
  box(100);
  translate(0, -150, 0);
  sphere(100);


  popMatrix();
  popMatrix();




  //Draw boxes on the floor.
  for (int x1 = 0; x1 < totalBoxes; x1+= 3) {
    for (int z1 = 0; z1 < totalBoxes; z1+= 3) {
      pushMatrix();
      translate(width/2+x1*100-(totalBoxes*100/2), height/2, z1*100-(totalBoxes*100/2));
      fill(255, 130, 70, 100);
      box(90); 
      popMatrix();
    }
  }
}


//this is the camera function. Bascially all of the magic happens here.
// we are able to replicate the movement of the human head and the illusion of looking 

//new to me. The public (fill in the blank) (){} call makes everything inside of camerapoop accessable to everything
//else in the rest of the code.


public void camerapoop()
{
  //my old mode.
  //  camCenterX += deltaX;
  //  camCenterY += deltaY;
  //
  //
  //  camera (camEyeX, camEyeY, camEyeZ, camCenterX, camCenterY, camCenterZ, 
  //  camUpX, camUpY, camUpZ);
  //  

  //Drag-motion

  // here we are adjusting the camera's center of view as we look around. so fun!
  if (lookMode == 1) {
    if (pmouseX > mouseX)
      camCenterX += dragMotion;
    else if (pmouseX < mouseX)
      camCenterX -= dragMotion;
    if (pmouseY > mouseY)
      camCenterY -= dragMotion/1.5;
    else if (pmouseY < mouseY)
      camCenterY += dragMotion/1.5;
  }

  //drag-motion number 1.5???
  // EDIT: this is from's Ryan's code and I am truely just beginning to understand it's applications.

  // EDIT2: never mind. I got it. this is for the other direction... opposite of what is above. 
  // Why did he not write it together?
  // oh well... whatever works for him is good.
  else if (lookMode == 2) {
    if (mouseX > (width/2+pushMotion))
      camCenterX += dragMotion;
    else if (mouseX < (width/2-pushMotion))
      camCenterX -= dragMotion;
    if (mouseY > (height/2+pushMotion))
      camCenterY += dragMotion;
    else if (mouseY < (height/2-pushMotion))
      camCenterY -= dragMotion;
  }

  //push-motion number 2
  else if (lookMode == 3) {
    int Xdifference = mouseX - width/2;
    int Ydifference = mouseY - width/2;

    if (abs(Xdifference) > pushMotion)
      camCenterX += Xdifference/25;
    if (abs(Ydifference) > pushMotion)
      camCenterY += Ydifference/25;
  }

  //push-motion number 2
  else if (lookMode == 4) {
    //have to copy thses in all 
    int Xdifference = mouseX - width/2;
    int Ydifference = mouseY - width/2;

    if (abs(Xdifference) > pushMotion)
      rotationX += Xdifference/100;
    if (abs(Ydifference) > pushMotion)
      rotationY += Ydifference/100;
  }


  else if (lookMode == 5) {
    //gotta copy again. Ask jim why?
    int Xdifference = mouseX - width/2;
    int Ydifference = mouseY - width/2;

    if (abs(Xdifference) > POVcenter) {
      xDifference = camCenterX - camEyeX;
      zDifference = camCenterZ - camEyeZ;
      myAngle = degrees(atan(xDifference/zDifference));

      //confusion has set in. I'm sure i have written the right things but its just so much.....

      //EDIT: Ryan Darge has saved my ass. thank you sir. I know understand what I was doing wrong and can continue.
      //from here on, I am addopting all of Ryan D's varriable names. The structure is mine but I will be tweaking
      //to further resemble the one's I have seen. It helps me and it makes it more cohesive. 
      //-----------------

      if (myAngle < 45 && myAngle > -45 && zDifference < 0)
        camCenterX += Xdifference/touch;
      else if (myAngle < 45 && myAngle > -45 && zDifference > 0)
        camCenterX -= Xdifference/touch;

      //leftarea
      else if (myAngle > 45 && myAngle < 90 && xDifference < 0 && zDifference < 0)
        camCenterZ -= Xdifference/touch;
      else if (myAngle >-90 && myAngle <-45 && xDifference < 0 && zDifference > 0)
        camCenterZ -= Xdifference/touch;

      //rightarea
      else if (myAngle <-45 && myAngle >-90)
        camCenterZ += Xdifference/touch;
      else if (myAngle < 90 && myAngle > 45 && xDifference > 0 && zDifference > 0)
        camCenterZ += Xdifference/touch;
    }

    if (abs(Ydifference) > POVcenter)
      camCenterY += Ydifference/(touch/1.5);
  }

  //This is a correction that Ryan D did... I think I will just leave it? not sure
  //Using a more proper unit circle.
  else if (lookMode == 6) {
    int Xdifference = mouseX - width/2;
    int Ydifference = mouseY - width/2;

    if (abs(Xdifference) > POVcenter) {
      xDifference = camCenterX - camEyeX;
      zDifference = camCenterZ - camEyeZ;
      myAngle = correctionAngle(xDifference, zDifference);


      //Looking forwards
      if ((myAngle >= 0 && myAngle < 45) || (myAngle > 315 && myAngle < 360))
        camCenterX += Xdifference/touch;

      //Looking left
      else if (myAngle > 45 && myAngle < 135)
        camCenterZ += Xdifference/touch;

      //Looking rear
      else if (myAngle > 135 && myAngle < 225)
        camCenterX -= Xdifference/touch;

      //Looking right
      else if (myAngle > 225 && myAngle < 315)
        camCenterZ -= Xdifference/touch;
    }

    if (abs(Ydifference) > POVcenter)
      camCenterY += Ydifference/(touch/1.5);
  }

  //QUOTE FROM RYAN D -- "Lookmode 7, trying to get rid of the slowdown in the corners with a sorta-buffer thing"
  //This is to create a motion with out a death of computer processing all the way to nullset... problems i had at the 
  //beginning.
  else if (lookMode == 7) {

    //new copy
    int Xdifference = mouseX - width/2;
    int Ydifference = mouseY - width/2;

    if (abs(Xdifference) > POVcenter) {
      xDifference = camCenterX - camEyeX;
      zDifference = camCenterZ - camEyeZ;
      myAngle = correctionAngle(xDifference, zDifference);

      //Looking forwards
      if ((myAngle >= 0-blocky && myAngle < 45+blocky) || (myAngle > 315-blocky && myAngle < 360+blocky))
        camCenterX += Xdifference/touch;

      //Looking left
      else if (myAngle > 45-blocky && myAngle < 135+blocky)
        camCenterZ += Xdifference/touch;

      //Looking rear
      else if (myAngle > 135-blocky && myAngle < 225+blocky)
        camCenterX -= Xdifference/touch;

      //Looking right
      else if (myAngle > 225-blocky && myAngle < 315+blocky)
        camCenterZ -= Xdifference/touch;
    }

    if (abs(Ydifference) > POVcenter)
      camCenterY += Ydifference/(touch/1.5);
  }

  else if (lookMode == 8) {
    int Xdifference = mouseX - width/2;
    int Ydifference = mouseY - width/2;

    if (abs(Xdifference) > POVcenter) {
      xDifference = camCenterX - camEyeX;
      zDifference = camCenterZ - camEyeZ;
      myAngle = correctionAngle(xDifference, zDifference);

      myAngle+= Xdifference/(touch*10);

      if (myAngle < 0)
        myAngle += 360;
      else if (myAngle >= 360)
        myAngle -= 360;

      float newXComp = cameraTotalDistance * sin(radians(myAngle));
      float newZComp = cameraTotalDistance * cos(radians(myAngle));

      camCenterX = newXComp + camEyeX;
      camCenterZ = -newZComp + camEyeZ;
    }

    if (abs(Ydifference) > POVcenter)
      camCenterY += Xdifference/(touch/1.5);
  }
}


//now i need to create a correction for the angle as the cam turns in direction. I am using this code frommy original
// and adapting Ryan D's format.

public float correctionAngle (float Kxang, float Kzang)
{
  float myNewAngle = -degrees(atan(Kxang/Kzang));
  if (xDifference > 0 && zDifference > 0)
    myNewAngle = (myNewAngle + 90) +90;
  else if (xDifference < 0 && zDifference > 0)
    myNewAngle = myNewAngle + 180;
  else if (xDifference < 0 && zDifference < 0)
    myNewAngle = (myNewAngle + 90) + 270;
  return myNewAngle;
}





// Here is how we will be moving the 'eyes' and the 'feet'. The camera function
//simulates the eye and head movement of a person very well but the walking must be
// done by cheating. Instead of moving the body of the person interacting, we move the 
// world around them as if they were moving through the environment.


//EDIT: moved lots of this stuff up ^^ to match code I used as an example. now this old and new stuff.

void movements()
{

  //old code. not revised and cut apart to transport most of the other "looking" statements up to publicvoidcamerapoop()
  //
  //  if (keyPressed)
  //  {
  //    if (keyCode == UP) // Look up
  //    {
  //      deltaY -= .5;
  //    }
  //
  //    if (keyCode == DOWN) // Look down
  //
  //    {
  //      deltaY += .5;
  //    }
  //
  //    if (keyCode == LEFT) // Look left
  //    {
  //      deltaX -= .5;
  //    }
  //
  //    if (keyCode == RIGHT) // Look right
  //    {
  //      deltaX += .5;
  //    }
  //
  //
  //
  //    if (key == 'e') // stop and center the 'eye' at eye level.
  //    {
  //      camCenterX = 0; 
  //      camCenterY = 0;
  //      deltaX = 0;
  //      deltaY = 0;
  //    }
  //
  //    if (key == 'w') //move forward. means the objects will move toward you.
  //    {
  //      walkX += 2;
  //    }
  //
  //    if (key == 's') // move backward. means the objects move away from you.
  //    {
  //      walkX -= 2;
  //    }
  //    //    if (key == 'a') //rotate left. means the objects will rotate to the right.
  //    //    {
  //    //      rotBody -= .1;
  //    //    }
  //    //
  //    //    if (key == 'd') // rotate right. means the objects will rotate to the left.
  //    //    {
  //    //      rotBody += .1;
  //    //    }
  //    if (key == 'a') // strafe left
  //    {
  //      walkY -= 2;
  //    }
  //
  //    if (key == 'd') // strafe right
  //    {
  //      walkY += 2;
  //    }
  //    if (key == 'q') // stop the movement of your "eyes"
  //    {
  //      deltaX = 0;
  //      deltaY = 0;
  //      walkX = 0;
  //      walkY = 0;
  //    }
  //
  //    if (key ==' ') // reset everything
  //    {
  //      camEyeX = 0;
  //      camEyeY = 0; 
  //      camEyeZ = 500;
  //      camCenterX = 0; 
  //      camCenterY = 0;
  //      camCenterZ = 0;
  //      camUpX = 0;
  //      camUpY = 1.0;
  //      camUpZ = 0;
  //      deltaX = 0;
  //      deltaY = 0;
  //      walkX = 0;
  //      walkY = 0;
  //    }
  //  }



  //here is where it all started! this is the initial idea of how i could move a camera around in 3d space.
  //check it out. its this first if statement. It is very simple but has huge implications when thought about.

  if (moveMode == 1)
  {
    camEyeZ += walkZ;
    camCenterZ += walkZ;
    camEyeX += walkX;
    camCenterX += walkX;
  }


  else if (moveMode == 2)
  {
    if (moveUP)
    {
      camEyeZ += zDifference/velocity;
      camCenterZ += zDifference/velocity;
      camEyeX += xDifference/velocity;
      camCenterX += xDifference/velocity;
    }
    if (moveDOWN)
    {
      camEyeZ -= zDifference/velocity;
      camCenterZ -= zDifference/velocity;
      camEyeX -= xDifference/velocity;
      camCenterX -= xDifference/velocity;
    }
    if (moveRIGHT)
    {
      camEyeZ += zDifference/velocity;
      camCenterZ += zDifference/velocity;
      camEyeX -= xDifference/velocity;
      camCenterX -= xDifference/velocity;
    }
    if (moveLEFT)
    {
      camEyeZ -= zDifference/velocity;
      camCenterZ -= zDifference/velocity;
      camEyeX += xDifference/velocity;
      camCenterX += xDifference/velocity;
    }
  }
}

public void keyPressed() {
  if (keyCode == UP || key == 'w') {
    walkZ = -10;
    moveUP = true;
  }

  else if (keyCode == DOWN || key == 's') {
    walkZ = 10;
    moveDOWN = true;
  }

  else if (keyCode == LEFT || key == 'a') {
    walkX = -10;
    moveLEFT = true;
  }

  else if (keyCode == RIGHT || key == 'd') {
    walkX = 10;
    moveRIGHT = true;
  }
}

public void keyReleased() {
  if (keyCode == UP || key == 'w') {
    moveUP = false;
    walkZ = 0;
  }
  else if (keyCode == DOWN || key == 's') {
    moveDOWN = false;
    walkZ = 0;
  }

  else if (keyCode == LEFT || key == 'a') {
    moveLEFT = false;
    walkX = 0;
  }

  else if (keyCode == RIGHT || key == 'd') {
    moveRIGHT = false;
    walkX = 0;
  }
}



//possible mouse controls?
//fixed up top^^^^^^^^^^^^^^^^

//  
//  if (mouseX > (height/2 +100))
//  {
//    deltaY += .1;
//    
//  }
//   
//  if (mouseX < (height/2 - 100))
//  {
//    
//     deltaY -= .1;
//  }
//   
//  if (mouseX > (width/2 + 100))
//  {
//    
//    deltaX += .1;
//  }
//   
//  if (mouseX < (width/2 - 100))
//  {
//    deltaX -= .1;
//    
//  }
//  
//  if(mouseX < 400 && mouseX > 200 )
//  {
//    deltaY = 0;
//  }
//  if(mouseY < 400 && mouseY > 200 )
//  {
//    deltaY = 0;
//  }
//  


