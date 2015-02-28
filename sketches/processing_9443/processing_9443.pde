
PImage lamb1;
PImage lamb2;
PImage sweetie;
PImage bunny1;
PImage bunny2;
PImage teamsters;
PImage teamsters2;

PFont goth;


void setup(){
  size(640,480);
  smooth();
  background(166,34,128);

  lamb1= loadImage ("lamb1.png");
  lamb2= loadImage ("lamb2.png");
  sweetie= loadImage ("sweetie.png");
  bunny1= loadImage ("bunny1.png");
  bunny2= loadImage ("bunny2.png");
  float z= random (0,100); 
  if (z<50) {
  teamsters= loadImage ("teamsters.png");
  } else if (z>50) {
  teamsters= loadImage ("teamsters2.png");
  }

  goth= loadFont ("LetterGothicStd-75.vlw");

noLoop();
}

void draw(){
  float r= random(0,100);
  if (r< 50) {

  background(166,34,128);
  } else if (r>50) {
    background(240,128,184);}
  


pushMatrix();
float angles= random(-10,20);
rotate(radians(angles));
  image(lamb1,3,5);
  popMatrix();

pushMatrix();
float angless= random(-20,20);
translate (478,13);
rotate(radians(angless));
  image (lamb2, 0,0);
popMatrix();
  
  pushMatrix();
  translate (320,240);
  float angle= random(-90,90);
  rotate(radians(angle));
  image (sweetie,-sweetie.width/2, -sweetie.height/2);
  
  float scale= random(20,40);
  popMatrix();
  
  pushMatrix();
 float j= random (0,100);
 if (j<50){
   translate(0,-200);
 }
   
  image (bunny1,20,215);
  
  image (bunny2, 450,215);
  popMatrix();
  
  
 
    
   image(teamsters, 190,282);
  
    
  
 
  
pushMatrix();
fill(0);
  textFont (goth);
 float t= random (0,20);
 if (t<10){
  textSize(45);
  text ("Vintage Ceramic Animals", 15,460);
 } else if (t>10){
 textSize(100);
 text ("Vintage Ceramic Animals", 0,0,460,height);
 }
  
  



}






