
///////////////////////
float xmag, ymag = 0;
float newXmag, newYmag = 0;
////////////////////////

 float baseRad=20;
 //height of cone
 float coneHeight=100;
 
//base center
float baseCenterX, baseCenterY;


int i=1;

//rotating purposes
float turn=1;

Cone coneOne;


void setup(){
  size(800,800,P3D);
  coneOne=new Cone();
  smooth();
  lights();
  
 
}

void draw ()
{
  
  background(0);
  
  /////////////////////////////////////////////////
  pushMatrix();
  translate(400,400);
  newXmag = mouseX/float(width) * TWO_PI;
  newYmag = mouseY/float(height) * TWO_PI;
  
  float diff = xmag-newXmag;
  if (abs(diff) >  0.01) { xmag -= diff/4.0; }
  
  diff = ymag-newYmag;
  if (abs(diff) >  0.01) { ymag -= diff/4.0; }
  
  rotateX(-ymag); 
  rotateY(-xmag);
  /////////////////////////////////////////////////
  
  
  
  stroke(255,255,255);
  line(0,0,0,400,0,0);
  
  
 noStroke();
 
 pushMatrix();
 fill(255,0,0);
 coneOne.conePoints(0,coneHeight, 0 , 0);
  for(int rotX=0; rotX<=7; rotX++)
   {
    coneOne.conePoints(0,coneHeight, 45, 0);
   }
 popMatrix();
  
 
  pushMatrix();
  rotateY(radians(45));
  fill(0,255,0);
   coneOne.conePoints(0,coneHeight, 0 , 0);
   for(int rotX=0; rotX<=7; rotX++)
   {
    coneOne.conePoints(0,coneHeight, 45, 0);
   }
  popMatrix();
  
  pushMatrix();
  rotateY(radians(90));
  fill(0,0,255);
   coneOne.conePoints(0,coneHeight, 0 , 0);
   for(int rotX=0; rotX<=7; rotX++)
   {
    coneOne.conePoints(0,coneHeight, 45, 0);
   }
  popMatrix();
  
   pushMatrix();
  rotateY(radians(135));
  fill(150,0,255);
   coneOne.conePoints(0,coneHeight, 0 , 0);
   for(int rotX=0; rotX<=7; rotX++)
   {
    coneOne.conePoints(0,coneHeight, 45, 0);
   }
  popMatrix();


  
 ////////////////////////////
  popMatrix();
 /////////////////////////// 
  
}




