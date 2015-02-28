
//Eleni Katrini
//ekatrini@andrew.cmu.edu
//copyright © Eleni Katrini, October 2013
//HW06_3D Initial

float rotX, rotY, rotZ;
float transX, transY, transZ;
float rotDeltaX, rotDeltaY, rotDeltaZ;
float transDeltaX, transDeltaY, transDeltaZ; ////check
float ht, wd, dt; //height - width - depth

void setup()
{
 size(600, 600, OPENGL);
 
 rotX= 0;
 rotY= 0;
 rotZ= 0;
 
 rotDeltaX= 0;
 rotDeltaY= 0;
 rotDeltaZ= 0;
 
 transX= width/2;
 transY= height/2;
 transZ= 0;
 
 transDeltaX=5;
 transDeltaY=5;
 transDeltaZ=5;
 
 wd= width*.38333;
 ht= height*.06666;
 dt= ht;
}

void draw()
{    
  pushMatrix();
    prepWindow(); 
    rotateInitial();
    drawInitial();
  popMatrix();
  
  showStats();  
}

void keyPressed()
{
      if( key == 'x')
      {
       rotDeltaX++;  
      }
 
      else if( key == 'y')
      {
      rotDeltaY++;  
      }
 
      else if( key == 'z')
      {
      rotDeltaZ++;  
      }
      
      else if (key == ' ')
      {
       transX= width/2;
       transY= height/2;
       transZ= 0;
       
       rotDeltaX= 0;
       rotDeltaY= 0;
       rotDeltaZ= 0; 
       
       rotX= 0;
       rotY= 0;
       rotZ= 0; 
      }
      
      else if (key == 'p')
      {
       rotDeltaX= 0;
       rotDeltaY= 0;
       rotDeltaZ= 0; 
      }
}

void mouseDragged()
{
  
      if (mouseButton == LEFT && mouseX > pmouseX)
      {
         transX += transDeltaX;
      }
      if (mouseButton == LEFT && mouseX < pmouseX)
      {
         transX -= transDeltaX;
      }
       if (mouseButton == LEFT && mouseY > pmouseY)
      {
         transY += transDeltaY;
      }
      if (mouseButton == LEFT && mouseY < pmouseY)
      {
         transY -= transDeltaY;
      }
      
      if (mouseButton == RIGHT && mouseY > pmouseY)
      {
         transZ += transDeltaZ;
      }
      if (mouseButton == RIGHT && mouseY < pmouseY)
      {
         transZ -= transDeltaZ;
      }
}


//Lights+WindowFunction
void prepWindow()
{
  background(255, 255, 255); 
  fill(0);
  noStroke();
  //text( "use x, y, z to rotate", width*0.03, height*0.03);
  //xtext( "use p to pause + spacebar to reset", width*0.03, height*0.06);
  ambientLight(247, 190, 0, -5, 100, 50);
  directionalLight(126, 126, 140, 0, 0, -1);
  fill(255, 255, 255);
  stroke(255, 255, 255);
  translate(transX, transY, transZ);
}

//Initial Rotation
void rotateInitial()
{
    rotateX(radians(rotX));
    rotX += rotDeltaX;
    rotateY(radians(rotY));
    rotY += rotDeltaY;
    rotateZ(radians(rotZ));
    rotZ += rotDeltaZ; 
}


//InitialsFunction
void drawInitial()
{
  stroke(255, 255, 255);
  //parallel boxes to xy plane
  pushMatrix();
    translate(0, 0, 0);
    box(wd, ht, dt);
  popMatrix();
  pushMatrix();
    translate(0, -height*0.1667, 0);
    box(wd, ht, dt);
  popMatrix();
  pushMatrix();
    translate(0, height*.1667, 0);
    box(wd, ht, dt);
  popMatrix();
  
  //parallel boxes to yz plane
  pushMatrix();
    translate(-width*0.1667, -height*.25,0);
    box(ht, dt, wd);
  popMatrix();
  pushMatrix();
    translate(-width*0.1667, height*.08334,0);
    box(ht, dt, wd);
  popMatrix();
  pushMatrix();
    translate(-width*.1667, -height*.083334, 0);
    box(ht, dt, wd);
  popMatrix();
}

void showStats()
{
 fill(80, 80, 80);
 noStroke();
 text("RotationX:  " + rotX, width*0.04, height*0.03);
 text("RotationY:  " + rotY, width*0.04, height*0.05); 
 text("RotationZ:  " + rotZ, width*0.04, height*0.07);
 text("TranslationX:  " + transX, width*0.20, height*0.03); 
 text("TranslationY:  " + transY, width*0.20, height*0.05);
 text("TranslationX:  " + transZ, width*0.20, height*0.07); 
}

