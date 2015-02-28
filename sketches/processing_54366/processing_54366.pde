
/* Done by Keya Vadgama
YSDN
Winter 2012
Reference: http://www.youtube.com/watch?v=O6QrY_DeBDs&context=C45b8c5eADvjVQa1PpcFNAy0bKrfNL4d8oz572tMxblJUPPJ8qIvg=
*/
 
 
 
 float xPos;
 float yPos;
 
 float xVel = 2;
 float yVel = 3;
 
void setup() {
   size(250,250);
   smooth();
   xPos = width/2;
   yPos = height/2;
}

void draw() {
  background (0);
  xPos = xPos + xVel;
  yPos = yPos + yVel;
  
  if (yPos + 30 > height || yPos - 30 < 0 ){
      yVel = yVel * -1;}
      
   if (xPos + 30 > width || xPos - 30 < 0 ){
      xVel = xVel * -1;}

  fill(0, 122, 255);
  noStroke();  
  ellipse(xPos/4,yPos/4,15,15);
  
   fill(255, 0, 116);
  noStroke();  
  ellipse(xPos/2,yPos/2,30,30);
  
   fill(255, 242, 0);
  noStroke();  
  ellipse(xPos,yPos,60,60);
   
  
}

