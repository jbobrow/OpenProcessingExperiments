
//Assignment 1 Part A
//rotating iris
//lucy processing
//"I spy with my little eye..."

//This piece entitled "I spy with my little eye..." explores an external transformation
//witnessed by an individual of the earths destruction due to the rise of the machine and industrialisation. 
//This transformation is seen through the rotation of different iris'(images i created in photoshop) which
//show the gradual change from a healthy earth full of trees and birds, to a dying earth full of pollution 
//and human made buildings. However depending on whether the user moves the images clockwise or anti closkwise
//they may "turn back" the transformation or simply witness the destruction themselves.
//It is both a comment on humans growing reliance on technology and on humans gradual destruction of the 
//environment. The piece is relevant for current times due to growing concern for climate change and global 
//warming; and particular to Australia the implementaion of the Carbon Tax.

//Code for the rotation sourced from http://www.openprocessing.org/visuals/?visualID=7943, in which 
//a ballerina transforms into a flower with a movement of the mouse



PImage eyeTrees1;
PImage eyeTrees2;
PImage eyeTrees3;
PImage eyeTrees4;
PImage eyeBackgroundNew;


void setup(){
  size(600,600);
  frameRate (50);
  smooth();
  
  eyeTrees1 = loadImage("eyeTrees1.gif");//make sure they're named the same as your files!
  eyeTrees2 = loadImage("eyeTrees2.gif");
  eyeTrees3 = loadImage("eyeTrees3.gif");
  eyeTrees4 = loadImage("eyeTrees4.gif");
  eyeBackgroundNew = loadImage("eyeBackgroundNew.gif");
  
}
  
void draw(){
  
  float mX = mouseX;
  float mY = mouseY;
  background(255);
   
  ////////////////////////
   //Iris one
  pushMatrix();                                 //pushMatrix and popmatrix allow a bit of programming to                                     
  float angle =(atan2(mY-width/2,mX-height/2))  //only affect a certain area not the whole document
  -HALF_PI;                                     //This was sourced from "Transform" the link is above
  translate(width/2,height/2);
  rotate(angle);
  translate(eyeTrees1.width/12+20,eyeTrees1.height/12+60);
  image(eyeTrees1,0,0,80,80);
  popMatrix();

 
  ////////////////////////
   //Iris2
  pushMatrix();
  float angle2 = (atan2(mY-width/2,mX-height/2))
  -HALF_PI;
  translate(width/2,height/2);
  rotate(angle2+HALF_PI);
  translate(eyeTrees2.width/12+20,eyeTrees2.height/12+60);//the numbers added after width/12 may vary depending
  image(eyeTrees2,0,0,80,80);                             //on the size and positioning of your images.
  popMatrix();
  
  
  /////////////////////////////
   //Iris3
  pushMatrix();
  float angle3 =(atan2(mY-width/2,mX-height/2))
  -HALF_PI;
  translate(width/2,height/2);
  rotate(angle3 - TWO_PI/2);
  translate(eyeTrees3.width/12+20,eyeTrees3.height/10+60);
  image(eyeTrees3,0,0,80,80);
  popMatrix();
  
  
  //////////////////////////
   //Iris4
  pushMatrix();
  float angle4 = (atan2(mY-width/2,mX-height/2))
  -HALF_PI;
  translate(width/2,height/2);
  rotate(angle4-HALF_PI);
  translate(eyeTrees4.width/12+20,eyeTrees4.height/12+60);
  image(eyeTrees4,0,0,80,80);
  popMatrix();
  
  
  image(eyeBackgroundNew,0,0,600,600);

}
 

