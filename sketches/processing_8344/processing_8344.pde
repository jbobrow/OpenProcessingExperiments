
/**
 * Simple program that uses the Shape3D library to create a Bezier
 * line in 3D space.
 * 
 * It demonstrates the use of the setWorldPos() method in the
 * Tube class to create a 'line' in 3D space in the same way
 * the line() method does in 2D.
 * This modification was suggest by Chrisir.
 * 
 * Click the mouse to get another random Bezier curve
 * 
 * Also requires PeasyCam library.
 * 
 * created by Peter Lager
 */

boolean useMouse = true; 
//import hypermedia.video.*;
//OpenCV opencv;


color controlColor = color(255);

boolean roofOn=true;


import damkjer.ocd.*;
import shapes3d.utils.*;
import shapes3d.*;

import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

import processing.opengl.*;
Camera camera1;

int step=1;
PeasyCam pcam;
int endPoint;
int nbrLengths = 70;
int bezColor;

PVector[] testPoints = new PVector[60+1];

int scalar = 3;
Tube[] tubes = new Tube[nbrLengths];
Tube[] tubes2 = new Tube[nbrLengths];
Tube[] fork1 = new Tube[nbrLengths];
Tube[] fork2 = new Tube[nbrLengths];
PVector[] fPoints1 = new PVector[nbrLengths + 1];
PVector[] fPoints2 = new PVector[nbrLengths + 1];
PVector[] cameraTrack;
Ellipsoid[] connections = new Ellipsoid[nbrLengths + 1];
PVector[] points = new PVector[nbrLengths + 1];
PVector[] points2 = new PVector[nbrLengths + 1];
float x,y,z;
float tubeRad = 2.0f;
int strokeCol;

int tubeLength=200;


int count=1;
int turns=0;
Toroid t = new Toroid(this,5, 10);





Box b1 = new Box(this, 20);
Box b2 = new Box(this, 20);
Box b3 = new Box(this, 20);

Box p1 = new Box (this, 20);
Box p2 = new Box (this, 20);


Fork main;
Fork left;
Fork right;
Fork left1;
Fork left2;
Fork right1;
Fork right2;
Fork temp;
int scale=100;

PVector startVector = new PVector(0,0,0);



int speed=10;
PVector[] cameraPoints = new PVector[speed];

int cameraCount=0;



//  float x1 = 0;
//  float y1 = 0;

//  
//float  x2 = scale*3*cos(PI/6)/2;
//float y2 = scale*(1+sin(PI/3)/2+sin(PI/6));
float x1 = 0;
float y1 = 0;
//float x2 = 0; //uses lerp
//float y2 = scale*(1+.5*sin(PI/6)); //uses lerp


float x2 = scale*3*cos(PI/6)/2;  ///using bezier curve
float y2 = scale*(1+sin(PI/3)/2+sin(PI/6));///using bezier curve




PVector cameraStart = new PVector(x1,y1, 0);
PVector cameraEnd = new PVector(x2,y2, 0);
//PVector cameraControlPoint = new PVector(cameraStart.x, scale, 0);
PVector cameraControlPoint = new PVector(x1, scale, 0);

boolean reset = false;

float theta = 0;

boolean shouldRotate = false;

int translateX=0;

PVector direction = new PVector (0,1,0);

PVector nextCamera;

float travelDistance=0;

float tempTheta=0;

float forkLength = (1-sin(PI/3)/2+1);

int numPasses=0;

PVector cameraPosition;

float mazeTheta;

boolean cameraOff = true;


int pathSlices = 50;
PVector[] path1 = new PVector[pathSlices+1];
PVector[] path2 = new PVector[pathSlices+1];
Tube[] pathTube1 = new Tube[pathSlices];
Tube[] pathTube2 = new Tube[pathSlices];

int loopCount=0;

boolean inTube=false;


int orient=0;
PImage a = loadImage("texture1.png");

float xoff = 0.0;
float yoff = 0.0;









void setup()
{
  size(1024,768, OPENGL);
  //pcam = new PeasyCam(this, 0, 0, 0, 220);
  //makeBezierTube();
  
  
  
  makeNewTube();
  makeNewTube2();
  makePaths();
  
  
  
  camera1 = new Camera(this, 100, -125, 150);
  //cameraTrack = points;
  cameraTrack = testPoints;
  main = new Fork(startVector, 0);
  
    camera1.jump(0, -scale*forkLength, 0);
  camera1.aim(0, 5, 0);

  nextCamera = PVector.add (direction, new PVector( camera1.position()[0], camera1.position()[1], 0));
  
  //opencv = new OpenCV( this );
    //opencv.capture( 640, 480 );

}

//void makeConnector(){
// 
// 
// Tube tube1 = new Tube(this, 1, 4);
// Tube tube2 = new Tube(this, 1, 4);
// Tube tube3 = new Tube(this, 1, 4);
// bezColor = color(255);
// tube1.fill(color(0,0,255));
// tube2.fill(color(255,0,0));
// tube3.fill(color(0,255,0));
//
// PVector start = new PVector(0,0,0);
// PVector end1 = new PVector(80,80,0);
// PVector end2 = new PVector(-80, 80, 0);
// PVector end3 = new PVector( 0, -80, 0);
// tube1.setWorldPos(start, end1);
// tube2.setWorldPos(start, end2);
// tube3.setWorldPos(start, end3);
//
// tube1.setSize(10, 10, 10, 10, 80);
// tube2.setSize(10, 10, 10, 10, 80);
// tube3.setSize(10, 10, 10, 10, 80);
// tube1.rotateTo(0,0,65);
// tube1.draw();
// tube2.draw();
// tube3.draw();
//  
//}



void draw(){
  
  
  
   //background(192);
/*
    opencv.read();           // grab frame from camera
    opencv.threshold(130);    // set black & white threshold 

    // find blobs
    Blob[] blobs = opencv.blobs( 10, width*height/2, 100, true, OpenCV.MAX_VERTICES*4 );
    
    
    if(blobs[0].centroid.x <width/2)
    {
      orient = 0;
    }
    else
    {
      orient = 1;
    }
  
  */
  if(useMouse)
  {
    
    
    
     if(mouseX-width/2 < 0)
    {
     
     orient = 0;
    
    }
   
   else{
    
    orient = 1;
   
   } 
    
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
Ellipsoid e = new Ellipsoid (this, 15,15);


  //background(204);
  //lights();


  //t.setRadius(5,5,20);
  //rotateY(PI/3);
  //box(50);

  background(32);
  ambientLight(200,200,200);
  directionalLight(50, 50, 50, 1, 1, 1);

//  //PVector mouseDir = new PVector(mouseX-width/2, 45, mouseY-height/2);
//  int tempPan = mouseX-width/2;
//  int tempPan2 = mouseY-height/2;
//  PVector mouseDir = new PVector(0,10,0);
//  stroke(5);
//  line(0,0,0,mouseDir.x, mouseDir.y, mouseDir.z);
//  makeConnector(mouseDir,new PVector(0,0,0));
//  pushMatrix();
//  translate(50,87);
//  rotate(-PI/12);
//  makeConnector(new PVector(1,1,0), new PVector(1+sin(PI/3)+sin(PI/6),0));
//  // makeConnector(new PVector(1,sin(PI/3),0), new PVector(1+sin(PI/3)+sin(PI/6),0));
//  //makeConnector(0,1+sin(PI/3)+sin(PI/6),0);
//  rotate(PI/3);
//  translate(50,87);
//  makeConnector(new PVector(0,0,0), new PVector(1+sin(PI/3)+sin(PI/6),0));
//
//
//  translate(-100,174);
//  rotate(PI);
//  makeConnector(new PVector(0,0,0), new PVector(1+sin(PI/3)+sin(PI/6),0));
//
//
//  popMatrix();
//  pushMatrix();
//  translate(-50,87);
//  rotate(PI/3);
//  makeConnector(new PVector(0,0,0), new PVector(1+sin(PI/3)+sin(PI/6),0));
//  rotate(-PI/3);
//  translate(-50,87);
//  makeConnector(new PVector(0,0,0), new PVector(1+sin(PI/3)+sin(PI/6),0));
//
//
//
//
//  popMatrix();

  //scale(45);
  //Fork f = new Fork(new PVector(0,0,50), PI/6);
   //main = f;
   
   
   
   

      
   
 //main = new Fork(startVector, 0);
   
   

//float y2=scale*(1+.5);

  //cameraStart = 

  for(int i=0; i<speed; i++)
  {
    
    float x;
    float y;
    /////makes bezier points to fork
        //x = bezierPoint(0, 0, 0, scale*sin(PI/6)/2, i / (float)speed );
        
        
        
        
//        x = bezierPoint(cameraStart.x, cameraControlPoint.x, cameraControlPoint.x, cameraEnd.x, i / (float)speed );
//        
//    //y = bezierPoint(points[0].y, cp1.y, cp2.y, points[points.length - 1].y, t * deltaT);
//   y = bezierPoint(cameraStart.y, cameraControlPoint.y, cameraControlPoint.y, cameraEnd.y, i / (float)speed );
    
    
      x = lerp(cameraStart.x, cameraEnd.x, i/(float)speed);
      y = lerp(cameraStart.y, cameraEnd.y, i/(float)speed);
      //println(y);
      //point(x, y);
      
      
  
  if(i%5==0)
  {
    
      pushMatrix();
      translate(x,y,0);
      //sphere(1);
      popMatrix();
  }
      cameraPoints[i] = new PVector(x, y, 0);
  
  }


//  camera1.jump(cameraPoints[cameraCount].x, cameraPoints[cameraCount].y, 0);
//camera1.aim(cameraPoints[cameraCount+1].x, cameraPoints[cameraCount+1].y, .1);
  //camera1.aim(0, cameraPoints[cameraCount+1].y, .1*(mouseX-width/2));
  
  
  translateX ++;
  if(translateX > scale)
{
  
  //rotateZ(PI / 3);

}
//translate(0,-translateX,0);

  
  pushMatrix();




//translate(0,scale);
//sphere(2);

//println(camera1.position()[1]);
//camera1.truck(-2);

//sphere(2);

//translate(camera1.position()[0], camera1.position()[1]);


popMatrix();

//shouldRotate = false;

//if( (camera1.position()[1] > scale ) && ( camera1.position()[1] < (scale*(1+sin(PI/3)/2))  )   ) // && camera1.position()[1] < (scale*(1+sin(PI/3)/2))
if( travelDistance >= scale*(1+forkLength*2) )
//if( travelDistance >= scale*1.3)
{

    //shouldRotate = true;
    


}


if(shouldRotate)
{
 
 //float increment = (PI/3) / (scale*sin(PI/3)/2);
 if(tempTheta == 0)
 {
   
   camera1.roll(PI/2);
   
 }
  float increment = PI / 100;
  tempTheta = tempTheta + increment;
//rotateZ(theta);
//theta = theta + tempTheta;
changeAngle(theta+tempTheta);
println("changing angle");
//theta= theta + increment ;


if(tempTheta >= PI/3)
{
  theta = theta+tempTheta;
  tempTheta = 0;
  shouldRotate = false;
  travelDistance = 0;
  numPasses++;
  //
}



}


//calculate nextCamera



  direction.normalize();
  direction.mult(scalar);

if(!shouldRotate)
{
  //camera1.dolly(-1);
  camera1.jump(nextCamera.x, nextCamera.y, nextCamera.z);
  //travelDistance = travelDistance + direction.mag();
  travelDistance = travelDistance + scalar;
  //println(travelDistance);

}

  //changeAngle(theta);
//changeAngle(PI/1000);

  direction.normalize();
  direction.mult(2);
  nextCamera = PVector.add (direction, new PVector( camera1.position()[0], camera1.position()[1], 0));
  camera1.aim(nextCamera.x, nextCamera.y, .001);

//camera1.look(PI/60,PI/6);

//pcam.rotateY(PI/15);
 //pcam.pan(0, 3);
 //pcam.lookAt(0,3,0);
  //println(.1*(mouseX-width/2));
//  camera1.aim(0,cameraPoints[cameraCount].y+1,0);
//for(int i=0;
  
  //rotateX(PI/2);
  
  
  pushMatrix();
  
  translate(cameraPoints[cameraCount].x, cameraPoints[cameraCount].y, 0);
  //sphere(2);
  popMatrix();
  
  
    pushMatrix();
  translate(0,scale*(1+.5*sin(PI/6)), 10);
  //sphere(2);
  popMatrix();
  
  
  cameraCount++;
  //println(cameraCount);
  if(cameraCount>=speed-1)
  {
    cameraCount=0;
    
    if(!reset)
    {
    cameraStart = cameraEnd;
    
    cameraEnd = new PVector(scale*3*cos(PI/6)/2, scale*(1+sin(PI/3)/2+sin(PI/6)));///using bezier curve
    //camera1.roll(PI/2);
    
    }
    if(reset)
    {
      
      cameraEnd = cameraStart;
      cameraStart = new PVector (0,0);
      //camera1.roll(-PI/2);
    }
      
    //reset = !reset;
    
  }
   
   cameraPosition = new PVector (camera1.position()[0], camera1.position()[1], 0);
   
   
   
        if(keyPressed && key == 't')
               {
                 //startVector = new PVector(left2.exit1.x, left2.exit1.y, left2.exit1.z); ;
                 //main = temp;
                 main = new Fork(main.exit1, temp.rot);
                 //println("doin it");
                 
           }
        if(keyPressed && key == 'o')
        {
          main = new Fork(cameraPosition, theta);
          println(theta);
          mazeTheta = theta;
          main.display();
          
        }
          
  
  if(numPasses == 2 && travelDistance >= scale*forkLength)
  {
    
    //translate(camera1.position()[0], camera1.position()[1],0);
    //startVector = new PVector (camera1.position()[0], camera1.position()[1], 0);
    cameraPosition = new PVector (camera1.position()[0], camera1.position()[1], 0);
    main = new Fork(cameraPosition, theta);
    println("translating");
    //rotateZ(theta);
    numPasses = 0;
    mazeTheta = theta;
    
    
  }
  
  //buildMaze();
  
  main.display();
  
  
  
 
  
  
  //main = left2;
  
  //  //bezier(0,0, 0,30, 0,30,50,87);
  //  fill(255);
  //int steps = 10;
  //for (int i = 0; i <= steps; i++) {
  //  float t = i / float(steps);
  //  float x = bezierPoint(85, 10, 90, 15, t);
  //  float y = bezierPoint(20, 10, 90, 80, t);
  //  ellipse(x, y, 5, 5);
  //}
  //  




  //testPoints[
  //  for(int i=0;i<testPoints.length;i++)
  //  {
  //    testPoints[i] = new PVector(lerp(0,50, 
  //  
  //  
  //  


  //b1.fill(color(255,0,0));

  /*

  b1.setSize(10,10,40);
  b1.worldOrientation(new PVector(0,0,0), new PVector(0,0,2));

  b1.visible(false, 1);
  b1.visible(false, 3);
  b1.moveBy(0,0,20);
  //b1.draw();



  b2.setSize(10,10,40);


  //b2.moveBy(0,0,20);
  b2.worldOrientation(new PVector(0,0,0), new PVector(0,0,-22));
  b2.rotateBy(120,0,0);
  b2.visible(false, 1);
  b2.visible(false, 3);
  //b2.draw();



  b3.setSize(10,10,40);
  b3.rotateBy(240,0,0);
  //b3.worldOrientation(new PVector(20,0,0), new PVector(20,0,0));

  b3.worldOrientation(new PVector(0,0,0), new PVector(0,0,25));
  b3.rotateBy(120,0,0);
  b3.visible(false, 1);
  b3.visible(false, 3);
  //b3.draw();


  p1.setSize(2,10,10);
  p1.moveBy(6,0,0);
  //p1.draw();


  p2.setSize(2,10,10);
  p2.moveBy(-6,0,0);
  //p2.draw();


  for(int i = 0; i < tubes.length; i++){
    //tubes[i].draw();
  } 
  //for(int i=count; i<count+5 || i<tubes.length; i++)
  //{
  //tubes[i].draw();
  //}

  if(count<tubes.length+5)
  {
    for(int i=count; i<count+4;i++)
    {
      //tubes[i].draw();
    }
  }
  for(int i = 0; i < fork1.length; i++){
    //fork1[i].draw();
  } 

  for(int i = 0; i < fork2.length; i++){
    //fork2[i].draw();
  } 


  //t.draw();
  //for(int i = 0; i < connections.length; i++){
  //connections[i].draw();
  //}

*/

if(!inTube)
{
  
  
    for(int i = 0; i < tubes.length; i++){
      if(i%3==0)
      {
      tubes[i].draw();
      }
  } 
  
      for(int i = 0; i < tubes2.length; i++){
          if(i%3==0)
      {
      tubes2[i].draw();
      }
  } 
  
}
  
else if(orient == 0 )
{

  for(int i = 0; i < tubes.length; i++){
          if(i%3==0)
      {
      tubes[i].draw();
      }
  } 
}
 
else if(orient == 1)
{
  
    for(int i = 0; i < tubes2.length; i++){
          if(i%3==0)
      {
      tubes2[i].draw();
      }
    
  } 
}



    
    for(int i = 0; i < pathTube2.length; i++){
      
      pushMatrix();
      translate(path1[i].x, path1[i].y);
      //sphere(2);
      popMatrix();
    //pathTube2[i].draw();
    
  } 
  
      for(int i = 0; i < pathTube1.length; i++){
        
        pushMatrix();
      translate(path2[i].x, path2[i].y);
      //sphere(2);
      popMatrix();
      
    //pathTube1[i].draw();
    
  } 
  
  moveCamera();
 

  //////////////////////////////////////WORLDX / WORLDY ///////////////////////////////////////

  //   camera1.jump(cameraTrack[count].x, cameraTrack[count].y, cameraTrack[count].z+mouseX);
  //camera1.jump(testPoints[count].x, testPoints[count].y, 0+mouseX);
  //camera1.jump(0,0,0);
  //camera1.aim(0,0,mouseX-width/2);
  //camera1.track(5,5);

  //camera1.jump(cameraTrack[count].x, cameraTrack[count].y, cameraTrack[count].z+mouseX);

  //camera1.aim(cameraTrack[count+1].x, cameraTrack[count+1].y, cameraTrack[count+1].z);
  //camera1.dolly(4);




  //e.setSize(3,3,3);


  float[] position = camera1.position();

  //cameraPosition.x = position[0];
  //cameraPosition.y = position[1];
  //cameraPosition.z = position[2];

  //PVector cameraPosition = new PVector(position[0], position[1], position[2] );


  //e.worldOrientation(cameraTrack[count], cameraTrack[count]);
  //e.draw();


  //println(count);





  //count++;
  //turns++;
  //if(turns%1==0)
  //{
  count=count+step;
  //}

  //  if(cameraTrack.equals(points))
  //  {
  //    
  //    if(count+1>endPoint)
  //    {
  //      //println("yes");
  //      count=15;
  //      if(random(2)>.5)
  //      {
  //      cameraTrack = fPoints1;
  //      }
  //      else {
  //        
  //        cameraTrack = fPoints2;
  //      }
  //    
  //  }
  //    
  //  }

  //  if(!cameraTrack.equals(points))
  //  {
  //    
  //    if(count+1>=fPoints1.length)
  //  {
  //    
  //      cameraTrack = points;
  //      count=0;
  //    }
  //    
  //    
  //  }

  if(count+1>=testPoints.length-1)
  {
    count=0;
  }

  camera1.feed();


}

public void mouseClicked(){
  //makeBezierTube();
  
}


void mouseMoved() {
  //camera1.zoom(radians(mouseY - pmouseY) / 2.0);

}

int choose()
{
  
  
 return  (int)random(2);
  
}

void keyPressed(){
  
 if(key == 'b')
{
  
  println(choose());

}
  
  if(key == 'v')
  {
    //translate(0,0,40);
    //println("doing it");
    //startVector = new PVector(left2.exit1.x, left2.exit1.y, left2.exit1.z);
  }
  
  
  if(key == 'r')
  {
    camera1.jump(0,0,0);
    pcam.reset(); 
   nextCamera = new PVector (0,0,0);
}


if( key == 'i')
{
  
  theta = theta + PI/30;
}

if( key == 'k')
{
  
  theta = theta - PI/30;
  
}

if ( key == 'c' )
{
  
  changeAngle(PI/6);
}
  
}


void changeAngle(float r)
{
  
  direction = new PVector (sin(r), cos(r));
  direction.normalize();
  
}

void nudgeAngle(float r)
{
  
  direction = new PVector (sin(r), cos(r));
  direction.normalize();
  
}


