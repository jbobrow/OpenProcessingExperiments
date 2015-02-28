
//remember mousePressed
int timeDelay=120;

float[] xPos = new float[timeDelay];
float[] yPos = new float[timeDelay];

 PImage b;

void setup() {

 for (int i=0; i<timeDelay; i+=1) {
    xPos[i] = 0; 
 }
 for (int j=0; j<timeDelay; j+=1) {
   yPos[j] = 0;
 }

  size(640, 480);
      
  b= loadImage("Eyes.png");
  image(b, 0, 0, 640, 480);



}


void draw() {

  background(255);
   for (int i=timeDelay-1; i>0; i-=1) {
      xPos[i] = xPos[i-1]; 
   }
   for (int j=timeDelay-1; j>0; j-=1) {
     yPos[j] = yPos[j-1];
   }

   xPos[0] = mouseX;
   yPos[0] = mouseY;
   smooth();
   fill(#FF0012);
  float newX = xPos[timeDelay-1];
  float newY = yPos[timeDelay-1];
  if (newX<280) newX=280;
  if (newX>361) newX=361;
  if (newY<195) newY=195;
  if (newY>243) newY=243;
  
  
   ellipse(newX-125, newY, 40, 40);
   fill(0);
   ellipse(newX-125, newY, 15, 15);
   fill(#FF0012);
   ellipse(newX+125, newY, 40, 40);
   fill(0);
   ellipse(newX+125, newY, 15, 15);
   
   image(b, 0, 0, 640, 480);
   

  //normally 265 mb max mem

}






