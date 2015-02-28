


//Trig Variables:
float rr, thetaB;
float r, that;
//variables for moving box:
int xPos;
int ixPos;
int yPos;
int iyPos;
int dirX;
int dirY;
int idirX;
int idirY;
//for second stroke:
int iixPos;
int iiyPos;
int iidirX;
int iidirY;
//third stroke:
int iiixPos;
int iiiyPos;
int iiidirX;
int iiidirY;
int dirX1;
int dirY1;



//Ellipse variables:
int ellipX;
int ellipY;

float x,y,iangle;

float xr,xtheta;

//********************************SETUP*****************************************
void setup(){
  colorMode(HSB, 360,100,100);
  size(600, 675);
  background(54,61,99);
  
  r = 155;
  that = 0;
  
  xr = 90;
  xtheta = 0;
  
  rr = 78;
  thetaB = 0;
  
  x=0;
  y=0;
  iangle=0;
 
//blue horizontal lines
//code for for loop lifted and modified from "Learning Processing"
  int x = 0;
  int spacing = 20;
  int len = 600;
 
  for(int y = 75; y < 800; y+=spacing){
    stroke(231,90,90);
    line(x,y,x+len,y);
  }
 
//pink vertical lines
  stroke(347,33,100);
  line(80,0, 80, height);
  line(83, 0, 83, height);
 
//variables defined for purple box
   xPos = 0;
   yPos = 0;
   dirX = 1;
   dirY = 1;
   ixPos = 0;
   iyPos = 0;
   idirX = 1;
   idirY = 1;
//variables for second box:
   iixPos = 342;
   iiyPos = 297;
   iidirX = 0;
   iidirY = -1;
 //variables for the third:
   iiixPos = 342;
   iiiyPos = 295;
   iiidirX = 1;
   iiidirY = 0;
   dirX1 = 1;
   dirY1 = 1;
 
 
}

//**********************************DRAWING******************************************
void draw(){
  println("x:"+ mouseX + "y" + mouseY);
 
//Box movement
  strokeWeight(7);
  fill(0);
  stroke(random(0,150));
  rect(xPos, yPos,45,45);
  xPos += dirX;
  yPos += dirY;
  
  float xx = r * sin(that);
  float yy = r * cos(that);

  if(xPos >= 382){
   
  rect(iixPos, iiyPos, 18,18);
  iixPos += iidirX;
  iiyPos += iidirY;
  if(iiyPos <= 80){
  iixPos += 1;
  iiyPos = 80;
  }
    
  rect(iiixPos, iiiyPos, 18,18);
  iiixPos += iiidirX;
  iiiyPos += iiidirY;
  
  }
  if(iiixPos >= width-35){
    iiidirX = 0;
    iiidirY = -1; 
 }
      
  if(xPos > width){
    dirX = -1;
    dirY = 0;
//For loop pattern preceeding moving box
    int j = 0;
    int spacingA = 5;
    int len = 100;
      for(int i = 0; i < 650; i += spacingA){
        stroke(240,90,70);
        smooth();
        strokeWeight(2);
        line(i-24, 580,i, 550 +len);
      } 
    }
    if(xPos<0){
      dirX = 0;
      dirY = -1;
//Right Triangle:
      noFill();
      strokeWeight(7);
      stroke(random(320,360),100,100);
         triangle(50,95, 530, 580, 50, 580);
//Trig Boxes: 
    //1:
         pushMatrix();
         translate(70,537);
         iangle += 144;
         x = 20* cos(radians(iangle)*sin(radians(iangle)));
         y = 20* sin(radians(iangle));
         rect(x, y,24,24);
         popMatrix();
      }
    //2:
        if(xPos <= 0 && yPos <= 20){
        float xo = rr * cos(thetaB/5);
        float yo = rr * sin(thetaB/9);
        pushMatrix();
        translate(-4,-29);
        noStroke();
        fill(random(200,300), 100, 100);
        rect(xo + 200, yo + 450, 16,16);
        thetaB += 8;
        popMatrix();
//Ellipse:        
         fill(random(0,360));
         ellipse(ellipX++, ellipY++, 12,12);
         ellipX += 0;
         ellipY += 0;
         if(ellipX >= width){
//Trig Box 3:
           translate(252,-16);
           
           float x1 = xr * cos(xtheta/5);
           float y1 = xr * sin(xtheta/9);
           fill(random(20,50), 100,100);
           rect(x1 + 200, y1 + 200, 24,24);
           xtheta += 7;
         }
                   
        }

  

}

