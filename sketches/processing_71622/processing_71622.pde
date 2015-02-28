
float eyeWidth = 20; 
float eyeHeight = 20;
float faceWidth = 100; 
float faceHeight = 150; 
float r = 255;
float g = 255;
float b = 255;
float mouthWidth = 20;
float mouthHeight = 20;

 
void setup(){
size (500,500);
}
 
void draw(){
  background(255);
  stroke (255);
//face 1
  fill (r,g,b);
  ellipse (width/4, height/4, faceWidth, faceHeight); 
 
  float eyeL1X = width/4 - faceWidth*0.25;
  float eyeR1X = width/4 + faceWidth*0.25;
  fill (r,b*3,g*2);
  ellipse (eyeL1X, height/4, eyeWidth, eyeHeight); 
  ellipse (eyeR1X, height/4, eyeWidth, eyeHeight); 

  float mouthL1X = width/4;
  float mouthL1Y = height/4 + faceWidth*0.15;
  arc (mouthL1X, mouthL1Y,mouthWidth,mouthHeight,0,PI);

//face 2
  fill (r-30,g-30,b-30);
  ellipse (width*3/4, height/4, faceWidth-15, faceHeight-10); 
 
  float eyeL2X = width*3/4 - (faceWidth-15)*0.25;
  float eyeR2X = width*3/4 + (faceWidth-15)*0.25;
  fill (r+10,b*3+10,g*2+10);
  ellipse (eyeL2X, height/4, eyeWidth-2, eyeHeight-2); 
  ellipse (eyeR2X, height/4, eyeWidth-2, eyeHeight-2);
  
 fill (r+20,(b*3),(g*2));
  float mouthL2X = width*3/4;
  float mouthL2Y = height/4 + faceWidth*0.15;
  arc (mouthL2X, mouthL2Y,mouthWidth,mouthHeight,0,PI);
 
  
//face 3
  fill (r-60,g-60,b-60);
  ellipse (width/2, height/2, faceWidth-30, faceHeight-20); 
 
  float eyeL3X = width/2 - (faceWidth-30)*0.25;
  float eyeR3X = width/2 + (faceWidth-30)*0.25;
  fill (r+20,b*3+20,g*2+20);
  ellipse (eyeL3X, height/2, eyeWidth-4, eyeHeight-4); 
  ellipse (eyeR3X, height/2, eyeWidth-4, eyeHeight-4);
  
  fill (r+40,(b*3)-20,(g*2)-20);
  float mouthL3X = width/2;
  float mouthL3Y = height/2 + faceWidth*0.15;
  arc (mouthL3X, mouthL3Y,mouthWidth,mouthHeight,0,PI);
 
  
//face 4
  fill (r-90,g-90,b-90);
  ellipse (width/4, height*3/4, faceWidth-45, faceHeight-40); 
 
  float eyeL4X = width/4 - (faceWidth-40)*0.25;
  float eyeR4X = width/4 + (faceWidth-40)*0.25;
  fill (r+30,b*3+30,g*2+30);
  ellipse (eyeL4X, height*3/4, eyeWidth-10, eyeHeight-6); 
  ellipse (eyeR4X, height*3/4, eyeWidth-10, eyeHeight-6);
  
  fill (r+60,(b*3)-40,(g*2)-40);
  float mouthL4X = width/4;
  float mouthL4Y = height*3/4 + faceWidth*0.1;
  arc (mouthL4X, mouthL4Y,mouthWidth-4,mouthHeight-4,0,PI);
 
  
//face 5
  fill (r-120,g-120,b-120);
  ellipse (width*3/4, height*3/4, faceWidth-60, faceHeight-50); 
 
  float eyeL5X = width*3/4 - (faceWidth-45)*0.25;
  float eyeR5X = width*3/4 + (faceWidth-45)*0.25;
  fill (r+40,b*3+40,g*2+40);
  ellipse (eyeL5X, height*3/4, eyeWidth-12, eyeHeight-8); 
  ellipse (eyeR5X, height*3/4, eyeWidth-12, eyeHeight-8);
  
  fill (r+100,(b*3)-60,(g*2)-60);
  float mouthL5X = width*3/4;
  float mouthL5Y = height*3/4 + faceWidth*0.1;
  arc (mouthL5X, mouthL5Y,mouthWidth-6,mouthHeight-6,0,PI);
  
  

}
 
void mousePressed(){
  faceWidth  = random (100,  180); 
  faceHeight = random (100, 180); 
  eyeWidth = random (14, 20);
  eyeHeight    = random (14,  30); 
  r = random (255);
  b = random (255);
  g = random (255);
}
