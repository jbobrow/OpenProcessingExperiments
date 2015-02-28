

PImage ariel;

int posX;
int posY;

int myBlue1;
int myBlue2;
int myBlue3;
int myBlue4;
int myBlue5;
int myBlue6;

int [] myxPosArray  = {0,0,0,0,0,0};

void setup() {
  size(600,606);
  
   ariel = loadImage("http://4.bp.blogspot.com/-q0NgiNOjigs/UIZ_IordeMI/AAAAAAAAQkw/l_AcLFcqL_o/s400/ariel-little-mermaid.gif");
   
   posX = 0;
   posY = 0;
   
   myxPosArray[0] = 0; 
   myxPosArray[1] = 0; 
   myxPosArray[2] = 0; 
   myxPosArray[3] = 0; 
   myxPosArray[4] = 0; 
   myxPosArray[5] = 0; 
    
  }

void draw() {
  background (40,100,255);
    pushMatrix();
  if (mousePressed) {
    background(0);
    fill(255);
    stroke(150,255,0);
    strokeWeight(5);
    ellipse(50,myxPosArray[0],50,50);
    ellipse(400,myxPosArray[1],100,100);
     ellipse(300,myxPosArray[2],30,30);
      ellipse(300,myxPosArray[3],30,30);
         ellipse(500,myxPosArray[4],10,10);
           ellipse(50,myxPosArray[5],60,60);
  } 
  else {
    ellipse(50,myxPosArray[0],50,50);
    ellipse(400,myxPosArray[1],100,100);
     ellipse(300,myxPosArray[2],30,30);
 ellipse(300,myxPosArray[3],30,30);
    ellipse(500,myxPosArray[4],10,10);
      ellipse(50,myxPosArray[5],60,60);
  }
  popMatrix();
  
  
  myxPosArray[0] += 2;
  myxPosArray[1] += 2;
  myxPosArray[2] += 5;
  myxPosArray[3] += 2; 
  myxPosArray[4] += 2; 
  myxPosArray[5] += 3; 
  
   stroke(40,190,255,150);
   fill(40,190,255,150);
   strokeWeight(2);
   ellipse(50,myxPosArray[0],50,50);
   
   stroke(40,190,255,150);
   fill(40,190,255,150);
   strokeWeight(3);
   ellipse(400,myxPosArray[1],100,100);
   
   stroke(40,190,255,150);
   fill(40,190,255,150);
   strokeWeight(2);
   ellipse(300,myxPosArray[2],30,30);
   
    stroke(40,190,255,150);
   fill(40,190,255,150);
   strokeWeight(2);
   ellipse(300,myxPosArray[3],30,30);
   
    stroke(40,190,255,150);
   fill(40,190,255,150);
   strokeWeight(2);
   ellipse(500,myxPosArray[4],10,10);
   
    stroke(40,190,255,150);
   fill(40,190,255,150);
   strokeWeight(2);
   ellipse(50,myxPosArray[5],60,60);
  
   
   
  if(myxPosArray[0] > 700) {
  myxPosArray[0] = 10;
  
if(myxPosArray[1] > 700)
myxPosArray[1] =20;

if(myxPosArray[2] > 700)
myxPosArray[2] = 2;

if(myxPosArray[3] > 700)
myxPosArray[3] = 10;

if(myxPosArray[4] > 700)
myxPosArray[4] = 2;

if(myxPosArray[5] > 700)
myxPosArray[5] = 20;


    
  }
  
  
  if (posX > width) {
    posX = 250;
    
  } else {
    posX++;
    
    
  }
  
  image (ariel,mouseX,mouseY);
}


