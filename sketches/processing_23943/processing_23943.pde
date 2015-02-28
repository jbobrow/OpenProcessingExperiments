

//declared variables
int circleSize = 0;
int circleX=100;
int circleY=100;

float eyeR;
float eyeG;
float eyeB;

float zoogX;
float zoogY;

 void setup(){
   smooth();
  size(200,200);
   background(mouseX,0,mouseY);
   zoogX = width/2;      // variables for moving zoog/ bluberry.
  zoogY = height + 100; // 
  smooth();
}
  

 
 void draw(){
   
   ellipseMode(CENTER); //centermode
   
//floating circles
   for (float w = width; w > 0; w = w - 15) {
    stroke(0);
    fill(mouseX,0,mouseY);
    ellipse(width/2,height/2,w,w);
  } 
    fill( mouseX,100,mouseY);
     ellipse(circleX,circleY,circleSize,circleSize);
       circleSize = circleSize + 1;
   
   
   stroke(0);
   fill(mouseX,0,mouseY);

//bluberry structure 
   ellipse(zoogX, zoogY,110,110);// head
     fill(mouseX,0,mouseY);
   ellipse(zoogX,zoogY-30,25,32);//EYES
  ellipse(zoogX+19,zoogY-30,25,32);//EYES
  
  fill(mouseX,200,mouseY);  
  
  
eyeR = random(255);// random fill for bubbles
  eyeG = random(255);
  eyeB = random(255);
  fill(eyeR,eyeG,eyeB); 
ellipse(zoogX,zoogY-10,5,5);//bubble
ellipse(zoogX,zoogY-50,5,5);//bubble
ellipse(zoogX-30,zoogY-5,10,10);//bubble
ellipse(zoogX-40,zoogY-20,10,10);//bubble
ellipse(zoogX+30,zoogY-5,10,10);//bubble
ellipse(zoogX+40,zoogY-20,10,10);//bubble



ellipse(zoogX+19,zoogY-30,15,22);//inside right
ellipse(zoogX,zoogY-30,15,22);//insideleft
fill(255);
ellipse(zoogX+19,zoogY-30,5,12);//insidesinsideright
ellipse(zoogX,zoogY-30,5,12);//insideinsideleft
fill(0);
ellipse(zoogX+1,zoogY+10,15,22);//innermouth
fill(255);
ellipse(zoogX+1,zoogY+10,5,12);//innermouth

zoogY=zoogY-1;// moving speed formula
zoogX= zoogX + random(-5,5);
  
 }
 
 

