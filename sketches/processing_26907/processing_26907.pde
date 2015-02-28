
//Assignment 1 Part B
//rotating iris
//lucy processing
//"Better the devil you know"

//This piece is a continuation of Part A which displays an external transformation.
//In this piece is entitled "Better the devil you know" and this time explores an internal transformation;
//one from good to evil, or in star wars language turning to the darkside. This is explored through
//the use of rotating iris' which show the gradual change from good to evil. It is thought that everyone 
//has an evil side, whether it be big or small, so you may stop the cycle of rotation on a certain stage 
//and display that amount of evil.BWAHAHAHAA!!!!

//Code for the rotation sourced from http://www.openprocessing.org/visuals/?visualID=7943, in which 
//a ballerina transforms into a flower with a movement of the mouse



PImage eyeEvil1;//change each of these for the new images i created in photoshop
PImage eyeEvil2;
PImage eyeEvil3;
PImage eyeEvil4;
PImage eyebackgroundflip;


void setup(){
  size(600,600);
  frameRate (50);
  smooth();
  
  eyeEvil1 = loadImage("eyeEvil1.gif");//these are gif so the background can be transparent
  eyeEvil2 = loadImage("eyeEvil2.gif");
  eyeEvil3 = loadImage("eyeEvil3.gif");
  eyeEvil4 = loadImage("eyeEvil4.gif");
  eyebackgroundflip = loadImage("eyebackgroundflip.gif");//my flipped background for the right side of the face
  
}
  
void draw(){
  
  float mX = mouseX;
  float mY = mouseY;
  background(255);
   
  ////////////////////////
   //Iris one
  pushMatrix();//once again using the code from "Transform"the ballerina/flower
  float angle =(atan2(mY-width/2,mX-height/2))
  -HALF_PI;
  translate(width/2,height/2);
  rotate(angle);
  translate(eyeEvil1.width/12-70,eyeEvil1.height/12);
  image(eyeEvil1,0,0,80,80);
  popMatrix();

 
  ////////////////////////
   //Iris2
  pushMatrix();
  float angle2 = (atan2(mY-width/2,mX-height/2))
  -HALF_PI;
  translate(width/2,height/2);
  rotate(angle2+HALF_PI);
  translate(eyeEvil2.width/12-70,eyeEvil2.height/12);
  image(eyeEvil2,0,0,80,80);
  popMatrix();
  
  
  /////////////////////////////
   //Iris3
  pushMatrix();
  float angle3 =(atan2(mY-width/2,mX-height/2))
  -HALF_PI;
  translate(width/2,height/2);
  rotate(angle3 - TWO_PI/2);
  translate(eyeEvil3.width/12-70,eyeEvil3.height/12);
  image(eyeEvil3,0,0,80,80);
  popMatrix();
  
  
  //////////////////////////
   //Iris4
  pushMatrix();
  float angle4 = (atan2(mY-width/2,mX-height/2))
  -HALF_PI;
  translate(width/2,height/2);
  rotate(angle4-HALF_PI);
  translate(eyeEvil4.width/12-70,eyeEvil4.height/12);
  image(eyeEvil4,0,0,80,80);
  popMatrix();
  
  
  image(eyebackgroundflip,0,0,600,600);//set the size of the image the same as canvas/window size

}
 

